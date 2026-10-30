Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8892606A320
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XmvsUDDX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88CD760B13;
	Fri, 30 Oct 2026 15:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lK98qDUSCG0C; Fri, 30 Oct 2026 15:26:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9446F60B0E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374004;
	b=FEogWYFUa1ROyTN3vPdAUKRIa367BwSEYY0XbFe3Uz229aq9cWPH8BcRCyoyIpLp72mk
	 4tfr6iN9ML+xZtzvVHWMjlHRUut8OqC7hBMSb897S7DL11grIMlLGuVJnhmw67EfPmknn
	 9GxAuWQBXHjDl0FB8NpekDkRpHYbTSA5diw1njA70lOj4MiCJZVVKZxdDnk0Irsh/b9Y0
	 LTTa4zh8A8o5rZL6EftLAhS8ylySprxlFGSnyCn58YsDrjEt15P8X2KSiibS3rc7vDBUn
	 xmeKzC8YnNr9VQb+7fPyvO/OREgLAbJ6NQ1k0ur7jvgGzHjSwZbu42ezdWqNDFLcygw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374004;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=db7Z3n1N2gaBBreWEmMBFlFxfCOQSLnjHNyXSH9y0B0=;
	b=GwjIVgtJK0pO+U2OXky4xiuRoL46YgOZPVTQXlC4144C7sAj+OgHjzqrXi6m/RFIy6Or
	 P1TpKDGjPgiJp3a3WEnefPhkHdFNyHeAgHAUPfYR1zY14gSw+M2nLhHEyLKfJGfo8ihhi
	 RQm4A4XeeThdWSmxmggid1RS/IL2ecnBAXZnYQ5D3B9kVB1eA+83PhRo/mE3EzWzu8Kxc
	 A5KGQ+keKEF3kIPXk+blDZhL06DGmmey2j9KkLc2COv23Z7H9ag8Gvp55gIlUdtUbr83I
	 8gSKxSah9Op/fivUsuX8RR5s6Iixe1aqAv0e4pucA/KjF2vjnfOgPO+mQvP0s85uKSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374004;
	bh=db7Z3n1N2gaBBreWEmMBFlFxfCOQSLnjHNyXSH9y0B0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XmvsUDDXq8qmWXzAz/zU4Dx3iR/lNpqMULyJG8nMcrBRcEa3hIXmWtJiRA0W5Jk9I
	 ncXS10MZ0LHwpB2LBJ2trvBqnm59xl0hLGe4flCVD+U3pe04WMhPCIV06edO4r19ap
	 UWBOoF6gC8+JNFFevvMejbsuruoPeED+I06MOKH/x67NszUv9MdeaPpGhEmR5/2iZM
	 L+Ey6/33p5dGFCFmvvzSvipm2dmQVcfGp8bLw3yPC17+xBl6YWYP5YQLXGKxOHyqEX
	 1e10VO5r1E/gflp97Rk0HDZC/FqMK0axBwQu08txh5/hv7DCfO7BAvsm6BU0c0QYyp
	 uG7r+mYVZP7WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9446F60B0E;
	Fri, 30 Oct 2026 15:26:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 475F03AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 394374053F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6z4GOlNmi2iQ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2673740530
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373992;
 b=JqwzYeQi9kY2xp2cV434a4a1IyvxTU9h1YtkCahzTOq+avM6SSuZ7ql26ID4jx22tM6H
 jKcPyYmWJ3K72of+wcouY7GqYA5ORNTYqpP4FLTVwfg8kXy2Rc5XQY5WY6j/GBnkC9neE
 COEnVli4ziT/kuUR9KA1Xic2YJcX48gTBlJ9afMWmgNvO8hl6+YZy3alDd4p9U7VcAHIR
 JmRLUwFojmbp9n9/X0pq7Gj/Aj04og6q5wwA7/aUXEPXUZUDNTy+9V8MSMwaB9WPovO0q
 VhwOjonIhaYboO41dWbWy/1LpnC4m4S9WXScsrbm+7tN65OkJ9/9dRhXf2u25dDuQiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373992;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=2VmjM6U6lCxJUxosumwi5CiV15LYHP9vxSTed+ZAn2U=;
 b=YR7hW4+ZaEcWtY+OWfcg6CEHUQLilc7uQfOrm3purVKxYzzigUDeDHJPdwP7kQVboeZT
 SF9RmSzWjn4/vXboE/+at7rpxRXdr+vFP0Ikoit/De/yHRIV97YJ8CqNkJeg3Ktze8v5I
 LfuRM57/VupSgnRqZLzKG49WDwDZDUZ0W7cbFvnYqqK/XNQRSCi5L73PDYuRBgLpl5yv2
 mktbu2Tw7+Rtb2Ny6XJBTHS+mAahh608R7SlyjjYUzo0zX23iq7wDXh3c6mdppb09HZC4
 9E7kCcvSytG6yFz8hT2T8Zr4r3Q+m6SnOnxWd0esHoP2exJJGJI/0GTq5r0+7eC6yFw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dCYhZzTs; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2673740530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so4907385e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373990; x=1793978790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2VmjM6U6lCxJUxosumwi5CiV15LYHP9vxSTed+ZAn2U=;
 b=qIW+qXBGGZ50/TQTdlKLRQT4yY1FhwaXx603ytVic7MFGoZKm0HZzK/9cL8L0L/2cP
 LFnUDjzp2FDP6nCOst+nA97Y4C0cjUBmVobuFVIjoIehMSVGHFgWgBGAuNzeb7rBIU+Q
 Lm5FEPGVucb8DcvAgWF7zJ9qqLsvXY2MTci3R+C2hwKoUAi906XstV4sd4nenzSgfpYA
 /cBV9/S1Jos7s30wg7tx2wOBHoyUPCUVoGAH5A0Ec3rCKOoK9vd3OJD/oH4qfXIATpFt
 9+L2juxTBjI6GIM1HwYzSP9XFbQF9A+uyfnLU+CHEKhr+rT6k0vEqHhTCkQp7mGGuWiU
 sutg==
X-Gm-Message-State: AFq9FYJxD4LjK+DGEMTsH9vQ6qCCP7kF65LWnC63VuF8S4hMUxmVyU8x
 6R9o+M901W+Cbuf45gJsYFAZs5Dl+QBGxhuZDlZX3XtUOVmHMrqEix6So8vdiQwhnPaDPS6KO+j
 iaxsZ3Rw=
X-Gm-Gg: AYBFou3GZd81yqrEBFlzKEY9E8be3Tt5Oqw6SWl9a+GADuz/faqk3RhY3WGQyAUrnEf
 gUaUNDs2JmaGQr4AR+J9Gqn5V2Xmzr/mylS5O3iTo4VrtWsKSPz24FxuUZTbOhhHXITzndsUfky
 +9fOp36anZ521e4vr8KsE62VnIO/0XZ7KFe36RX0/XhtWyogrW54mpzhaqAomo9CShOw2909Em/
 boqWWrNNz2py9zQElbgyc0MZBZm3HNr9u8xb3uEDlYhSJ3e+bmeJzZmfHP/HSVPAEBSHRYJfh7Z
 QIENn02Pfbq8dq0v2BLsGytW3jyQgNQl4hSBWJelgD1lbaBKDemxQQVz4HWnTn0dTd0TCzV6UqX
 /aJbzgRWtkWPGFGltmZuXyfI/kbvbI86rLJaVbHMMObOxOG+4ulQA40ag4HYsDoeWzAyUNXxY1A
 KCUhVaPAFkk405RnGSV3bT6XjZq7qLvk7C8ZYP+2ANMoLavTYlCsKdv4XPyOqypzGKh70fBb/4a
 pkLQM/Qej3NMJ80K0c18R1DE4vMgCqPmOcRCEJb1+LS+ImIdRHmo7f5z6/E4Gtmr8pjZmXqrzO2
 42lXntXR7cDkXlmAxRkebWXVIsOQ5nrYtOgc4bFwiROw7XHHQHdhjktlCFTp9PhbBIkR2Ebg
X-Received: by 2002:a05:600c:4e49:b0:4a4:6fdb:cc42 with SMTP id
 5b1f17b1804b1-4ac17b2c38bmr60396005e9.11.1793373990018; 
 Fri, 30 Oct 2026 08:26:30 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d5dfsm4280322f8f.3.2026.10.30.08.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:29 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:27 +0100
Message-ID: <20261030152629.1906216-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014214701.537626-1-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
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
> Fixes: a474642fdcd8c69e12126bbe8304479aa855d916 ("package/mender-update-modules: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.08.x. Thanks

> ---
>  package/mender-update-modules/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
> index 4c60aece14..1fd7384f59 100644
> --- a/package/mender-update-modules/Config.in
> +++ b/package/mender-update-modules/Config.in
> @@ -212,6 +212,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # rpm
>  	select BR2_PACKAGE_RPM
>  	help
>  	  The Rpm Update Module updates software on the device using
> @@ -224,6 +225,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
>  	  https://github.com/mendersoftware/mender-update-modules/tree/master/rpm
>  
>  comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
> +	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
>  		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> @@ -232,6 +234,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
>  	bool "swupdate"
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # swupdate
> +	depends on BR2_USE_MMU # swupdate
>  	select BR2_PACKAGE_JQ # runtime
>  	select BR2_PACKAGE_SWUPDATE
>  	help
> @@ -244,6 +247,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
>  	  https://github.com/mendersoftware/mender-update-modules/tree/master/swu
>  
>  comment "swupdate support needs a toolchain w/ dynamic library"
> +	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_STATIC_LIBS
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
