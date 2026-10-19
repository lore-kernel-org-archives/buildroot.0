Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276E606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i+TmDmUO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA0D607CD;
	Mon, 19 Oct 2026 21:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJFwNVpt1aHF; Mon, 19 Oct 2026 21:47:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 631AE607CF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446436;
	b=d1C6HdqSdJNwhvJXfACVRlDrbBQSvOrvjEWqtUfIpvETKaX0HIbfo4ZFCCt6ZdODscyT
	 /ti3soCVe0plFLBOeNXZp8Lz4T+5Wx7WJZu1IBDavxX0ZwwJYD0QeTW8NK6jdv4uvjT9l
	 eO5ufQF7QingaoskGdUEdecD2stD/UUbUnw215vbHKRrTYk/+X3LLP799kcolKsIeWNhT
	 Gib5NUAEEYEwIT+we+Qik7S97bz6HM9CIcuYlrb3rbXqtyKPU1RP0IietpG2Uav4onwn3
	 K29IffG4S21OLm8TRVV5wa4vABAEGqCarBMRDJqyvNcm26D1vr8aVZp5uffM0PQL9bA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446436;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xR7njz0mSk9vsbBPoRepZq0taqH7nU+opfVrRAxwVXs=;
	b=oxhkUzEzbC0ZN948ukBE6KQ2KvyNC08C/FlAg17mr4nuvCLThYRHRIH8uC04dT12NchG
	 UUfwYQD05ZwBPyrpQ5lq8KbDAW8DF+FCNxXCXZ3qHy6tD/Wwk31hbp5E3iQtqm2a0kadt
	 eCL1O5jyzDswaFMHqjrnPbF8FGaQPaIywFlpiQvie4RxstOjCa09B3S36yZZm20h7FNmO
	 1VZ10VUdJgiRtLIVAxeSUJ7+fIdPlNiPe/Z2I8xeNGsaDMap8qFBbQV+eMsmct4IJvO6P
	 xqmBf5OXSx2lLHpfVsp0yndEQlyP35pHmWOsrRA5+h3kSoFEP6XbAf9F/20aIRBjQyQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446436;
	bh=xR7njz0mSk9vsbBPoRepZq0taqH7nU+opfVrRAxwVXs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i+TmDmUOC8mngI0aOF72D4hDAoRm2uPzB/L7xWEn30tDgR4tFj5Y1ogDWReaBzjf6
	 nt76toi+PS+27IP1clbK6QGszmtYW0f1VMP9mnPsGgy9qHfO4YocxP3mHK0B88/Oc7
	 bEStK0+3vvpCiKAz22obUw7Tz99o/CNoQgUu4b9VGr8rH9XVoVLej/vnRn2W+90jAQ
	 Uwu3CBMU6sJAEafz7YLtGbQrNWyN6lMW3jgEZUz4WQWlENkVUG8D8Hl2M1u/nylWV2
	 OkgUbD6xdjaI5Z0zSoN63NOcfUKYVN9WlMWdMGzYK8E8UK+2Wj4DPGeGNnceJpku38
	 Qrfghb701OHTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 631AE607CF;
	Mon, 19 Oct 2026 21:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01A3A11CD
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6942401D5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XB-izkz7Anik for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 22C67402B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446424;
 b=OnI0vNxLswDSAhjzVRUhk6p0jg5EWJCKxCdnpjRQtyw+GfF76wFC//1/oV38MnRQarkO
 N+UfZ0FdG6uhOaAS6V8TROM734wXSUo1GrSPs2W/9WJRzvxqMLUKeGuNVZoDRpOc4xTtT
 U+UjYf7E4uzsBWSzstUz7qv9pas5rjizl+J7nEwtk3HkQzACExAnLdXQzC2Iib1WdWqg9
 XLtnaM50aEWba37vpJqcQjrj/9Lk6UOiJRGudfqqc6N3Hqlq4yClu+FJclROYq2KDv04O
 1YqLou4TjTbJRRLIsPvLhmByJlkv2RHphasXHNVPxludWfZAUChAWSDBIvPQA80AXvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446424;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VMGjiVkVuEXMfV/BHugcrja5Buxs+d1taklO6cZdU8o=;
 b=HesNCfOUCOodgZbgWrYbzToCBsS3wWzfprh45OxOHdsGLMgoe2BZvo2Jx5j91czd2mws
 pJlbq75wHL+5cU9HuFHp4HF1xFHB7uw6uZWOg3S4mHaDbmUVcT8ZnzuyVnbT26aiJoxE1
 ZQJyGn3kFGt2lSU2pN18yDf5NruudeJTdXGwrMNhTEyayknLjkxA0wsPnVwjoDayzMdJ8
 4IJVERa5tVtPZpJOxLKUq5qFU2wD4xZykdXnuUrLmPI6TUxbhaF7tR6GDN6WnarFkmf6/
 Vf+olqmMOeHixXJxrEEcP9n6XotovFvLNwqR2CBmnbl5NjMFQFlMawcWK1UL/Tf3kog==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22C67402B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CE0B99662; Mon, 19 Oct 2026 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:18:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 785365def77065e0338061b9cad5aeee481946e7
X-Git-Newrev: 396e388f83af8c54bd27ac59e584fd6daafbc2d4
X-Patchwork-Hint: ignore
Message-Id: <20261019214541.5CE0B99662@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_image: add optional support
 for avif, jpeg, tiff, webp, jxl
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
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/396e388f83af8c54bd27ac59e584fd6daafbc2d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-5-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl3_image/Config.in     | 10 ++++++++--
 package/sdl3_image/sdl3_image.mk | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/package/sdl3_image/Config.in b/package/sdl3_image/Config.in
index 9b9c4f0d74..b93d40c1e7 100644
--- a/package/sdl3_image/Config.in
+++ b/package/sdl3_image/Config.in
@@ -3,7 +3,13 @@ config BR2_PACKAGE_SDL3_IMAGE
 	depends on BR2_PACKAGE_SDL3
 	help
 	  SDL3_image is an image file loading library. It loads images
-	  as SDL surfaces, and supports the following formats: BMP,
-	  GIF, JPEG, LBM, PCX, PNG, PNM, TGA, TIFF, XCF, XPM, XV.
+	  as SDL surfaces, and supports the following formats: AVIF,
+	  BMP, GIF, JPEG, JXL, LBM, PCX, PNG, PNM, QOI, SVG, TGA, TIFF,
+	  WEBP, XCF, XPM, XV.
+
+	  The formats needing a helper library are built according to
+	  the image libraries enabled in the configuration (jpeg,
+	  libpng, tiff, webp, libjxl, libavif); the rest are decoded by
+	  SDL3_image itself and are always available.
 
 	  http://www.libsdl.org/projects/SDL_image/
diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index 64dcf9df52..405533b1a1 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -21,6 +21,24 @@ SDL3_IMAGE_CONF_OPTS = \
 	-DSDLIMAGE_TESTS=OFF \
 	-DSDLIMAGE_INSTALL_MAN=OFF
 
+# Without jpeg, JPEG support falls back to the bundled stb_image
+# decoder rather than being dropped.
+ifeq ($(BR2_PACKAGE_JPEG),y)
+SDL3_IMAGE_DEPENDENCIES += jpeg
+SDL3_IMAGE_CONF_OPTS += \
+	-DSDLIMAGE_BACKEND_STB=OFF \
+	-DSDLIMAGE_JPG=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_BACKEND_STB=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAVIF),y)
+SDL3_IMAGE_DEPENDENCIES += libavif
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_AVIF=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_AVIF=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 SDL3_IMAGE_DEPENDENCIES += libpng
 SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=ON -DSDLIMAGE_PNG_LIBPNG=ON
@@ -28,4 +46,25 @@ else
 SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=OFF -DSDLIMAGE_PNG_LIBPNG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF),y)
+SDL3_IMAGE_DEPENDENCIES += tiff
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_TIF=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_TIF=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
+SDL3_IMAGE_DEPENDENCIES += webp
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_WEBP=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_WEBP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBJXL),y)
+SDL3_IMAGE_DEPENDENCIES += libjxl
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_JXL=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_JXL=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
