Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF736D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FD6282020;
	Sat, 26 Oct 2024 16:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8F7WZB7JujZM; Sat, 26 Oct 2024 16:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33F5C82049
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F5C82049;
	Sat, 26 Oct 2024 16:07:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29BCD5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E24881FB0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qx3I_UrRy5W7 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18EC581FAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18EC581FAB
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1380E80236; Sat, 26 Oct 2024 16:07:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 17:59:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b0f830b9fb7bd916d21fa68bec62cfaea5d5fcd
X-Git-Newrev: 317958985934cb76f8df213d9beb64251678c77a
X-Patchwork-Hint: ignore
Message-Id: <20241026160709.1380E80236@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/setools: bump version to 4.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=317958985934cb76f8df213d9beb64251678c77a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Refresh 0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch to
apply cleanly with 4.5.1.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rt-use-setools.InfoFlowAnalysis-and-setoo.patch | 98 ++++++++--------------
 package/setools/setools.hash                       |  2 +-
 package/setools/setools.mk                         |  2 +-
 3 files changed, 35 insertions(+), 67 deletions(-)

diff --git a/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch b/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
index 67c306e99c..67a7395c3c 100644
--- a/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
+++ b/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
@@ -15,51 +15,50 @@ sedta and seinfoflow to require python3-networkx
 Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
 [Refreshed for 4.3.0]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[Refreshed for 4.4.2]
+[Refreshed for 4.5.1]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- sedta                       | 3 ++-
- seinfoflow                  | 5 +++--
- setools/__init__.py         | 4 ++--
- setoolsgui/apol/dta.py      | 2 +-
- setoolsgui/apol/infoflow.py | 2 +-
- tests/test_dta.py           | 2 +-
- tests/test_infoflow.py      | 2 +-
- 7 files changed, 11 insertions(+), 9 deletions(-)
+ sedta                  | 3 ++-
+ seinfoflow             | 5 +++--
+ setools/__init__.py    | 2 +-
+ tests/test_dta.py      | 2 +-
+ tests/test_infoflow.py | 2 +-
+ 5 files changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/sedta b/sedta
-index ffd9ede..4c53825 100755
+index 9b580fc..bec89d4 100755
 --- a/sedta
 +++ b/sedta
-@@ -10,6 +10,7 @@ import logging
- import signal
+@@ -12,6 +12,7 @@ import warnings
  
+ import networkx as nx
  import setools
 +import setools.dta
  
  
- def print_transition(trans: setools.DomainTransition) -> None:
-@@ -104,7 +105,7 @@ else:
+ signal.signal(signal.SIGPIPE, signal.SIG_DFL)
+@@ -68,7 +69,7 @@ else:
  
  try:
      p = setools.SELinuxPolicy(args.policy)
--    g = setools.DomainTransitionAnalysis(p, reverse=args.reverse, exclude=args.exclude)
-+    g = setools.dta.DomainTransitionAnalysis(p, reverse=args.reverse, exclude=args.exclude)
+-    g = setools.DomainTransitionAnalysis(p, exclude=args.exclude)
++    g = setools.dta.DomainTransitionAnalysis(p, exclude=args.exclude)
  
-     if args.shortest_path or args.all_paths:
-         if args.shortest_path:
+     pathnum: int = 0
+     path: setools.DTAPath
 diff --git a/seinfoflow b/seinfoflow
-index 5f4e764..a27b781 100755
+index b4ad328..61f1ef5 100755
 --- a/seinfoflow
 +++ b/seinfoflow
-@@ -5,6 +5,7 @@
- #
+@@ -13,6 +13,7 @@ from typing import Dict, Optional
  
+ import networkx as nx
  import setools
 +import setools.infoflow
- import argparse
- import sys
- import logging
-@@ -94,8 +95,8 @@ elif args.booleans is not None:
+ 
+ signal.signal(signal.SIGPIPE, signal.SIG_DFL)
+ 
+@@ -104,8 +105,8 @@ elif args.booleans is not None:
  try:
      p = setools.SELinuxPolicy(args.policy)
      m = setools.PermissionMap(args.map)
@@ -68,54 +67,23 @@ index 5f4e764..a27b781 100755
 +    g = setools.infoflow.InfoFlowAnalysis(p, m, min_weight=args.min_weight, exclude=args.exclude,
 +                                          booleans=booleans)
  
-     if args.shortest_path or args.all_paths:
-         if args.shortest_path:
+     flownum: int = 0
+     flow: setools.InfoFlowPath
 diff --git a/setools/__init__.py b/setools/__init__.py
-index ad9b36a..2bde01b 100644
+index 1efd2cc..fe54ab2 100644
 --- a/setools/__init__.py
 +++ b/setools/__init__.py
-@@ -77,11 +77,11 @@ from .pcideviceconquery import PcideviceconQuery
- from .devicetreeconquery import DevicetreeconQuery
- 
- # Information Flow Analysis
--from .infoflow import InfoFlowAnalysis
-+# from .infoflow import InfoFlowAnalysis
+@@ -81,7 +81,7 @@ from .infoflow import *
  from .permmap import PermissionMap, RuleWeight, Mapping
  
  # Domain Transition Analysis
--from .dta import DomainTransitionAnalysis, DomainEntrypoint, DomainTransition
-+# from .dta import DomainTransitionAnalysis, DomainEntrypoint, DomainTransition
+-from .dta import *
++# from .dta import *
  
  # Policy difference
  from .diff import PolicyDifference
-diff --git a/setoolsgui/apol/dta.py b/setoolsgui/apol/dta.py
-index a78d960..e71c70a 100644
---- a/setoolsgui/apol/dta.py
-+++ b/setoolsgui/apol/dta.py
-@@ -11,7 +11,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
- from PyQt5.QtGui import QPalette, QTextCursor
- from PyQt5.QtWidgets import QCompleter, QHeaderView, QMessageBox, QProgressDialog, \
-     QTreeWidgetItem
--from setools import DomainTransitionAnalysis
-+from setools.dta import DomainTransitionAnalysis
- 
- from ..logtosignal import LogHandlerToSignal
- from .analysistab import AnalysisSection, AnalysisTab
-diff --git a/setoolsgui/apol/infoflow.py b/setoolsgui/apol/infoflow.py
-index fb9b409..738f1b8 100644
---- a/setoolsgui/apol/infoflow.py
-+++ b/setoolsgui/apol/infoflow.py
-@@ -13,7 +13,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
- from PyQt5.QtGui import QPalette, QTextCursor
- from PyQt5.QtWidgets import QCompleter, QHeaderView, QMessageBox, QProgressDialog, \
-     QTreeWidgetItem
--from setools import InfoFlowAnalysis
-+from setools.infoflow import InfoFlowAnalysis
- from setools.exception import UnmappedClass, UnmappedPermission
- 
- from ..logtosignal import LogHandlerToSignal
 diff --git a/tests/test_dta.py b/tests/test_dta.py
-index 7f9bbc9..48338c5 100644
+index 2398b3f..b943bd6 100644
 --- a/tests/test_dta.py
 +++ b/tests/test_dta.py
 @@ -5,7 +5,7 @@
@@ -128,7 +96,7 @@ index 7f9bbc9..48338c5 100644
  from setools.exception import InvalidType
  from setools.policyrep import Type
 diff --git a/tests/test_infoflow.py b/tests/test_infoflow.py
-index 5a8f745..e25993b 100644
+index ba2983f..9cd6ab3 100644
 --- a/tests/test_infoflow.py
 +++ b/tests/test_infoflow.py
 @@ -5,7 +5,7 @@
@@ -141,5 +109,5 @@ index 5a8f745..e25993b 100644
  from setools.exception import InvalidType
  from setools.permmap import PermissionMap
 -- 
-2.26.2
+2.46.0
 
diff --git a/package/setools/setools.hash b/package/setools/setools.hash
index bb98231de9..26b893c09e 100644
--- a/package/setools/setools.hash
+++ b/package/setools/setools.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  92afeea2f2433cbb981ff47f6ce4e2485d9202b530842f7f5d95f905b2ddaea4  setools-4.4.4.tar.gz
+sha256  3fc1d663bbe00e3e2c3f97b371ff55b468e70d7965908cfde35ccc8e55bb2491  setools-4.5.1.tar.gz
 sha256  0e58d74751e394f39748c7b7b4039d6a883b5def9711160668ba962b52e69e01  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 1ffc2852d2..81ae11d004 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SETOOLS_VERSION = 4.4.4
+SETOOLS_VERSION = 4.5.1
 SETOOLS_SITE = $(call github,SELinuxProject,setools,$(SETOOLS_VERSION))
 SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-flex host-python-cython host-swig
 SETOOLS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
