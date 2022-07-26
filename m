Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DC5C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 803FD422FF;
	Tue, 26 Jul 2022 17:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 803FD422FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOH1Pak3gJas; Tue, 26 Jul 2022 17:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19BD1421FD;
	Tue, 26 Jul 2022 17:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19BD1421FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E00C1BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04EDD60EE1
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04EDD60EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAu7nv_sf-Ux for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:45:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 201D260D55
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 201D260D55
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:45:24 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id DB127202F7;
 Tue, 26 Jul 2022 12:45:22 -0500 (CDT)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 12:45:05 -0500
Message-Id: <20220726174505.2976048-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1658857522; bh=OXUj74Rt/k5QAGFJ1e5V7FZqHI77vFzwhQ+mf1u5PAc=;
 h=From:To:Cc:Subject:Date:From;
 b=N+my7YRsJqdkgfQ/Gr0xX+TqRcVAxd3FlkBsyccp5zLu2kT2APf6ZtAyc16pAaa1N
 iDeVoiLIKPm/tHyhcAIl6Q3u7lRtHpOfFBYMJzkkxbMYWhukV43u/g0xTn/QjSN8il
 TKV06w77xT97R5FEy1UfJwph6C63TyK8JkMoyiUU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=N+my7YRs
Subject: [Buildroot] [PATCH] package/mcelog: bump to version 184
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
Cc: Romain Naour <romain.naour@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Minor changes necessary to fix building the package:
  - Call out host-python3 in the makefile
  - Patch genconfig.py to not use hardcoded python3 shebang

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 .../0001-Use-env-as-the-shebang-target.patch  | 33 +++++++++++++++++++
 package/mcelog/mcelog.hash                    |  2 +-
 package/mcelog/mcelog.mk                      |  3 +-
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 package/mcelog/0001-Use-env-as-the-shebang-target.patch

diff --git a/package/mcelog/0001-Use-env-as-the-shebang-target.patch b/package/mcelog/0001-Use-env-as-the-shebang-target.patch
new file mode 100644
index 0000000000..ce9fc9c44c
--- /dev/null
+++ b/package/mcelog/0001-Use-env-as-the-shebang-target.patch
@@ -0,0 +1,33 @@
+From c6eee289225beccfc40c73d31baa4179abc5ac57 Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@xes-inc.com>
+Date: Thu, 21 Jul 2022 16:56:11 -0500
+Subject: [PATCH] Use env as the shebang target
+
+Let the script be flexible when it comes to finding the python3
+interpreter.
+
+Some build wrappers, such as buildroot, will provide a python3 binary
+for use by scripts but it will not be at the fixed path of /usr/bin/.
+Instead it will be available in a path defined in $PATH
+
+Using env as the shebang target with python3 as the command will follow
+$PATH search priority when determining the python3 interpreter.
+
+Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
+---
+ genconfig.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/genconfig.py b/genconfig.py
+index a387cb3..48c1b3e 100755
+--- a/genconfig.py
++++ b/genconfig.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ # generate man config documentation from mcelog.conf example
+ # genconfig.py mcelog.conf intro.html
+ import sys
+-- 
+2.25.1
+
diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index 598aa648fd..94b5f2cc37 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e9c82b565da06673c2630f9e6bc668634ad7d2c7f13c70db1900cce110ae62dc  mcelog-180.tar.gz
+sha256  067d52006f0aa42045acc6d9c04d590362448bacd8ef415d42729e6f35825028  mcelog-184.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index da7785ca91..6a0d806661 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 180
+MCELOG_VERSION = 184
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
 MCELOG_SELINUX_MODULES = mcelog
+MCELOG_DEPENDENCIES = host-python3
 
 define MCELOG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
