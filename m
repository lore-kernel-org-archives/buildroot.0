Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C3AC0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 18:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F6360667;
	Fri, 31 Jan 2025 18:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8t4eTT5kh671; Fri, 31 Jan 2025 18:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5956A6080A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5956A6080A;
	Fri, 31 Jan 2025 18:39:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6780817F
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ACF9426A3
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFDe27IQj86p for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 310AD426A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 310AD426A0
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19FAB866DD; Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 Jan 2025 17:47:28 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: bc7e3a7abbbd108e67d5071656b9a8552309ff26
X-Git-Newrev: fdcfa918c639dfb84700523f74bc6890cd406ca4
X-Patchwork-Hint: ignore
Message-Id: <20250131183857.19FAB866DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] support/testing/utils:
 check patch on stdin to get-developers
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdcfa918c639dfb84700523f74bc6890cd406ca4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Since commit d10d22221f93 (utils/get-developers: read patch from stdin
when it's not a tty), get-developers accepts to read a patch fromn its
stdin when it is not a tty.

Add a test for this.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 29e1af84308b80d83a8f45ba934fbb3e92d55bf6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/utils/test_get_developers.py | 28 +++++++++++++++-------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index 701c3acb1a..195e421332 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -13,26 +13,32 @@ import unittest
 import infra
 
 
-def call_script(args, env, cwd):
+def call_script(args, env, cwd, stdin_data=None):
     """Call a script and return stdout and stderr as lists and the exit code."""
-    # We need stdin to be a tty, not just a pipe or whatever
-    m_tty, s_tty = os.openpty()
+    if stdin_data is None:
+        # We need stdin to be a tty, not just a pipe or whatever
+        m_tty, s_tty = os.openpty()
+        com_opts = dict()
+    else:
+        s_tty = subprocess.PIPE
+        com_opts = dict([("input", stdin_data)])
     proc = subprocess.Popen(args, cwd=cwd,
                             stdin=s_tty,
                             stdout=subprocess.PIPE,
                             stderr=subprocess.PIPE, env=env,
                             universal_newlines=True)
-    out, err = proc.communicate()
-    os.close(s_tty)
-    os.close(m_tty)
+    out, err = proc.communicate(**com_opts)
+    if stdin_data is None:
+        os.close(s_tty)
+        os.close(m_tty)
     return out.splitlines(), err.splitlines(), proc.returncode
 
 
-def call_get_developers(cmd, args, env, cwd, developers_content):
+def call_get_developers(cmd, args, env, cwd, developers_content, stdin_data=None):
     """Call get-developers overrinding the default DEVELOPERS file."""
     with tempfile.NamedTemporaryFile(buffering=0) as developers_file:
         developers_file.write(developers_content)
-        return call_script([cmd, "-d", developers_file.name] + args, env, cwd)
+        return call_script([cmd, "-d", developers_file.name] + args, env, cwd, stdin_data)
 
 
 class TestGetDevelopers(unittest.TestCase):
@@ -174,3 +180,9 @@ class TestGetDevelopers(unittest.TestCase):
         self.assertIn('git send-email --to buildroot@buildroot.org --cc "dev1"', out)
         self.assertEqual(rc, 0)
         self.assertEqual(len(err), 0)
+        with open(abs_file, "r") as fd:
+            patch_data = fd.read()
+        out, err, rc = call_get_developers("./utils/get-developers", [], self.WITH_EMPTY_PATH, topdir, developers, patch_data)
+        self.assertIn('git send-email --to buildroot@buildroot.org --cc "dev1"', out)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(err), 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
