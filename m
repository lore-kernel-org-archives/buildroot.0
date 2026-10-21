Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88340606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=moE7IYpP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5176D70695;
	Wed, 21 Oct 2026 18:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDmczDJh0r03; Wed, 21 Oct 2026 18:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AAEE3705CF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792608846;
	b=HrmWHQEwmJ/D1U8SA2ScKtGJP3e+8L2hi+2MQNcFwDuVC/JZVmZuDss83WD4yolMWUgy
	 9UuHpngv1OWL+9x3bgsxJWbovh5LYzSHQIWMcyoi6mF6S1tMZenbuAIuIdsssmqyb+BXN
	 e5e/JJI61Usy1HYyH9KTqORK/2pzubIkg8RqpvOpg7y+tuzLWjrCGJotGAs75Z6SjQo9i
	 kOUerKFM65XznBioVVL5ZzZSMByF4NNb+vf78Qbt1LxVj5ovuKgNhCSWS/JBUWnuJ8t+T
	 eZrTJ/QKkVkF5C6sAeAY/rSb6OQIBBQQ4lQETaNkFQpi6Yw9fLABbbx20LldRMR3ukg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792608846;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wxk1N/FBnpAGo+lt2OiA2xffA/nH0GmjdXE0JKn8aqE=;
	b=GIed499UZifdT1P8jLHYlhmBpa3jzact/4EsVNQMozRud+5kan6eiNS3aiYN2RnHAwZ3
	 zQgcIZo+lgJpbaDaKZVIJJZxzlXyiPuG6yn+3rE+Cs9TY5mZgzU2LIWlOo+ghY2prz5bI
	 z+aUZ2XIGV1Lv4paAYeTyWWmSuCSGhD9F+pxQ1rNOt7B5SlFbPfpbfeWxkHKnYXsPb7Jq
	 JUiTsZpUCUDPs31I6WCc7eGUN750SY2SnMr0eJlc+pz8l8ESvNDeNtClg0NkrWye1URP8
	 W5cEg2pyyuqVd8kkVNwsdNuGG2nvR7FM45DK8Y2hhJhzCqQW4/SLbGJ81HTtnRzZsfQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792608846;
	bh=wxk1N/FBnpAGo+lt2OiA2xffA/nH0GmjdXE0JKn8aqE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=moE7IYpPR2X9TUHJWKGEn3u0OsTHGyGaVfIsrRwZNR5QFTMnl28GGbSD8W6A30CxO
	 RufPna/w14K7JM/879+3OqPp72VaI6k5eQoLWFpAkvE1st8pYyVDTaLaKDy7RbK4E/
	 EntFQg5GxjUkii3wL8j0FL/TBpOKQGFy93ij0DKQLz/ILvoo2NoM0/BT1RcAxuUKn/
	 XSAjiPFBYGWdwmx+pU0sInucMX9tedMMzXDw8YM9A9NJHbecTv3+ZEG2HH3u6Uojq5
	 xQLs3gfwLXYWyeF9ofA7MFt7zR3ergd5iuCUCBjvTcVAqIv0r9Tnr0eiZsGU0AKEPO
	 3Gwm4XHZPMpOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAEE3705CF;
	Wed, 21 Oct 2026 18:54:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 924A73A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F65640ED6
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C41iXAV7IOLo for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0585A404A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608844;
 b=X0gzHXASZ039qdwfyCEMgCpQ6il2DnLm3FhjZo6IKNDtRzKkkYpRTjil8ZIgNjb2jccw
 rXzorjVkwNBfUoiFH6mrMVLFqfzhazyUvNFkeXLKXmcEQ6rAbI84UT0ymwXD/0zFS/gbs
 AIyCJE7eWSHI1GEHDDRdGWOAFijJ8azxMvsMRSHx+ou6aAKMzpwM40uxymd1Lo1yLjxiG
 hGJAjinkVSSBCtqFP3DHYlydRMYpoOSZS3I1pe2PQSImWzmn7z73jrmh+ZJ0xn8BQtemw
 O8KdFdhZjPvZ0MOaep65F+UO5WMn2xPBmcl2k1Da7vvwNl6qdywXJes1O0/gNs7dfrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608844;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=yWPxPylYDNpaA+I3h+UE8413gt9XYccy9l1Y1nqK9iw=;
 b=EIlnPQiAC9wFepCq6gMA8ymlBJIhGj8BYUvujkdtSmefVI1Cpn1vwff9q6+BhnNMmy95
 f72ytUbqCWz3DjyzOGLLKwLrNFmMiOYRKZbI4MtndIWX6vcqdPP0O7QZOYIoySCHyHtTk
 Dv6F5qJuGVFw9LACoee7XKFIA0xQTYT7+Kk6ogBkSwtI2dRMF4RV7Xd03DnrNJCHMxZqC
 Rfb8hW/H6lPw+LGgLxyM9kSczVz/wucMAbNz3Kq2fRySLEplE+gxYjtkjjGMVEoZzv8XN
 mj5AEXlqBxR2IKbv0XBSkf4T6EWicLYuGdv4m4jvRDbrfSo7vcw4ymooCI6WaYlp/FA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="Mo/bmxwQ"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0585A404A2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:54:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 870C0C5CD6A;
 Wed, 21 Oct 2026 18:54:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6A2A3606E3;
 Wed, 21 Oct 2026 18:54:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 599AA103289F5; 
 Wed, 21 Oct 2026 20:53:53 +0200 (CEST)
Date: Wed, 21 Oct 2026 20:53:53 +0200
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Fiona Klute <fiona.klute@gmx.de>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Message-ID: <atkKPD3elez82VBG@windsurf>
References: <20261021-b4-qrtr-static-v1-1-b980f0bf22e4@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261021-b4-qrtr-static-v1-1-b980f0bf22e4@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/qrtr: fix static build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 10:47:17AM +0200, Igor Opaniuk via buildroot wrote:
> qrtr 1.2 declares libqrtr with shared_library(), so it builds a shared
> library even when Buildroot asks meson for static ones only
> (-Ddefault_library=static). With BR2_STATIC_LIBS=y the tools are then
> linked with -static against libqrtr.so, which fails:
> 
> ld: attempted static link of dynamic object `lib/libqrtr.so.1.2'
> 
> Backport the upstream commit that declares it with library(), so
> default_library decides. It is not part of a qrtr release yet.
> 
> Fixes:
> https://autobuild.buildroot.org/results/d5f669f99f72ee68433bc8a1b1197594f46e8882
> 
> Fixes: 81bec84bfce986a49b799384c3d0c540fda5367c ("package/qrtr: new package")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
