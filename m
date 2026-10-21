Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E62606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 15:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WE2wiGSZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3DBB6087B;
	Wed, 21 Oct 2026 15:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zzs_VLY2Wjiq; Wed, 21 Oct 2026 15:20:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AC4CF6084A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792596048;
	b=L0iLbD4MqTIKYhwauPa+Eif+OHtPJYac8NYhXT8hSIDNTdafww5shheKuXD9KBUvZ38u
	 suTRf3P9Zm1Jo3mffcEN9lTuOVhkOaUZLGTK+buj93kYmwaK5hOS2JtTSeLmY06wJKG1E
	 mR/10BzZHlEnJIPmFoinY1lN3UA4Dis1ebyEnayI30YJvTAhjvDaS7RZ6driypecrn+Bn
	 O5TO0k1zfzUPQJblW7dfaG+Rrj9Lyj970Idf0eOK7qjcetjQANhDBdaudbfGkXDhc1nwn
	 X9OzDxyC1jZdIXuY3Y3I7gAUa0oes9FMrbfykBnY144gewldLcRp/G8DQdAJ7TvEIEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792596048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=hVl6YAJRp0r0OabFhTDbx5R+Vi04SNc3atXIqzBMkWU=;
	b=gsjj5gd6x8u7q21d8IYMhOafvegYWmR1CxDY05i0AJ/ZzLL+kpBd5w2TQwYs+gbmVyNx
	 61CFL89hYdGBIvmh3W0AjZ/xSfpojow0WsJuZoMqjeVAF4ZAUqq0Brd9jguEPMHtTzset
	 YyrOESEY7BTE68gf2lJDtD+So0H083fqiZicQTL77qOSIjeGbreGuUZ/ll+9LHkyrBIrj
	 VBkZ6uMNFvUOMVR9+uL/W6E/g/zzKauhMxYC9n94/zI64efN+NAOEhGFVNCQt0kVbQthD
	 yas46hcDOXTalyKE9hmAzlY2Sur2XQnZNA2x1sTdFOzjRK/gmCTh+uFEl0QDdahuGdQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792596048;
	bh=hVl6YAJRp0r0OabFhTDbx5R+Vi04SNc3atXIqzBMkWU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WE2wiGSZL1BjKNz+ilLHZniMBP10Rw8Ew3v7GHe30uzUI50kkulE/xOGuJuT1x8Jk
	 l/+FseqSsYIU3KLukEzNy9qAHzDY+fqjFK8BhXMVLZiMy6esRSq/KR94qLBSSocbZB
	 gzrgGPMjzYDqW4E5OaH1KBJ1bXUtBjGU0qjPAFvEOm6VEdn/Y9/7bkyBkgl2QUA1VI
	 GJPoxALbowbK31dHYyp0hwnRhiCjm52NaJit/5An3AyQYH/1EWrcDOnLkQfN3hM33Y
	 /LKckjek1PjTZ9KP17xNVil/7mjr5pFEiZg+4opnTOWKBiMVZ2EjAqYJiRiV0oHgSN
	 FNkb4T+VG1ctA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC4CF6084A;
	Wed, 21 Oct 2026 15:20:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4E9595C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 15:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB0564016B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 15:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5w66YBLs8xY for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 15:20:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1C70340077
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792596046;
 b=YWk5wftyth6y183+v6wQ7vUnQMx0rCaV/lkYwkzPi0nH7voSX9GdGBm1Zouk0SHydVhe
 TNtjJzqhbaeXnKJcKI7QQr8zbZuIMl8O6w6AXXr3TepfGQb2ek6aSov99uYvncHafQ51k
 uGxYIwG8A0vXCMw4MTGna9b1HCGgibi/Ae4l7w6ePMlRmktAdqmzOfdoVLDnsZIbw/2Dl
 WoV7L7MtnduHNGhGHChFXLp6W3j6T8U8a1lCJrUPW1PegifugKFnBLO5t/sJgdOA3TPJ+
 O95GQAJ2JzJrIIA100B2YQ01UwN8Fx5lsioI6d8Yjr4nNGfSGgxPO7WFtWWPg9XyVWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792596046;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=TD9sZA74gg6AE5qUKi0JRn4G5SYR2+GxZo9huCdOU18=;
 b=Z1u58JePZ7JNHn/1JzImrWmj/+W09gZaJsOLRrThgPwYI1UD/PJApyeYjXqtVt5NqwYJ
 u3qBGBDC1xu4maQKpPEynTfmxA2lw7MeMCGmtwBFBGJ0lqqe7FWoueQx7D1VZcN5i8Ln6
 vyd/q9xeww3mwfjTyLtAVyQqeOHrx40i59R+pngdHJJ+VfeRy0xrPH0+7NgJYlSLUb20t
 AFl0wbTvXrJV8sRvHV1AdivCl7NYZyLSQ+NuWDIXMvZNSExMEMQwaxy8mTSI0qKt/uajv
 Hx4QOYLiKq9dpbP4qqLohtNSmL/FxEP/tjSRdQE+bHrKgpQY9eFlJpAYEr8jCwWMySw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ofj411w7; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C70340077
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 15:20:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1121813F879;
 Wed, 21 Oct 2026 17:20:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 21 Oct 2026 17:20:39 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 17:20:39 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20261021143606.428870-2-thomas.perale@mind.be>
References: <20261021143606.428870-1-thomas.perale@mind.be>
 <20261021143606.428870-2-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.20
Message-ID: <de355f4f2de522615bb6e5aec87bbbc7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump to v8.5.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/10/2026 16:36, Thomas Perale via buildroot wrote:
> This release include fixes for critical remote code execution
> vulnerabilities:
> 
> - https://www.php.net/archive/2026.php#2026-10-21-5
> 
> See the release notes: https://www.php.net/ChangeLog-8.php#8.5.12
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-109618: 
> https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w
> - CVE-2026-109619: 
> https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
