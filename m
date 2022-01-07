Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B6BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A65E140010;
	Fri,  7 Jan 2022 22:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzoLGPzp1HHK; Fri,  7 Jan 2022 22:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75447424C3;
	Fri,  7 Jan 2022 22:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D07571C115D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBE8081775
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yHX5B8eizmVp for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8FDE81467
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 035CD834D2; Fri,  7 Jan 2022 22:04:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 23:03:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2426002d6fc81d0b023e3f3b3ee4e94ab29438cb
X-Git-Newrev: 69255af2299cdde0a8d6276952a867a2cb58889a
X-Patchwork-Hint: ignore
Message-Id: <20220107220415.035CD834D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pybind: bump to version
 2.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=69255af2299cdde0a8d6276952a867a2cb58889a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[Arnout: bump to 2.9.0, refresh patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-pybind11-commands.py-support-STAGING_DIR.patch       | 11 +++++------
 package/python-pybind/python-pybind.hash                      |  2 +-
 package/python-pybind/python-pybind.mk                        |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
index 981a387be4..021321a9b7 100644
--- a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
+++ b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
@@ -1,4 +1,4 @@
-From 9feaba4792c1d0a28e560ae941fa9ebabbbe4013 Mon Sep 17 00:00:00 2001
+From bf9f0d619e2e0a424e471a2f9235d26ece5b348c Mon Sep 17 00:00:00 2001
 From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Date: Fri, 7 Jan 2022 19:32:18 +0100
 Subject: [PATCH] pybind11/commands.py: support STAGING_DIR
@@ -13,18 +13,17 @@ the current directory, if it is set.
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Upstream-Status: N/A, Buildroot specific
 ---
- pybind11/commands.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ pybind11/commands.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/pybind11/commands.py b/pybind11/commands.py
-index 34dbaf8..8c4876d 100644
+index 11f81d2..8c4876d 100644
 --- a/pybind11/commands.py
 +++ b/pybind11/commands.py
-@@ -1,8 +1,8 @@
+@@ -1,7 +1,8 @@
  # -*- coding: utf-8 -*-
  import os
  
--
 -DIR = os.path.abspath(os.path.dirname(__file__))
 +DIR = os.environ.get('STAGING_DIR') or \
 +    os.path.abspath(os.path.dirname(__file__))
diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index a68ac846e2..d5b4b4829e 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  cdbe326d357f18b83d10322ba202d69f11b2f49e2d87ade0dc2be0c5c34f8e2a  python-pybind-2.6.1.tar.gz
+sha256  057fb68dafd972bc13afb855f3b0d8cf0fa1a78ef053e815d9af79be7ff567cb  python-pybind-2.9.0.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 4dd52003ad..7448d246b2 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.6.1
+PYTHON_PYBIND_VERSION = 2.9.0
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
