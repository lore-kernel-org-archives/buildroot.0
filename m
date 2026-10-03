Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D989CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1300A60FE0;
	Sat,  3 Oct 2026 15:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUKQPu1ETCA2; Sat,  3 Oct 2026 15:56:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EB6A66101B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043009;
	b=tdE6/GpeD1Kj8YKd3eKzPZKSjrIaJkKuiSNKzBBNOIq7zXE4Gw+q9EITBnEgywFYpPV8
	 FXie+Lu3/BvabrKzwtQAAaLCcCwXNZwdesW32Ot/iCvJKaD8f9tUE1tfy3EVmz0Akdtyz
	 9zo46k7dKx+1f7qvm1l4EG3qRU6/Dlfns88kjfUw0+vYGsKc2T1vRAm1mxBYgpagkO+cH
	 oykNIxxVJLZ/pHis03HhaYqrhrFhCjD1Yma/6ch8xwLVYUUTi5i0cgpDAKo6twppbiaog
	 a2hbnZ8Ot3qF2adgCSMG2nxPkdyz8eHSElcXltHdKmjQJ3yiDMU+e4t0fQofwezhvmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LACG91VNdNlGXE5HTVB9PlHWkpdOCeI+x+DIOtF2NIs=;
	b=V/0tzaDYCkMCWfLWpDNDkseNhzbZlRWRegzCEjX6ubEWp9cbGc3sRAWj98OaHeFw34pl
	 YAWutQEvdgDH/q6HNuJZC0W1a7qoYX2ZqTNJV6SFN6A3d2eidvVSIoW1s/we3CeG28WVQ
	 JhqjsLbbYp1I7WCTV/T5MJ252E4S9ary4Pyucz+14FGJK9Kn7LX6wp0A2cw54cSdzjmfk
	 90VaBjpGvOxO/T3NvmrJ1awXS1Izv0rVI2le7T1WwOtK7VuIL2AAd3bfHCqoE89QFmIPA
	 SBUiNn3uD5sjqavAkfsKlcGf52ssOWcE1+5ZMgBt75X6sBbpZEKzLfNv9SRM55DzgWg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043009;
	bh=LACG91VNdNlGXE5HTVB9PlHWkpdOCeI+x+DIOtF2NIs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V/chumZxR/t+ngP1Wk6B6byNAxyWA6wIYeXHYIHF65wYsEFbprF5U9Nz3ytymOvJ1
	 yVfXeL69XsOy1wdFWWjYVmkLW9TpPdwfJ1i90iRNZlKn8nAPOE0BjSTmCcnfEg9+Va
	 kV/xQsCoy3DNzM2L2MPE+gB9nFlpGGqsUukxfPKrdxpDNNXEY07neg1r28eKWb+Q1E
	 g4RojKMZxWweJT0zszs98LO8Z+qHGQuXfdA2h8DRMFzIBc6q5+iMloW8zx8fVs2qgl
	 OfvZvkC0rPSP2qIy1gQ0ILe5Jf3sO2btAFvkYqbRZK3EfxZ3D8g3w8T+wxTRHW68zq
	 Nxp9Vl0uDOesw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB6A66101B;
	Sat,  3 Oct 2026 15:56:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72D95476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE68A60685
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guPnaOEUN0-6 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BFD4360673
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=kiU072Xxd9KIf2+MqHr8c334jcibs4AzZIsSFuVj8hTJmZ/VFRiKI3YHejks66Ssv8kh
 4HZuz7jh/jzBUSGGP86YVFPaboPGOkiT3AkIiM0QyeRWm9cNcHDhJbZ/PIU1A70O9m5gH
 Kn0zV5p/pwE+CYtbchhu2b3GkJadxgT9eyViIeh7SDgwI7E7cUAEkS6g7Lip6edqSg5Gq
 sXkCFHmXgOP985DWD0QUm8bIdvXeJ4ZBQRoBjZ5xXAw9YiE41LnpqWYTu4LK3GiewctVq
 6q3PJCMrCWi6++ohxO29I7DcWUWmoJ1o1q1oydJycykDNapnwBphZsDphj9WbuQC3sw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IciBwVjLdiNn8SoFA/vP8KW+ebq0y/pkh0afalhTkR4=;
 b=QpfZEPeyVbazvkNHJKPuvfL3Xc9PvZaSkUtU4HXE5DXvlGNRtjLCgVcq4o5qig0h38iM
 51Ht4qdzpnmMxl6xK6RpJMt2EP9bIkxA/r+edkXpANu2Nu0xNloWixcfghRnsSSV2Wv7O
 rCp8aSVJbRemXZj2iKT1BL2y78foL3FDD1SsFkXLomsF9+7Mq1GJuh9lQoxLCuiWj0fjX
 XrW6HywVcGfZeciGepl3ZlcVOOUm5dg+nXdGhrw8HGj6tJe1y4Ob6xhYXjcwUPnkko/Ro
 Uirj7HZ4u2ABKvNZ1wekF9XH7t9FgAckzgiTYlwmG3hR0huCbycwJsHbjGNdZiiTDDQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFD4360673
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B6CD886DD; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4407ca0af959c450a81f2342c4f63ae3c5e09533
X-Git-Newrev: 933d454d22146b6fabfc178091e7b0865634d65c
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.0B6CD886DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-html5lib: fix build with
 setuptools >= 82
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/933d454d22146b6fabfc178091e7b0865634d65c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...cept-ImportError-for-missing-pkg_resource.patch | 36 +++++++++++++
 ...-Replace-pkg_resources-use-with-packaging.patch | 59 ++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/package/python-html5lib/0002-setup.py-except-ImportError-for-missing-pkg_resource.patch b/package/python-html5lib/0002-setup.py-except-ImportError-for-missing-pkg_resource.patch
new file mode 100644
index 0000000000..55e468db72
--- /dev/null
+++ b/package/python-html5lib/0002-setup.py-except-ImportError-for-missing-pkg_resource.patch
@@ -0,0 +1,36 @@
+From a29f42562056cca84108aadea37158f718fc8b92 Mon Sep 17 00:00:00 2001
+From: loqs <loqs@users.noreply.github.com>
+Date: Mon, 16 Mar 2026 22:33:37 +0000
+Subject: [PATCH] setup.py: except ImportError for missing pkg_resources
+
+Missing pkg_resources indicates setuptools 82 or newer which is more recent that than 18.5 so the version check using pkg_resources can safely be skipped.
+
+Upstream: https://github.com/html5lib/html5lib-python/pull/594
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setup.py | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 30ee057..0aa584d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -6,9 +6,12 @@ import sys
+ 
+ from os.path import join, dirname
+ from setuptools import setup, find_packages, __version__ as setuptools_version
+-from pkg_resources import parse_version
+ 
+-import pkg_resources
++try:
++    import pkg_resources
++    from pkg_resources import parse_version
++except ImportError:
++    pkg_resources = None
+ 
+ try:
+     import _markerlib.markers
+-- 
+2.47.3
+
diff --git a/package/python-html5lib/0003-conftest.py-Replace-pkg_resources-use-with-packaging.patch b/package/python-html5lib/0003-conftest.py-Replace-pkg_resources-use-with-packaging.patch
new file mode 100644
index 0000000000..219c5c4185
--- /dev/null
+++ b/package/python-html5lib/0003-conftest.py-Replace-pkg_resources-use-with-packaging.patch
@@ -0,0 +1,59 @@
+From 0bf746e3ed39d8b10b31ad292a19aa2d98e7058c Mon Sep 17 00:00:00 2001
+From: loqs <loqs@users.noreply.github.com>
+Date: Mon, 16 Mar 2026 22:38:32 +0000
+Subject: [PATCH] conftest.py: Replace pkg_resources use with packaging
+
+Upstream: https://github.com/html5lib/html5lib-python/pull/594
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ html5lib/tests/conftest.py | 22 +++++++++++++---------
+ requirements-test.txt      |  2 ++
+ 2 files changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/html5lib/tests/conftest.py b/html5lib/tests/conftest.py
+index fffeb50..a1f6b21 100644
+--- a/html5lib/tests/conftest.py
++++ b/html5lib/tests/conftest.py
+@@ -2,7 +2,12 @@ from __future__ import print_function
+ import os.path
+ import sys
+ 
+-import pkg_resources
++from packaging.requirements import Requirement
++from packaging.markers import Marker
++try:
++    from importlib import metadata
++except ImportError:
++    import importlib_metadata as metadata
+ import pytest
+ 
+ from .tree_construction import TreeConstructionFile
+@@ -63,17 +68,16 @@ def pytest_configure(config):
+                             spec, marker = line.strip().split(";", 1)
+                         else:
+                             spec, marker = line.strip(), None
+-                        req = pkg_resources.Requirement.parse(spec)
+-                        if marker and not pkg_resources.evaluate_marker(marker):
++                        req = Requirement(spec)
++                        if marker and not Marker(marker).evaluate():
+                             msgs.append("%s not available in this environment" % spec)
+                         else:
+                             try:
+-                                installed = pkg_resources.working_set.find(req)
+-                            except pkg_resources.VersionConflict:
+-                                msgs.append("Outdated version of %s installed, need %s" % (req.name, spec))
+-                            else:
+-                                if not installed:
+-                                    msgs.append("Need %s" % spec)
++                                installed = metadata.version(req.name)
++                                if not req.specifier.contains(installed, prereleases=True):
++                                    msgs.append("Outdated version of %s installed, need %s" % (req.name, spec))
++                            except metadata.PackageNotFoundError:
++                                msgs.append("Need %s" % spec)
+ 
+         # Check cElementTree
+         import xml.etree.ElementTree as ElementTree
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
