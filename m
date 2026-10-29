Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3736B606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DcQsogbX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F07D4814AB;
	Fri, 30 Oct 2026 14:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vk6BPiNJypIp; Fri, 30 Oct 2026 14:18:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1F52D8148B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369902;
	b=qa4bFRuG4q/J3Smq/r2xp9kCvw1nRYdaQXe0+vEKoxrttid9kKeP/iRWkSTlvuUnv3On
	 M57qNUeaU/X32vQJp2loYmYWPMj1IX9KsyAdAHrgqu0AdLaxvOUJpOHvvSow3BiPmbXyF
	 Lr1H6yPCqkAJS78OYa0SFdkzeTO9eG/OdSu62zU1AstLXLI6SPHbcjA14BKOX7BnGovZB
	 /IuXzEdki6KF4u/2qOgRxF6lDtu6I6y9Cv8rDrp7K+/HQ4QHcfSrBdo/6a0PsxqKfzCet
	 DAVsK6lZCcbqfUNWYYDTMbuhNC/v9TSRNhnI8jQ+DTUHrky1DDOVMs1+JrERWbJ/wCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369902;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=owApdsLW2NJY6jDwuS7gNCXOK3EMWRdCxTSNQcCENsY=;
	b=m14cx04m75yknZrtGNE7gCsvKgof00MnneJVHdm8rWrFHRleGFJkOiALaS9hbs0ovroi
	 gfZYX/duUblnpbMjs7zW1P/iA5PCVYov+karI1DZFcF8aoRZmtLBHjfSXvSOXkrtMZzjf
	 7zApvXn0X0TOcVolewQabZ8uPQgRytR04XHnnPDuBiWF9R3NPRQt2Ecot6dz9rOnwHjS/
	 +lxhY9F6UHgMnfCgmcZ/iL0A5F4/G+MehAOJCVlTgbMPP9+ukRIM2YR3x9I3Rk8J67K4K
	 f025vaDbfrO1U4FuQeu89/ixzLM+4x5GHEmkFQIpWb7pj1N2TVUeIzmHW4l4dsevYgQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369902;
	bh=owApdsLW2NJY6jDwuS7gNCXOK3EMWRdCxTSNQcCENsY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DcQsogbXYAy1MXubVLc39hvZyqLN5LVAJy5fkDUSvdx9J5hnVM2B40yCO+VErdYcT
	 F6jJiK/VLlKzOIAo9f6/NdBWV2t9GS0SmRhK/ivqxnuYoQRkhQEoWpw7GjXtr/FCjz
	 ADC16rv2KLXmvPikvQF5rOKSVkAxvn9WTGLl2J3rKYG2zFTVDvbUndFqFlNkkStA5C
	 JNy+qPwQgp4QJpfXQ9qSEhrm8mKReAc+AyRDJexPCiqRxmZ7HLiwgf8+zuEnBnMUfr
	 AwITd8KGwucKKycnyUAi5UF0UepRBSv0pXGorqjwI3tb1BRNqCrk7ZW7QIYiMJ8W2u
	 RWbcPByye3dTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F52D8148B;
	Fri, 30 Oct 2026 14:18:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21CE3D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 134D5812D9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iogX9PnCHDOR for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1BC83812C1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=JNEmaVoOjN4YQManPmDdyEZgMHk8+xKnzm7DAxanC4OP+FnnLFvU5tYAa2o/6Udos+VC
 zwnx2Iq0jLTJe9J+ATTcof9XT4inxLlHVAy1dUEoUTW/+n8nmG/gqYS8atM7T2PqcYs9m
 rTInJAUVACIzbLyAD2BCGB1uDktGz6+LVEE4HJlV7rVtZROUPU/xc2LdpvV8sAluD2O+D
 z/gOok/6Ic73A9YcxcXaY1unmQA/I9MbR2CLTLq/EZ+w3Loqp2pWopVki4zO3br4TuC3O
 NGVrUewvgOdA5WmJzvlN/HBo9H4Ku9dyw4adg+y3OztaK7WIolOuLdt/Sc3Z9EL1t2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8BjQmNY5h2LoAG5bm157jNURq7Am2DHEKj7iRJ2kyOk=;
 b=eXI8HsVOxwek7r8YUvZ2Pu92F83nMC+uDHWOs0s2/BeBM9M4kGQzWw1xOhRJRey8IQXy
 ckMPp/zqk9ouSL8hyYFzSAmxIyeS1cj/CpEDvan01wI3c66ioMwa08EVkJlDDxDWkThmp
 2UaGBKrD2iz8KtOIJ0O2jGAlDySBrcSzln4kSRCpaHpnp7f3itYdIKZ7T3UAehAizMJhs
 HvVttNWnEnxBqXzcFscmKj/NeJ95IhqKMx8yCO+em/Cn+Ui6Ak+747tVc48SgPzziJjQi
 JkIkI3uxJ5xInMFr5/0gV8u8d2gOvcVJ9pHraDmLoG6ShEOWvNjKiu+uRFZOX5hN0mw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BC83812C1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A76D9D389; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 972cc1bf6f34da5a6aaa3d957c1a6eb0e89365d4
X-Git-Newrev: 3de3b2bf0cb6bf5360c8be23b48ba0ed54594345
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.3A76D9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sdl3_image:
 disable examples, tests, man pages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0954347148183249218=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0954347148183249218==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3de3b2bf0cb6bf5360c8be23b48ba0ed54594345
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-5-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1f02444f51c07b9cf7d9d4a644a2709bca8fad7c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sdl3_image/sdl3_image.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index 8f0718abbf..a2b9f62fa9 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -16,7 +16,10 @@ SDL3_IMAGE_DEPENDENCIES = sdl3
 # Request dynamic linking to dependencies instead of dlopen()
 SDL3_IMAGE_CONF_OPTS = \
 	-DSDLIMAGE_VENDORED=OFF \
-	-DSDLIMAGE_DEPS_SHARED=OFF
+	-DSDLIMAGE_DEPS_SHARED=OFF \
+	-DSDLIMAGE_SAMPLES=OFF \
+	-DSDLIMAGE_TESTS=OFF \
+	-DSDLIMAGE_INSTALL_MAN=OFF
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 SDL3_IMAGE_DEPENDENCIES += libpng

--===============0954347148183249218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0954347148183249218==--
