Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380BCC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:46:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B178160F11
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B178160F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81753415B6;
	Wed, 22 Sep 2021 19:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTdhR9-OSWIC; Wed, 22 Sep 2021 19:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5041415B1;
	Wed, 22 Sep 2021 19:46:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2548C1BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2227A84279
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rd7wafToYDu for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:46:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2829684278
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 002D78CA06; Wed, 22 Sep 2021 19:44:36 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 21:30:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb18218ad125c1e4c13010c8ee946057ee07103c
X-Git-Newrev: 35f15db30ac769d158fae480668c51a583f9beea
X-Patchwork-Hint: ignore
Message-Id: <20210922194437.002D78CA06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support: utils: use python3 explicitly
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=35f15db30ac769d158fae480668c51a583f9beea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python 2 is EOL sice 2020 [1], it's still available on distros, but may not
be installed by default (as being replaced by python3).

Thus remove compatibility imports:
from __future__ import print_function
from __future__ import absolute_import

Tested with python3 -m py_compile.

[1] https://www.python.org/doc/sunset-python-2/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/cve.py                                 | 2 +-
 support/scripts/graph-build-time                       | 2 +-
 support/scripts/graph-depends                          | 2 +-
 support/scripts/pycompile.py                           | 4 +---
 support/scripts/size-stats                             | 2 +-
 support/testing/tests/package/sample_gst1_python.py    | 2 +-
 support/testing/tests/package/sample_python_gobject.py | 2 +-
 utils/check-package                                    | 3 +--
 utils/genrandconfig                                    | 4 +---
 utils/get-developers                                   | 2 +-
 utils/getdeveloperlib.py                               | 1 -
 utils/size-stats-compare                               | 2 +-
 12 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 13c29fabe0..7cd6fce4d8 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2009 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 # Copyright (C) 2020 by Gregory CLEMENT <gregory.clement@bootlin.com>
diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index ba3cdad85b..742c9a7a50 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2011 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 # Copyright (C) 2013 by Yann E. MORIN <yann.morin.1998@free.fr>
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index d42bebce9d..a66fb28f41 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Usage (the graphviz package must be installed in your distribution)
 #  ./support/scripts/graph-depends [-p package-name] > test.dot
diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index b8cd3cee6c..8774144a90 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 """
 Byte compile all .py files from provided directories. This script is an
@@ -6,8 +6,6 @@ alternative implementation of compileall.compile_dir written with
 cross-compilation in mind.
 """
 
-from __future__ import print_function
-
 import argparse
 import os
 import py_compile
diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index dea3a6007c..bf3d12a9b7 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2014 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
diff --git a/support/testing/tests/package/sample_gst1_python.py b/support/testing/tests/package/sample_gst1_python.py
index fab7e74f40..2d7e0e1ed9 100644
--- a/support/testing/tests/package/sample_gst1_python.py
+++ b/support/testing/tests/package/sample_gst1_python.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 """A simple test that uses gst1-python to run a fake videotestsrc for 100
 frames
 """
diff --git a/support/testing/tests/package/sample_python_gobject.py b/support/testing/tests/package/sample_python_gobject.py
index 50564aa79f..4490a73613 100644
--- a/support/testing/tests/package/sample_python_gobject.py
+++ b/support/testing/tests/package/sample_python_gobject.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 """A simple test that uses python-gobject to find the path of sh."""
 from gi.repository import GLib
 
diff --git a/utils/check-package b/utils/check-package
index dd18d19c25..a959fef079 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -1,7 +1,6 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # See utils/checkpackagelib/readme.txt before editing this file.
 
-from __future__ import print_function
 import argparse
 import inspect
 import os
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 622cfd4891..a1431bf1a8 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2014 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 #
@@ -18,8 +18,6 @@
 
 # This script generates a random configuration for testing Buildroot.
 
-from __future__ import print_function
-
 import contextlib
 import csv
 import os
diff --git a/utils/get-developers b/utils/get-developers
index 9182b2d85f..22accaf181 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 import argparse
 import getdeveloperlib
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index ce822320f8..438d26d68d 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -1,4 +1,3 @@
-from __future__ import print_function
 from io import open
 import os
 import re
diff --git a/utils/size-stats-compare b/utils/size-stats-compare
index a3d7f250c6..422972e488 100755
--- a/utils/size-stats-compare
+++ b/utils/size-stats-compare
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2016 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
