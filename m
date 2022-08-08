Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8A1C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 497BD60BC9;
	Mon,  8 Aug 2022 15:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 497BD60BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zU62k9-H8IZ4; Mon,  8 Aug 2022 15:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56F57607B5;
	Mon,  8 Aug 2022 15:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56F57607B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C2861BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77A1982531
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A1982531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p46mrz7WBtc4 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:06:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE0382496
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCE0382496
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:06:50 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MidPj-1nizlv2nah-00fm3v; Mon, 08 Aug 2022 17:06:48 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 17:06:41 +0200
Message-Id: <20220808150641.19475-2-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808150641.19475-1-nicolas.cavallari@green-communications.fr>
References: <20220808150641.19475-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:POfhC1wdOP0bC5+6zyOY7ktdFK/FopX8Y9/9RUqwjqSmMgJ5JPe
 06+yUt0oNECHknrxsD7IIjN3cOZv0c98UesXrDLZpJXezYP46A3qeu7ZlTHkrosU1wvtmpA
 Yz3LHisq9pnSpfJrcPklH8/Jh2djZNF3n6fA741W4mbagLgNM+ZbJz4bQa3hKxrelRpVHxA
 lCahVk1jNInBcRBGPIcaA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7b0E/BmPX2I=:AktAtHgtgXIUxtqoR3Xn2s
 UM7dTJHm98p/lLnapt+XaLHLQ8VdsGf4gIzLEOatm+oAV6+2e3GfN2gXkIlP6wvNkvYYkLGmI
 Jdgn6UvwQtvnznuc2A8j4G0IkdmBJdJFm9yPxdmsAnYA2tZMV2fQC/n7zhRXXF3qfsrKxRy4j
 vC+bw4GSnmgstA4BerMIf8zG39ytGJ/IJTbmxhq5Cg4W7fHK//VYlfil9XrPkKlsTek7O5JBB
 +OQyEy6bm2VIjQ/7pnQyTrdf56KEeDlME55bS9OtWlUPWAqDpznOZqFttueBRFXLztg3AcMlM
 BN8TJEyoqqTCqHxVJ7Z05d+A9frE43/piXR29EJNMXFK9kBgCtyq7ST/Mm/tBAg/eb2GOOl0J
 K7Pz3r2hV4cWTp711noH4RUte/YImG9vYGgNpmNT9YsEk5u7eqys+GlonrYiff8weejGXYk9c
 KjvrmZCFYqJI8dkv5usaCUyzXRujsQF8nMLk/Or95jcM+9fCNnYKSBGCQoJVCuVNqeWEhBRKD
 VJUGhleOqQU30YKvZHB3PDzBpLkhkmZKqspsB+aZm+xso3fYKPGiQokvfF1IRGuZakjGjQa2k
 Q4F3p2yTwrmgD9FN2m3Tl3haeWQG/JXadwl2xwFiQbqIWixLeCZ/VGQok96uecR4zLb75V5aq
 l2Nu/zeaK4xUEi6oC2h0ddEv6098aSevm9ziPWqubEJxOi8ZNvuVdUxVTgYGNcsL1WWaxaq/m
 KYQKC3UOE//GpxYv9BQqy5VcE5QO3VMb2ioircbnwf/TLfAETldEV7gw8I//ge3YfOlxXfxH5
 7ANg0Wz
Subject: [Buildroot] [PATCH 2/2] package/libgit2: bump to 1.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It includes an option to build a command line program that can be used
to replace git in simple cases.

The upcoming sha256 repository support made them take the sha256
algorithm implementation from RFC6234, hence the license change.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

--

Tested with test-pkg with various options on top of 417eb476fd.

It works, except for bootlin-armv7m-uclibc which always fails with
"MMU support available in C library, please enable BR2_USE_MMU"
when configuring the toolchain.
---
 package/libgit2/Config.in    | 10 ++++++++++
 package/libgit2/libgit2.hash |  4 ++--
 package/libgit2/libgit2.mk   | 15 +++++++++++++--
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/Config.in b/package/libgit2/Config.in
index 9c97676c4a..87f85c1c8f 100644
--- a/package/libgit2/Config.in
+++ b/package/libgit2/Config.in
@@ -14,3 +14,13 @@ config BR2_PACKAGE_LIBGIT2
 
 comment "libgit2 needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+
+if BR2_PACKAGE_LIBGIT2
+
+config BR2_PACKAGE_LIBGIT2_CLI
+	bool "enable command line interface (git2_cli)"
+	help
+	  Enable a command-line interface for libgit2.
+	  It aims to be git-compatible.
+
+endif
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 3b5837f789..fb760fd4cc 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f48b961e463a9e4e7e7e58b21a0fb5a9b2a1d24d9ba4d15870a0c9b8ad965163  libgit2-1.4.3.tar.gz
-sha256  0092f24acc306ee3287dc05b5e85cb9e0e48cd3f11c60c4625b1a673a5912616  COPYING
+sha256  8de872a0f201b33d9522b817c92e14edb4efad18dae95cf156cf240b2efff93e  libgit2-1.5.0.tar.gz
+sha256  0fc09da43d666b5b0cf5695defc3100d5cf387936b260ebab37e396d7e0dbc83  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 3f1e6e1593..99659bd511 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,9 +4,14 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.4.3
+LIBGIT2_VERSION = 1.5.0
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
-LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch), CC0-1.0 (xoroshiro256)
+LIBGIT2_LICENSE = \
+	GPL-2.0 with linking exception, \
+	MIT (sha1), \
+	BSD-3-Clause (sha256), \
+	wildmatch license (wildmatch), \
+	CC0-1.0 (xoroshiro256)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
 LIBGIT2_INSTALL_STAGING = YES
@@ -44,4 +49,10 @@ else
 LIBGIT2_CONF_OPTS += -DUSE_HTTPS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGIT2_CLI),y)
+LIBGIT2_CONF_OPTS += -DBUILD_CLI=ON
+else
+LIBGIT2_CONF_OPTS += -DBUILD_CLI=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
