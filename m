Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC36C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D354826FB;
	Sun,  3 Apr 2022 19:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgTuXlWl8y6r; Sun,  3 Apr 2022 19:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41CF382435;
	Sun,  3 Apr 2022 19:05:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88FB71BF36B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85F56415D7
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzplnbFSqOMj for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:04:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FAAC415D6
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:04:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 278F08607A; Sun,  3 Apr 2022 18:55:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 21:03:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fb9c1e8df655a8ba86f38145486d5412e44b84b
X-Git-Newrev: fccc96f6aa673bacec62b9ec82f8c888cb0b5a31
X-Patchwork-Hint: ignore
Message-Id: <20220403185526.278F08607A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cppcms: bump to version 2.0.0-beta2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fccc96f6aa673bacec62b9ec82f8c888cb0b5a31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update indentation in hash file (two spaces)
- This bump will fix the following build failure if python2 is not
  available on host (while at it, add host-python3 dependency):

Traceback (most recent call last):
  File "/home/autobuild/autobuild/instance-4/output-1/build/cppcms-1.2.1/bin/cppcms_tmpl_cc", line 14, in <module>
    import StringIO
ModuleNotFoundError: No module named 'StringIO'

http://cppcms.com/wikipp/en/page/cppcms_2_0_whats_new

Fixes:
 - http://autobuild.buildroot.org/results/00482ee24deae95a91f8499f499b18e15f14b51a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cppcms/cppcms.hash | 14 +++++++-------
 package/cppcms/cppcms.mk   |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/cppcms/cppcms.hash b/package/cppcms/cppcms.hash
index 86f86d94af..a8d04ff36f 100644
--- a/package/cppcms/cppcms.hash
+++ b/package/cppcms/cppcms.hash
@@ -1,8 +1,8 @@
-# From http://sourceforge.net/projects/cppcms/files/cppcms/1.2.1/
-sha1	9cb25cc5d507d2f4235326ba3815eba252b4ac77	cppcms-1.2.1.tar.bz2
-md5	2bb259fefb86532e404207c71c094a0c	cppcms-1.2.1.tar.bz2
+# From http://sourceforge.net/projects/cppcms/files/cppcms/2.0.0-beta2/
+sha1  746cc5e3f58565d91d9ded6e2616399d60e9d01d  cppcms-2.0.0.beta2.tar.bz2
+md5  ef561d13ee92d2053151cab073feba10  cppcms-2.0.0.beta2.tar.bz2
 # Locally computed:
-sha256  10fec7710409c949a229b9019ea065e25ff5687103037551b6f05716bf6cac52	cppcms-1.2.1.tar.bz2
-sha256  fb7c15ddf590037d4cd18ebd61148a2304b9243369d238a64f599182377e32db	COPYING.TXT
-sha256	3e4012cc5950e05bedfdd2f00ceffe1ef71c46ac8c79f07e237ecb23c773f65f	MIT.TXT
-sha256	d6ce062e5cf4f7e3c536d7d2fee84c882c45245f1848ed3162401f2b29fa2b4b	THIRD_PARTY_SOFTWARE.TXT
+sha256  697031c7d141fdd215c6be5090b66e2106a63bb3e52f09ee8120e8efc6c08a21  cppcms-2.0.0.beta2.tar.bz2
+sha256  fb7c15ddf590037d4cd18ebd61148a2304b9243369d238a64f599182377e32db  COPYING.TXT
+sha256  3e4012cc5950e05bedfdd2f00ceffe1ef71c46ac8c79f07e237ecb23c773f65f  MIT.TXT
+sha256  d6ce062e5cf4f7e3c536d7d2fee84c882c45245f1848ed3162401f2b29fa2b4b  THIRD_PARTY_SOFTWARE.TXT
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index c560b5d0fa..8a59990a8d 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CPPCMS_VERSION = 1.2.1
-CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
+CPPCMS_VERSION = 2.0.0-beta2
+CPPCMS_SOURCE = cppcms-$(subst -,.,$(CPPCMS_VERSION)).tar.bz2
 CPPCMS_LICENSE = MIT, BSL-1.0 (boost), Public Domain (json2.js), Zlib (md5)
 CPPCMS_LICENSE_FILES = COPYING.TXT MIT.TXT THIRD_PARTY_SOFTWARE.TXT
 CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
@@ -18,7 +18,7 @@ CPPCMS_CONF_OPTS = \
 	-DCMAKE_SKIP_RPATH=ON \
 	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
 
-CPPCMS_DEPENDENCIES = pcre
+CPPCMS_DEPENDENCIES = host-python3 pcre
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
