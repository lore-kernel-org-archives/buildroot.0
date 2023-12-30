Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CC5C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDAD960A7D;
	Sat, 30 Dec 2023 17:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDAD960A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXBgVS4FoEBw; Sat, 30 Dec 2023 17:56:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1762F60BE3;
	Sat, 30 Dec 2023 17:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1762F60BE3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB7D41BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 924CC8149B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 924CC8149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljOouEx-fDlk for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7801C8143E
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7801C8143E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F898839B3; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:51:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5efd903ef0b92c7ef0deca8b4f050df5c19c31f4
X-Git-Newrev: 132c71798c6e9c47c61e8a8a45db2d0266ac92f7
X-Patchwork-Hint: ignore
Message-Id: <20231230175629.5F898839B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/audit: bump to version 3.1.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=132c71798c6e9c47c61e8a8a45db2d0266ac92f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/linux-audit/audit-userspace/blob/v3.1.2/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Define-__attribute_malloc__-when-needed.patch | 35 ----------------------
 package/audit/audit.hash                           |  2 +-
 package/audit/audit.mk                             |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/audit/0001-Define-__attribute_malloc__-when-needed.patch b/package/audit/0001-Define-__attribute_malloc__-when-needed.patch
deleted file mode 100644
index 3dd5359bfc..0000000000
--- a/package/audit/0001-Define-__attribute_malloc__-when-needed.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cf93d8579d5cec0b1ba585bd661776f03c2743ba Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Tue, 27 Jun 2023 20:19:13 +0200
-Subject: [PATCH] Define __attribute_malloc__ when needed
-
-attribute_malloc is not available on musl
-
-auparse.h: In function 'auparse_init':
-auparse.h:54:2: error: expected declaration specifiers before '__attribute_malloc__'
-   54 |  __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
-
-Upstream: https://github.com/linux-audit/audit-userspace/pull/311
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- auparse/auparse.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/auparse/auparse.h b/auparse/auparse.h
-index 95cf256d..5cb7402e 100644
---- a/auparse/auparse.h
-+++ b/auparse/auparse.h
-@@ -32,6 +32,9 @@
- # define __attr_dealloc(dealloc, argno)
- # define __attr_dealloc_free
- #endif
-+#ifndef __attribute_malloc__
-+#  define __attribute_malloc__
-+#endif
- 
- #ifdef __cplusplus
- extern "C" {
--- 
-2.39.2
-
diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 310b0a0f6a..5743b3a13a 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  46e46b37623cce09e6ee134e78d668afc34f4e1c870c853ef12e4193078cfe87  audit-3.1.1.tar.gz
+sha256  c0b1792d1f0a88c6f1828710509cbb987059fc68712c97669ca90eae103d287d  audit-3.1.2.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index e77e06bd6b..76828571ca 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.1.1
+AUDIT_VERSION = 3.1.2
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
