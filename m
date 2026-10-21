Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3F4606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MEA+GIZU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7279C40EED;
	Wed, 21 Oct 2026 19:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kf-0ll_-ruwY; Wed, 21 Oct 2026 19:27:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 87396409F2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610831;
	b=cJ5DJ09QUgA1smCi6/qmiy8F70+bbBjKkPQabBrYCzRwfStz/4eDI50Kzj58XqpzYFkn
	 U5EJDCxAfuewEUXGAl0rEyMxAzE8LiwlnkuEU4dOIMbb/ZrQQb5GnvZgVQb4DVj+M8ci0
	 OjF0avtLor4RdBMf3eIBdeWrUH7yWdihP+zOp4sKWcsKbnmp4UZGFHlSSN1fgF/uVVr/v
	 Y3wpNa8/LXDuQkUd7D7CcO7T42k4EVVDNAV1ApeeQwOL+//uLb/ZFcBbdPi1oPtKoEI2T
	 U8OviCObZbrTNqjlidylps8OQjtLvV2AQjnFdWzQREJNtY4y4WtJwWYawTXlrjDD2DA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610831;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=2lCdFMVB/oLwgacnzBT/3mlJA5H4KB3/ibeu/lozeWs=;
	b=gJTYVgqZbdNcm8EoQUtDrhdR9p9nY3RPHZHp5g84zlwrkAHaZhIK0hXKts3Cua3WjXbk
	 fSLU68K+i5NGHG7/LSBdXEtqEejdz+u06oJNjxg+2isPQwGvAlxU81AtBPKCMkwEtgZa8
	 mxEZLo9u4XtQysfGbS8kaVUYexc4ZfwQpNom+Nm7YPw2TqREcCrPsVqd7ga0sI3LkL1we
	 n2CSfC0hI3Z8aJLsjWXRIvmhiKnGuokMQWH+EzjvmQ/CsvHurv2sc3sYmnY0qBuh2aDNX
	 dzvtpzsCp5uMbB8z4Vi95yj+R9tPviK/ohF1JMzf02aVRvp9P25nESRzlm2Vv+dUmcQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610831;
	bh=2lCdFMVB/oLwgacnzBT/3mlJA5H4KB3/ibeu/lozeWs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MEA+GIZUruusnO41o/pV44ztQ6pIjTNzyxpd5fYrhXUzGh9hbBbh63S65GsJzTxbx
	 WPZZyI1VeYVNN1cQlqeXNFF73o9MKaD/9u5+VTDCa4V1weqZUyuse4+34N4qtQgcMW
	 eHZLL6odv2CEk4nx7bzdZ70XUHIiobSA2dcvow5VB85hZAxAqhcK01m3zEqP86DooG
	 v4TYZjngCGmG9psqUT2TaVZxU/DLo14BSQzjgWfaL0eH+uq7MAECaVwIg+NKp6g2Zq
	 l/zU85cFHffppOEuBPen7vCnXR5ouExCFUvp9LL8XroY1OaCMraosod6Zgky4LRLvU
	 a5vt0YvMhEeRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87396409F2;
	Wed, 21 Oct 2026 19:27:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A34863C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89D25403F2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSP0ccSquNfo for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:27:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A24DF40087
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610829;
 b=ALwPEIBoA+rvuhGfLXgcyrnZvsrT9sPiTYhiCbgyC6AVf6NJ4/t8ysMnR0/HXfwaamsU
 ZWCMB42vVuuQBnBhYXx4Pke1n96r6iL7oa9erYLw+Ab0D4ipoHZZeeQ67QMD1P1hWu73v
 sMD4aZdOK6v5JFRRZ9TCdcNByPdhSAoY/Z7QTvm9J7PN9DAw4nxEuJusUgPcCuVQT0oks
 3KiXKoHrZdbWaaiKVz+UBrDlUamjnfMN2wBvuHKdqLD9NDt72xxv8YRR435GVpJUY6t3c
 ys3fARkJafFLzIHwshVkzzfp5HPcNoe1IpFyke0n9h/y8U3BbPwu3R/hBPU6C19AqLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610829;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=VJ2rNhVtYbm7INkHKtmsYp9Zm9HbNeel0wlckGWcFfw=;
 b=m1hxOqgUxm0VpZBlz69/Qw6KlHTXp5lHa13FNgZt2o3+f0rfOGo3qSI2NfNvR/0lPdjH
 6a4E08Whds/+mvtybbPwHklnDhuw6oaY8JtR725BgEFGwq1rktqtDuiFWT6B8cssT/o6D
 rRJPlE4zgzoqVL7v9I5jqW4iv5ghgZwmefTWMyxcR+QGicPcr3c+vv+uYqxNAzdv7nJIm
 x/mTZ6SYMtkZ3EyiTIObmfbvovwblObkCBBn3CTDy3R7Hx/qQ2vSfapj9lXau+eyGE33/
 Kn3nnTarsF6D0DgWqtOrBcWXfmfS3zRvWOfnwbqnTangXsCVrQHNZAjvdaQSeRHhhAA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cppx++70; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A24DF40087
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:27:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 78ED97805EC;
 Wed, 21 Oct 2026 21:27:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 21 Oct 2026 21:27:06 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 21:27:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261021184139.1135207-1-bernd@kuhls.net>
References: <20261021184139.1135207-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <fd26645ed3e28432ad07b2127e5acbfe@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] package/libplacebo: add optional
 dependencies to lcms & xxhash
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/10/2026 20:41, Bernd Kuhls wrote:
> Buildroot commit 006aab8d64d2179d77df9a696b3fd8636f541640 added the
> package at version v7.351.0.
> 
> This version includes optional upstream support for
> 
> lcms, added in v0.5.0:
> https://code.videolan.org/videolan/libplacebo/-/commit/eb14d3bdf22605263a9b6025ed6280eb1515a89a
> 
> xxhash, added in v6.338.0:
> https://code.videolan.org/videolan/libplacebo/-/commit/cb1009d1455e64787e52c5c3b6f7042aa37e5c14
> 
> This patch adds handling of these optional dependencies.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied patch 1 and 3 on master.
I applied the patch proposed in:
https://lore.kernel.org/buildroot/20261021183533.2649298-1-thomas.petazzoni@bootlin.com/T/#u
instead of patch 2 (which does essentially the same fix).

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
