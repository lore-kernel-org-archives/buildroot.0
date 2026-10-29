Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5485606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JgkNbmYC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2B3A81010;
	Thu, 29 Oct 2026 20:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WM86Rdlma4Fv; Thu, 29 Oct 2026 20:23:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BBFE88102F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305410;
	b=tW54nfWPqCNe8c4zPFwOng81c+QTi8XwPk/BXw/zCMQrHQI9HWYAlmBNbe3bf6bCwL51
	 LQr4wcVAb5u4NpyAmY+IaozIM2aCUX/HVcsgthzdN6BqTWxR7yD+KJd9FdwsxARYvC1ve
	 JmHJmSTFQ4RsgKysFg/FafzEXCI/2EgiPlbtdv9rQ6r69f2JKwWU9P39FZusjIENWBzGZ
	 CYk/upuNzn2obKjEo5U5XZMvZd9j1ImuTgtCIS7JA6dClyHt9urjK9/ZUdXds8SB14wWV
	 wLP990pq2rOd74r9W6DNZCi1Z4TOQNrAxoj7WYpp9IRZ3VygkCmgsbSNVjQYv30tpEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305410;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VSTtIYL8gN0FlNU9M7qco0SROBQuY9AeM/dlalA34cc=;
	b=OL/c8rlyVBoGfHVJD0i/HxqOiqVWNjaMCB0aHNogCTckqUr0bP9zMoXHczBccxKyx4aZ
	 V7NWlr0ajF2jgry3MKsJiJnjfI52eJh67XZSJd/ToKqRqjNICojaKY5uN9+aAUqch+9yl
	 SDq4PTqQRwSMGDbA391de7i2u9/+C2Itnt27flrwvVU9HkQt6QBW5cemb1J0Rexa4fOdK
	 hz+NQxxRLCoR1WUrzQX2IPVhQ+ZfWisbetiLVCwIbKrP7CcZizRylraLMrkNjwcWd+H8u
	 Uju7gcdZ/vJc/7QQ5nna/VvSjuHJZ/rRAsCC/bvmmBHrdGSVl20bDDLflJiVN1z4DTw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305410;
	bh=VSTtIYL8gN0FlNU9M7qco0SROBQuY9AeM/dlalA34cc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JgkNbmYClaZqKm8558Amogyjx9pBJW/wYc1F4jJdh1sceMNdlDuXFlR99ut4uuzS8
	 pdsYDNWrizan/ELFPcbRpLkzkpInRShMWI3N5CKzpouR4bQVM7VCeUPBbxyeiYeyQB
	 j3gMG6mUASaoZDAgvsDleUdTdv2XWto5AyJXbplP8t4QM9opRCExF7iWiiD6OKBt3v
	 zcSGq/MqggeUTobccSXrhosGqMNvQ8fYkVqXZrF6ErRqECSmWzHfCp0ffIP+q0aSi6
	 Yuj44awX8F4W9WRZGDNRXTdZCij3156fnUbFa8Fgv5ySCtDj46ZJrLBu/TRMlOgNPQ
	 AhKl6lJBeWeQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBFE88102F;
	Thu, 29 Oct 2026 20:23:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 904E42E5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76FFC81004
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCX6kZvejssi for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 58EC18100D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305400;
 b=EYrBN9f1bsxtjTzb9zIMxI6vVP/zRPWNA2hxiW0KmoEfM06x8hIkb8q5N4/bMXGTBnHc
 xpqU6YzS+Nd3fsh4LZH94aQDhupiUiqVGlHIYf4Bntx4Us5hi1jpkth2Ma/7YSnA5i3yL
 gst15xp9/f2OMo3CQ/fPcVxG9Se3OiasqBjW/3AOZC/wTsYH2TDMUkF4bneaE2bNLWPKY
 wQwD4OB66WTno6AHW5oG0GH1c4ixHZxHg+w36skHB++oXFp1JwB7ugmxuTK9L56eUm4gw
 dV2CfqDr2kI7TNkQL7vg5/NV5WZxWAvgweMqJgzE3HEmvMGmCZudYyzwTR+R0uRaokg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9Ywjjw1VcJN7wjGFaWk9ZsrN7s07KEtqm3Rj3JA7mwA=;
 b=dClAk/L1Qqwvp92vvKKAEuwSgZTMKD3cwao/xHnd+2cRofQsDe4pgp5bky8n4aY7712z
 sadi5yd7DSg0sbLm9HSWA4RwHDyMdEeczlff3ngNJnZYDZEsSydgCHUQwvEbLfNnFYY6U
 i7hS+NptlAhXNAgaSFYy51HhXQ/rQAPK4Gbfi3xd4q/mrL+mBb8UqKCqIvg5oXhw8aFfR
 V535jVtFDWciOg+9ZCwtGbBo4PtHzC6eL27frjqNEcYgXklhYbg9VldJsIu+BaeFOXQUd
 L7tasknXEGaepr+m5JONkvaizp/RuKzTYiCOR7/qQEQXNyc0bDpmzusm3RCPAvStyaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58EC18100D
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF2BB9D2EB; Thu, 29 Oct 2026 20:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea3448a675f622cf5511d2d2051d4a601d99f2bd
X-Git-Newrev: c3d7e8468317a1eadc902de50c4fa0a53c17d52e
X-Patchwork-Hint: ignore
Message-Id: <20261029202152.CF2BB9D2EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-*: mass version
 bump to Piers
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
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3d7e8468317a1eadc902de50c4fa0a53c17d52e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash     | 2 +-
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk       | 2 +-
 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash   | 2 +-
 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk     | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash     | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk       | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash     | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk       | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash     | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk       | 2 +-
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash   | 2 +-
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk     | 2 +-
 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash | 2 +-
 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk   | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index d011e38fe9..84eb36bd80 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2828685f1c353bf7123d0f9e88b28f53064388f6ea3ee357b8fb22d5c237ac8  kodi-audiodecoder-modplug-21.0.2-Omega.tar.gz
+sha256  9a0b5bfce44d937726529a5c32d1f33e4d70261eeed5ace443dffd1d159641f1  kodi-audiodecoder-modplug-22.0.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index 15a1d96635..9f3e089527 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_MODPLUG_VERSION = 22.0.2-Piers
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index d743433027..7093b6c48e 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c82bf0ffab2d09f26b84d382fd00f70695d5f6a6d781be2818f9f5e10bc675a  kodi-audiodecoder-nosefart-21.0.2-Omega.tar.gz
+sha256  f0b89b0ac85c2248c6aeafba1b805c2c21524fe5dd229f2a5ba362b3ea8dd313  kodi-audiodecoder-nosefart-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index ca45739a02..ede46e0698 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_NOSEFART_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 87cf151859..c03bf7434f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c7d10dd65baed2db1272ff57fde76f0b268a4a434d57022539c4dc5bf6f8b54e  kodi-audiodecoder-sidplay-21.0.2-Omega.tar.gz
+sha256  1657509ee534600bec9f66cd651e7d6342502fde1a213e81a807eb17feb3c565  kodi-audiodecoder-sidplay-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index d98fc4a7f5..a99cd32f9f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_SIDPLAY_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 0ebd6cf128..16e353d2e7 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98afd81a9653efd9c6fe69dd7918755c75a4671322b793a35bce610acac0d128  kodi-audiodecoder-snesapu-21.0.2-Omega.tar.gz
+sha256  5bffae158b9e02d2fba2fca7950fc9497dc65928f90ab336f37ae51819b662a7  kodi-audiodecoder-snesapu-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index aa8178c55a..03b3e121a4 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_SNESAPU_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 560c93b74f..9d463dd168 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  089ddd6c890e571f69eda0a85077d8ffe91c4b31fd0f9e20f47d4053c1e984a8  kodi-audiodecoder-stsound-21.0.2-Omega.tar.gz
+sha256  c40edfdc694f62d0ce0129f93b16fafa97cf254526d8d874a473560819c31894  kodi-audiodecoder-stsound-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 2bd37a8e04..086e2ff6ff 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_STSOUND_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index 22e7015ff8..5240efc8a6 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb7bee9453825f86275ae05c4561fb52ee7fd9fa21857e303933cb57d28ccc4b  kodi-audiodecoder-timidity-21.0.2-Omega.tar.gz
+sha256  90354522f51889c341541694bc964f24a4739c342c0c8f28ae3c002ac41eebbf  kodi-audiodecoder-timidity-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index c165492416..ab417ee150 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_TIMIDITY_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 010315db59..27a721d85d 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6f5dddc0e6161426b8c40bfd1136ca555588db27ae78c02178b6ac5da93b377c  kodi-audiodecoder-vgmstream-21.0.2-Omega.tar.gz
+sha256  c6ae413f47d9261f3a20cd4e2d380b44a57a82a93d03ddfdf2ac0666b230ac6b  kodi-audiodecoder-vgmstream-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 66beec0a37..74a5f05a0e 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,xbmc,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
