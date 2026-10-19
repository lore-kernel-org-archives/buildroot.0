Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD052606A31E
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=APx7o9wk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2D7B406AC;
	Mon, 19 Oct 2026 19:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTyRJU3bkg74; Mon, 19 Oct 2026 19:32:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6AC7A40577
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438342;
	b=esxODE/eAIu2oW1WqSDZ0WQKdPd9/4taqZn3Uoyg5xamKIscVjSEogtFOStuRrG2zL6W
	 xVBhg9vfgav3PimXOlFVHZ/mvF8NGGPViN4tcZaD2WGp0mbLwiW2QDJle5a4zZZ7VSnYa
	 7HD6BLG9XcrJ2TJckvkqAdZZU509ElGUbhpY3Il/MuOqM2Oh+8H2SgJpDj6pIv9fcSec9
	 luKXKXiNBENLxdWSx0Q8o6FSixTfJyfZUxA9ugWiQ24BIqU5OH1kdt3N2j8PqFDoUpiT9
	 cOHW2tBOEMqOlyu+hzqzqQXsg4/8XICNcEW5Ln3ELOssWhSaIgkpaerHXqZPIq98szw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438342;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=sCc9xuvPzgHq6+bxpDyzbB81cp3EvWzNOE/YPDRSxmk=;
	b=bXeHe8hiXuSJkeszNJi1Un5BvFTiwZwDxs2zduxjP9EYrs5XsN7KO9x3n1ri/Ci9tG8u
	 lzhxWVcAPnn/Bid4ieJ3Ay31UMUxTXzEFLLDZvnkfh7IyQohTAoPlmNGPLXGz/FQF3JjD
	 9Ns0o9nzu/DCnPkEr4JFA22HqL0NBu22bj8JZxbreU2ETFZsKDswSDcADtpnkOkI4pAnd
	 FqDHYDk/v0O5Z0TXoF8BMq3EaGO1XekQ6vWlHjXe0whUXPNpqzn7IA7Q1WXJWLQg51kzW
	 v1WqupzdNZirb2WqTQ7STVMD9NiOMopEMYlVQ1RbBPoEae2gF/QGKfZ7nWzT1i+EZbg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438342;
	bh=sCc9xuvPzgHq6+bxpDyzbB81cp3EvWzNOE/YPDRSxmk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=APx7o9wkeu5wo7PuUnSOUvbKdji1BRHCyIJkhSlzmt0VqqXscrEjmFRMzcOWZCk6q
	 IXw3ra4bIYEE+rWbwkPtr71LJptUocz/qplmqQdVqvyIsXAje5+UEv6NTYBUGxzEpY
	 3KSPSJa2QxAz4k/tnaDMwR1wWUD9jW77Yj++6skPo0AXO04ngkBenPm815KrAkKLzY
	 vmyxCHpOZEsFSnlw1/rixOuXz1hUvucc9gBQ5vlhpMleUuyL7x20nF1jiaGP3Yt+H0
	 x3WYFMjtHKXsEO0lmY4OHAfOIU4gA/jsEifkgXqeUUDDUZG/lVtr1yItzFCEK7Z9F1
	 3vfuhW8BfmVvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC7A40577;
	Mon, 19 Oct 2026 19:32:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 174A81E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07BAF40189
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1u3laEv_OMfC for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:32:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3257E4016F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438339;
 b=jBQjTXbUfKMQv/e85WdbKtRV7AogI6agNTDtaFfE0SqtrJ070fVgSG9QNcfNzHsUwLhQ
 uBp1VmZ/6LUzxO5NCoE6wrLXn96251aVIOeNlB7h1t3GiuRiTj/g+uEEVsctAousBKI/f
 WD2Dzp4xP7O+XkQsIiPH0u2XkWMIFXsPmZQTPgHNQgnZtufngDB1p2BIW8B6VjCXcY/gp
 zFwpNJoqX95TSct/5bEz2EXxCl+KWQIYR5Jj9B5idf0+CJ+hFFfe/9IVXmmpigs7udObX
 uCEi3OkmGLJhWgFgtDjSBc2/ElRmhNRTXiie9OffX8GSWs2cn4oyJZ505bUVsRrJYNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438339;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=zG2JDUhME0+1ixlOY1n2wWR34Ie2ApcgvKSV5EnQc0A=;
 b=FNw5CBwyp1nd/AEZQB9SVlrYih/XY5/09iZDAgvxKTmSFL25RZBOx0l2RnmGuFbwYdIR
 yDbcAKY48Wm9YIlSHwuXajYrHk+ZcUv5ud3wgdug4OSTaC36lCj/hzR2wbrU/W0J5JWCo
 BxRbwG6Kh2OkDy/hLXCsi5AHqbIt/L00xd6UCL/JAjEvSwROKvBoWaW604nxOlfVLQE4J
 4MmZLWUWkIy+T02dhxf2vhkIhJXKVz43rhN2FpMBoP159G4aG6XBJJheKobh07xXGyDpa
 O/puzlA9u5g7kI+iU1jSW2WVU4wtGTxmD8LPnfKlZnwaHVdDwZtn073nY/GwDF7Lm8g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tshUKaKm; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3257E4016F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:32:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 01D3919F574;
 Mon, 19 Oct 2026 21:32:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 19 Oct 2026 21:32:11 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 21:32:11 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
In-Reply-To: <20261014214701.537626-1-thomas.petazzoni@bootlin.com>
References: <20261014214701.537626-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <0aa21c865c50b8dac43991d43719c311@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/mender-update-modules: add missing
 BR2_USE_MMU dependencies
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 14/10/2026 23:47, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM selects BR2_PACKAGE_RPM without
> replicating its BR2_USE_MMU dependency.
> 
> BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU selects BR2_PACKAGE_SWUPDATE
> without replicating its BR2_USE_MMU dependency.
> 
> This commit fixes that by properly propagating the missing
> dependencies. There is in practice no functional change:
> BR2_PACKAGE_MENDER_UPDATE_MODULES depends on
> BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS and go is only supported on
> MMU-capable CPU architectures. But since there is no formal
> relationship between BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS and
> BR2_USE_MMU, automatic validation cannot infer that
> BR2_PACKAGE_MENDER_UPDATE_MODULES cannot be selected on !MMU systems.
> 
> Fixes: a474642fdcd8c69e12126bbe8304479aa855d916 
> ("package/mender-update-modules: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
