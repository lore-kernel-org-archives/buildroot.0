Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D459C3DA60
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 168D940327;
	Mon, 15 Jul 2024 10:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xojIbN54UWFh; Mon, 15 Jul 2024 10:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3980940510
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3980940510;
	Mon, 15 Jul 2024 10:14:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7B061BF97C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D36E3405C1
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spahbEzOq5w9 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E019B405D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E019B405D2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAD1A86C42; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca7cedaa8cab0a0ac0fc48c2f40c4e6a84fb6877
X-Git-Newrev: efc5e6ad52150d2724867df672677eb668eb4807
X-Patchwork-Hint: ignore
Message-Id: <20240715101423.DAD1A86C42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: another
 fix for Python 3.12 issue
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
Content-Type: multipart/mixed; boundary="===============6701025840119018331=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6701025840119018331==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=efc5e6ad52150d2724867df672677eb668eb4807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Further down the build:

FAILED: gen/components/resources/ssl/ssl_error_assistant/ssl_error_assistant.pb
/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/host-bin/python ../../3rdparty/chromium/components/resources/ssl/ssl_error_assistant/gen_ssl_error_assistant_proto.py -w -i ../../3rdparty/chromium/components/resources/ssl/ssl_error_assistant/ssl_error_assistant.asciipb -d gen/components/resources/ssl/ssl_error_assistant -o ssl_error_assistant.pb -p pyproto -p pyproto/components/security_interstitials/content/
Traceback (most recent call last):
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/components/resources/ssl/ssl_error_assistant/gen_ssl_error_assistant_proto.py", line 23, in <module>
    from binary_proto_generator import BinaryProtoGenerator
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/components/resources/protobufs/binary_proto_generator.py", line 12, in <module>
    import imp
ModuleNotFoundError: No module named 'imp'

Backport an upstream patch fixing this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...imp.load_source-with-importlib-equivalent.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0007-Replace-imp.load_source-with-importlib-equivalent.patch b/package/qt5/qt5webengine-chromium/0007-Replace-imp.load_source-with-importlib-equivalent.patch
new file mode 100644
index 0000000000..d001a887fa
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0007-Replace-imp.load_source-with-importlib-equivalent.patch
@@ -0,0 +1,55 @@
+From d08221f81f35f2755088c2a174cfdc230eb1dcc4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
+Date: Wed, 25 Oct 2023 06:20:54 +0000
+Subject: [PATCH] Replace imp.load_source with importlib equivalent.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The imp module has been deprecated for years and the function
+load_source was even removed from the documentation long ago.
+
+It will be removed in Python 3.12, which will be part of Fedora
+version 39, due in late October 2023.
+
+Bug: 1487454
+Change-Id: If06a2f139225b62c7bdc70c3eaef6e5acb8972d2
+Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/4894238
+Reviewed-by: Mustafa Emre Acer <meacer@chromium.org>
+Commit-Queue: Jacobo Aragunde Pérez <jaragunde@igalia.com>
+Cr-Commit-Position: refs/heads/main@{#1214660}
+Upstream: https://github.com/chromium/chromium/commit/9e0c89a3b5638ba2b9b107fea34a01c774aa7805
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../resources/protobufs/binary_proto_generator.py         | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/chromium/components/resources/protobufs/binary_proto_generator.py b/chromium/components/resources/protobufs/binary_proto_generator.py
+index 16365515f26..c8b11f1071a 100755
+--- a/chromium/components/resources/protobufs/binary_proto_generator.py
++++ b/chromium/components/resources/protobufs/binary_proto_generator.py
+@@ -9,7 +9,7 @@
+ """
+ from __future__ import print_function
+ import abc
+-import imp
++from importlib import util as imp_util
+ import optparse
+ import os
+ import re
+@@ -68,7 +68,11 @@ class GoogleProtobufModuleImporter:
+       raise ImportError(fullname)
+ 
+     filepath = self._fullname_to_filepath(fullname)
+-    return imp.load_source(fullname, filepath)
++    spec = imp_util.spec_from_file_location(fullname, filepath)
++    loaded = imp_util.module_from_spec(spec)
++    spec.loader.exec_module(loaded)
++
++    return loaded
+ 
+ class BinaryProtoGenerator:
+ 
+-- 
+2.25.1
+

--===============6701025840119018331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6701025840119018331==--
