Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A64C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20647405B3;
	Mon, 15 Jul 2024 10:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqkgyVLhyOt0; Mon, 15 Jul 2024 10:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51AD9404D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51AD9404D5;
	Mon, 15 Jul 2024 10:14:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 125821BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BC66404F3
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObEU5qbOHLOV for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE01540591
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE01540591
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B490D86C43; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 245dab795ef9ad92be73ccdb5e717c644c4d8190
X-Git-Newrev: 638babd596141e74572c57f0b7ff65d4665a58de
X-Patchwork-Hint: ignore
Message-Id: <20240715101423.B490D86C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: fix
 another Python 3.12 issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=638babd596141e74572c57f0b7ff65d4665a58de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Further down the build, another issue:

Traceback (most recent call last):
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/tools/grit/grit.py", line 29, in <module>
    sys.exit(grit.grit_runner.Main(sys.argv[1:]))
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/grit_runner.py", line 314, in Main
    return toolobject.Run(options, args[1:])
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/tool/build.py", line 254, in Run
    self.res = grd_reader.Parse(opts.input,
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/grd_reader.py", line 231, in Parse
    handler.root.AssignFirstIds(filename_or_stream, defines)
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/node/misc.py", line 592, in AssignFirstIds
    src_root_dir, first_ids = _ReadFirstIdsFromFile(first_ids_filename,
                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/node/misc.py", line 56, in _ReadFirstIdsFromFile
    first_ids_dict = eval(util.ReadFile(filename, 'utf-8'))
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/util.py", line 215, in ReadFile
    with io.open(abs(filename), mode, encoding=encoding) as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
ValueError: invalid mode: 'rU'

Let's backport an upstream Chromium commit fixing this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Fix-build-in-Python-3.11-invalid-mode-rU.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0006-Fix-build-in-Python-3.11-invalid-mode-rU.patch b/package/qt5/qt5webengine-chromium/0006-Fix-build-in-Python-3.11-invalid-mode-rU.patch
new file mode 100644
index 0000000000..61d45b1876
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0006-Fix-build-in-Python-3.11-invalid-mode-rU.patch
@@ -0,0 +1,55 @@
+From fad0069037ec39d853e215fcddd3d130d9781ffe Mon Sep 17 00:00:00 2001
+From: Joanmarie Diggs <jdiggs@igalia.com>
+Date: Tue, 30 Aug 2022 06:00:13 +0000
+Subject: [PATCH] Fix build in Python 3.11 (invalid mode: 'rU')
+
+In Python 3.11, 'U' ("universal newline") is no longer accepted in
+the file mode, having been deprecated in Python 3.3. The "universal
+newline" is used by default when a file is open in text mode.
+
+This commit removes the 'U' from the two (non-third-party) places
+it is used.
+
+Bug: 1357549
+Change-Id: I3305707858d8ba7a9f518656a9b97dc1702bbe94
+Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/3859535
+Reviewed-by: Mike Pinkerton <pinkerton@chromium.org>
+Commit-Queue: Joanmarie Diggs <jdiggs@igalia.com>
+Reviewed-by: Nico Weber <thakis@chromium.org>
+Cr-Commit-Position: refs/heads/main@{#1040794}
+Upstream: https://github.com/chromium/chromium/commit/0991fc6acd3c85472000f2055af542515c3c6297
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ chromium/PRESUBMIT_test_mocks.py | 2 +-
+ chromium/tools/grit/grit/util.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/chromium/PRESUBMIT_test_mocks.py b/chromium/PRESUBMIT_test_mocks.py
+index 0a9e5a54ecd..6b0eca1e1c2 100644
+--- a/chromium/PRESUBMIT_test_mocks.py
++++ b/chromium/PRESUBMIT_test_mocks.py
+@@ -119,7 +119,7 @@ class MockInputApi(object):
+   def PresubmitLocalPath(self):
+     return self.presubmit_local_path
+ 
+-  def ReadFile(self, filename, mode='rU'):
++  def ReadFile(self, filename, mode='r'):
+     if hasattr(filename, 'AbsoluteLocalPath'):
+        filename = filename.AbsoluteLocalPath()
+     for file_ in self.files:
+diff --git a/chromium/tools/grit/grit/util.py b/chromium/tools/grit/grit/util.py
+index 77db06adffb..27f9aba5aa3 100644
+--- a/chromium/tools/grit/grit/util.py
++++ b/chromium/tools/grit/grit/util.py
+@@ -210,7 +210,7 @@ def ReadFile(filename, encoding):
+     mode = 'rb'
+     encoding = None
+   else:
+-    mode = 'rU'
++    mode = 'r'
+ 
+   with io.open(abs(filename), mode, encoding=encoding) as f:
+     return f.read()
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
