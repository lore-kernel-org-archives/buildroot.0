Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89369606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QI6FwKTB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=XF7lnZy0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CC09405F8;
	Sun, 22 Nov 2026 13:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cl3wuyhro67x; Sun, 22 Nov 2026 13:10:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A165840563
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795353052;
	b=D0tRf//CXzJznJpcdWkOKiHwuhgoh7+dUQ493SoGSFA1VhJ65W+x22WKqsV5C9yAD7f/
	 1A4KIq+kYVFSg2UJ88ryPCW+alwNaWevq3nChV4cLMQ4Chb7g+HKRP6dvYUt6Gu99tMvy
	 D+040dI9V3xWVZzzjgc1xvoEJZpfQtiJHXaI17EQ4QtKzHlsY5GBGbEvCRpuYD9ETV0yl
	 bdaaDPAvWLyqpzGchtuRRbcJcZ4Zrs0JYF/mnx7k/FrgJ5MS4MS6A15jiI3ryJKcTdSFl
	 EvMOx1SShl/MZHnffoCF6Xh0+EKFkAA7vURgaXDx7+bHWVsa9fLGA0vL2t2CNfHK77Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795353052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zqt1dmxxeXnhwowlOX3FR6Rup+cPfeWyoRn8DTVbSsg=;
	b=K/Rd5bBiMUxqOo46GwLl1mkxoVIXMVsWotKOqZXiXDh01m4c+ykusXb/RYVcSwb/+0MF
	 pxkXEBRhmEGi+WjS0S1aGeTeDunvsfolw4/QHql2r4IHphQZLYgrfwH8NOCqtaa0B0cs6
	 ih4358JNZDlkJrSMk0FWakC5O+WQcCozML1ZHvetYmcNl3lrK574isptYEqCGDddyJQ2s
	 tbGFGeYPTSMbiPzEt7J3pRMLPSYZTOIn5gn9kpgWqh9Pcvshv2A+hdoHFRKMbwi991PVD
	 vDH0H4RyRSv3xDo4KKYZiJe8C+i2QUTm8pfCPJKtItZtXBuVYrDMsoV0zEI41O3ozbA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795353052;
	bh=zqt1dmxxeXnhwowlOX3FR6Rup+cPfeWyoRn8DTVbSsg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QI6FwKTB8hz+/xgBMcvKEbTK9NivKlnbxKdrqsqGIaUCwmDUK8Vs+puD5bK+9dxrB
	 CuOgS2frqBnYJGwI/i2xKxeGYS1uAH9SVbgvfCkbgH3PGMQJ6ic1NCWZA+TymoTHar
	 FQct7pb/liM6iFedP2MQkYze5t6bhJeGzeoEZYEyN9D48fDbVg51MO+fgSV9E+DxNk
	 OqPY39+BG5K2qD6Ga/MASJykDQJAPjpS+cT48hpfUGQQSuDJT+R5lMdt00W/eoV4S3
	 noh5a7Z0W7iaNP1NZ+JzZjKx93i489WTPcZVZdYhtRQaERHLqnX5UNzeIszdfuWZAy
	 Cc6rnOBHTyR9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A165840563;
	Sun, 22 Nov 2026 13:10:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D516310
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 13:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F4A4400FC
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 13:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvovVxHfPj3k for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 13:10:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1163740012
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XF7lnZy0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1163740012
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795353045;
 bh=yJLw6YXrSiAj9ljnVNozxZnE7f9yxrZEm3Hm2lyPvf0=;
 h=From:To:Cc:Subject:Date:From;
 b=XF7lnZy0kXGnFKdPBdoc/Ri+CWft8aKmbv9y2GBCkfmZuGAxdhYQtC5APwaHaHJrX
 Z/OiM0aotJ7Z2Tycp9xNzELBlxYMUr6KVB6jQmw7H06nq/INfd5eT2QafRpiPsa1P1
 PBPdZr8o4Qmhr/Oj8vJB9V/V6WZ9c6aUt/vx/+zwVKpVLxdHN7PosyzDCgqB9qDTBn
 3255vj4YdGH6fhIVAxmIOZ7BbFcgc5bfR1MDJQWYpTldyeF0iDhFbfDGGYZD8z1opq
 0zr7dZPOh5r9OpMnHPKtEOWRkgsRQa8X7PUIS+TrT3uoC4D3UMZE/wtKqqNjsUWdt1
 jQiFdArZYf2lw==
X-KAS-Sym: v3:f51bdf72230551df:ZbbbvdbN0UZTKaVFHBONBdap3I3wlxPka9/lI6MI4T6KH
 T6XNJu7GyLtiZ3ET/5fxyGoCuBJoCGTm3PKaU7LL451FtLpOAnSu/S+N9WyTEgk8lJrx8gSBnaD
 ih5evcBTDUBBFLf0IbtkMDUk2rPLQLVw8LqdGp+/CKxcH5t49MYngS6APX3uJ40LQA/OoynWbVt
 H/jAwqArlFC2Nwz0R2mHsW6CnhUpdMi7jxVDv6exqGTOcVi51tnAU4wOy7u346dS1bsln8KY8Ax
 DLmHUraB2Mk2Sz/G/ZeLR+8Nik8PZIzMBnAdxlQcb3lrR08KZR04yxdN+HUyObpw3fbplV/g==:
 q7apKLekw/A5VZHmSjuQxNFOCxJJbVE1YLjTY/pQ6hCc7LWWZdmA00FT9LO4rDd9ygdGQ+aZZzd
 04tHj24ZE6s93sX7RHe2sIV1y1P8sILzRdn5KEHPWJ6Qd1mjSV7VKuY1vX03PYhWvGcrUpDTjkF
 3Acr3tplRywf0iQuCNCtQJMmNml3gmti0LCXH+yHOWnBuWeNO2Q/QXvwufUmv2xy3ZUCo2hcPoF
 NP3sXpwRZNP4pxva81fya9IOCmnZQ9KwFZMdhdef3MFGD/h6kafyaAgN+Ydjl1YyrCtAm5kk+Kc
 mIWPgHKqqV5TrL9r7ntH6qtJik36zFeyVfTBWBudTBacqAjguSm3io/thwlFc+8EDfU4rNfB3IB
 VuxuyhJrPg3IEURePA7St6+yW0wjLkebGh1dBBmQgNBUOGVUebDSucEZA+H1JS1NvxEeCFOefLa
 Q2QvhdU6P6c5Qu07YgBYH/cVg0VJFO0Cd+A1vYECbFh/Zj4FlftUQOMWvL5REbxrPRmd9g+XUXi
 nu0CQlaaYauH5IVJROV12fr3awmwLnd9HNKlDz8EEyYZFR7u3W2LrD+Gnpd2E8n565i4N5qZycn
 njlsKdLGvJ6JqCEVmSJQ5d/YNLth+2UtvtzU5OfS+acRHJhSlO5CWiuvAC1mfOSF00Q+M/QmmZz
 Z40mKMgEPw0amdmm7Z7kr8/I=
Received: from fli4l.lan.fli4l (p5b3a06d0.dip0.t-ipconnect.de [91.58.6.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C5061A4C5308;
 Sun, 22 Nov 2026 14:10:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41526)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xV7LA-000000005oH-2aOY;
 Sun, 22 Nov 2026 13:10:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sun, 22 Nov 2026 14:10:44 +0100
Message-ID: <20261122131044.18778-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH/next 1/1] package/ffmpeg: bump version to 9.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://www.phoronix.com/news/FFmpeg-9.1-Released

Rebased patches 0001 & 0003.

Updated license hash due to upstream commits
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/6e9100c64894728cd92aaf8ce2f1f33cfdbc675f
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/5617631d684a2522ed21c2fa89ec3a94b7ab4930

Updated URL to rebased version of libpostproc patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/318416bc3581d530cafc6e50eb4b40cae5d8666f

The "test-pkg ffmpeg deps" pipelines
https://gitlab.com/bkuhls/buildroot/-/pipelines/3099287059
were canceled after reaching the 3h limit, a local build passed without
errors. Please note that
https://patchwork.buildroot.org/project/buildroot/patch/20261122084836.2321898-1-bernd@kuhls.net/
was added to the tree to fix build errors seen with libv4l & uClibc-ng.

 ...1-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch | 10 +++++-----
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch     |  6 +++---
 package/ffmpeg/ffmpeg.hash                             |  6 +++---
 package/ffmpeg/ffmpeg.mk                               |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
index 3c171c4ce7..3d88fce8c3 100644
--- a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
+++ b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
@@ -10,7 +10,7 @@ Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
 
 Upstream: https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200223122256.23402-1-michael@niedermayer.cc/
 
-[Bernd: rebased for 9.0]
+[Bernd: rebased for 9.1]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [yann.morin.1998@free.fr: fix reference top patchwork and SoB order]
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
@@ -22,15 +22,15 @@ diff --git a/libswscale/x86/yuv2rgb.c b/libswscale/x86/yuv2rgb.c
 index 2291c84e53..d4e23dce45 100644
 --- a/libswscale/x86/yuv2rgb.c
 +++ b/libswscale/x86/yuv2rgb.c
-@@ -243,6 +243,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsInternal *c)
- #if HAVE_X86ASM
+@@ -265,6 +265,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsInternal *c)
      int cpu_flags = av_get_cpu_flags();
  
+     /* the converters need at least one block of 16 pixels */
 +#if HAVE_SSSE3
-     if (EXTERNAL_SSSE3(cpu_flags)) {
+     if (EXTERNAL_SSSE3(cpu_flags) && c->opts.dst_w >= 16) {
          switch (c->opts.dst_format) {
          case AV_PIX_FMT_RGB32:
-@@ -275,6 +276,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsInternal *c)
+@@ -297,6 +298,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsInternal *c)
  #endif
          }
      }
diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
index ce72514d67..4adcd8c36f 100644
--- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -9,7 +9,7 @@ Fixes https://trac.ffmpeg.org/ticket/9138
 
 Upstream: http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html
 
-[Bernd: rebased for 9.0]
+[Bernd: rebased for 9.1]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
@@ -22,7 +22,7 @@ diff --git a/configure b/configure
 index 374bd5c151..fbb108506d 100755
 --- a/configure
 +++ b/configure
-@@ -2480,6 +2480,7 @@ HEADERS_LIST="
+@@ -2450,6 +2450,7 @@ HEADERS_LIST="
      malloc_h
      poll_h
      pthread_np_h
@@ -30,7 +30,7 @@ index 374bd5c151..fbb108506d 100755
      sys_hwprobe_h
      sys_param_h
      sys_resource_h
-@@ -7088,6 +7089,7 @@ check_func_headers VideoToolbox/VideoToolbox.h VTPixelTransferSessionCreate -fra
+@@ -6980,6 +6981,7 @@ check_func_headers VideoToolbox/VideoToolbox.h VTPixelTransferSessionCreate -fra
  check_func_headers VideoToolbox/VideoToolbox.h VTPixelRotationSessionCreate -framework VideoToolbox
  check_headers windows.h
  check_headers asm/types.h
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 41bb586831..ed5f8d7cc2 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256  8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e  ffmpeg-9.0.2.tar.xz
-sha256  019ab331eac814e4995c65dcc8076cc433a64bb4a5d2aa6aef5516922dd691e6  001-ffmpeg-all-libpostproc-plugin.patch
+sha256  1a4d394ae63d190a526cd052eb4415c156b5c5e2df37efab41a7de0b8fde2433  ffmpeg-9.1.tar.xz
+sha256  b714df9125924fba59b7c69a5e15d9638496f6ceee374ec99eb21d74dfe71630  001-ffmpeg-all-libpostproc-plugin.patch
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  246041b6ecf9bc32d718a62c57877c78b5eb397b6467e74ed7ae2626ab189c30  COPYING.LGPLv2.1
-sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
+sha256  576c9e02cd231f3a9ee2162e6db70eb82d2bcec0da8710cdb71f1ecf02d8469a  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 953c733961..1e8fd660c2 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 9.0.2
+FFMPEG_VERSION = 9.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -17,7 +17,7 @@ FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
 FFMPEG_EXTRA_DOWNLOADS = \
-	https://github.com/xbmc/xbmc/raw/refs/tags/22.0rc1-Piers/tools/depends/target/ffmpeg/001-ffmpeg-all-libpostproc-plugin.patch
+	https://github.com/xbmc/xbmc/raw/a46dcf90a422347d2264767afc18410f5de6c864/tools/depends/target/ffmpeg/001-ffmpeg-all-libpostproc-plugin.patch
 
 define FFMPEG_APPLY_POSTPROC_PATCH
 	$(APPLY_PATCHES) $(@D) $(FFMPEG_DL_DIR) \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
