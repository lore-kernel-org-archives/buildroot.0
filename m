Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A92C7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B97B42B71;
	Tue,  9 May 2023 21:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B97B42B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TN65EhUV7Oq6; Tue,  9 May 2023 21:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E1BE42BA9;
	Tue,  9 May 2023 21:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E1BE42BA9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C57BB1BF20B
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D32D381E1A
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D32D381E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bk931iF4SPXO for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:59:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE4E581E21
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE4E581E21
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCB75862C4; Tue,  9 May 2023 20:59:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 9 May 2023 22:52:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9716cae47b868e833a5dc61d64b7e518a792a3f
X-Git-Newrev: b42b4442ca2a6c4a4286fdc2ce9dbdaacf6f6368
X-Patchwork-Hint: ignore
Message-Id: <20230509205911.DCB75862C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/selinux-python: bump to version 3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b42b4442ca2a6c4a4286fdc2ce9dbdaacf6f6368
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also:
  - Change the license file to LICENSE. The hash remains the same.

  - Add 0001-python-sepolgen-fix-ausearch-path.patch as audit 3.1
    installs ausearch to /usr/sbin not /sbin

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998@free.fr: rewrite 0001 into an upstreamable patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-python-sepolgen-fix-ausearch-path.patch   | 63 ++++++++++++++++++++++
 package/selinux-python/selinux-python.hash         |  4 +-
 package/selinux-python/selinux-python.mk           |  4 +-
 3 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/package/selinux-python/0001-python-sepolgen-fix-ausearch-path.patch b/package/selinux-python/0001-python-sepolgen-fix-ausearch-path.patch
new file mode 100644
index 0000000000..31c5013d69
--- /dev/null
+++ b/package/selinux-python/0001-python-sepolgen-fix-ausearch-path.patch
@@ -0,0 +1,63 @@
+From 8610efc1610a4e9d4cbfa19ed4a519a6425aee70 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 9 May 2023 22:28:36 +0200
+Subject: [PATCH] python?sepolgen: fix ausearch path
+
+ausearch is not always isntalled in /sbin; some systems install it in
+/usr/sbin, or it can also be locally installed in /usr/local/sbin.
+
+The python doc [0] suggests using shutil.which() to find the path where
+a command is. which() returns None if the command is not found. If
+ausearch is not found, that would result in an exception being raised by
+Popen():
+    TypeError: expected str, bytes or os.PathLike object, not NoneType
+
+This is not very informative of what actually failed...
+
+However, the doc suggests so for portability. In our case, the python
+tools are only ever going to run on a Linux host (by their virtue of
+dealing with SELinux), so the search will be reliably done by looking in
+PATH, so we can let Popen() bubble the resolving of an unqualified
+command, down to execvpe() (or the similar actual syscall of the exec*()
+familly). If ausearch is then not found, Popen() raises an exception
+that is wy more informative then:
+    FileNotFoundError: [Errno 2] No such file or directory: 'ausearch'
+
+[0] https://docs.python.org/3/library/subprocess.html#subprocess.Popen
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[yann.morin.1998@free.fr:
+  - let Popen() resolve from PATH
+  - rewrite commit log
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Upstream: not submitted
+---
+ python/sepolgen/src/sepolgen/audit.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/python/sepolgen/src/sepolgen/audit.py b/python/sepolgen/src/sepolgen/audit.py
+index 4adb851f..5eafa587 100644
+--- a/sepolgen/src/sepolgen/audit.py
++++ b/sepolgen/src/sepolgen/audit.py
+@@ -41,7 +41,7 @@ def get_audit_boot_msgs():
+     s = time.localtime(time.time() - off)
+     bootdate = time.strftime("%x", s)
+     boottime = time.strftime("%X", s)
+-    output = subprocess.Popen(["/sbin/ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR", "-ts", bootdate, boottime],
++    output = subprocess.Popen(["ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR", "-ts", bootdate, boottime],
+                               stdout=subprocess.PIPE).communicate()[0]
+     if util.PY3:
+         output = util.decode_input(output)
+@@ -56,7 +56,7 @@ def get_audit_msgs():
+        string contain all of the audit messages returned by ausearch.
+     """
+     import subprocess
+-    output = subprocess.Popen(["/sbin/ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR"],
++    output = subprocess.Popen(["ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR"],
+                               stdout=subprocess.PIPE).communicate()[0]
+     if util.PY3:
+         output = util.decode_input(output)
+-- 
+2.25.1
+
diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 6ada3fee36..3592540703 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  8ad91061300387996ccb474962fb93dde263d924aa8f740618be16b22e2444ec  selinux-python-3.3.tar.gz
+sha256  8245bb4dae59333461f19ca0c79a829081f07972fa5e3ad4c2b2b917dd71d96b  selinux-python-3.5.tar.gz
 
 # Hash for license file
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 0cec602f3d..7505474aa4 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.3
+SELINUX_PYTHON_VERSION = 3.5
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
-SELINUX_PYTHON_LICENSE_FILES = COPYING
+SELINUX_PYTHON_LICENSE_FILES = LICENSE
 SELINUX_PYTHON_DEPENDENCIES = python3
 
 SELINUX_PYTHON_MAKE_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
