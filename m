Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDC9C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 20:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC6540113;
	Tue,  6 Aug 2024 20:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YV3wPX1nLJ1z; Tue,  6 Aug 2024 20:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A70B402A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A70B402A0;
	Tue,  6 Aug 2024 20:15:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D07E1BF33D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31D9580AB0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XD3MHF2FImXH for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 20:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44C9F80AB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44C9F80AB1
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 20:15:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C916842D3; Tue,  6 Aug 2024 20:15:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 22:06:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69710addd121a18ff662c5a6dcb1d8f329f39d69
X-Git-Newrev: 4dc5c45bd283991912a3536d044ec1f36756f505
X-Patchwork-Hint: ignore
Message-Id: <20240806201500.2C916842D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_swipl.py: new test
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dc5c45bd283991912a3536d044ec1f36756f505
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a test case for the recently added swipl package. It
should have been part of commit
69710addd121a18ff662c5a6dcb1d8f329f39d69 ("package/swipl: new
package") but was forgotten.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_swipl.py        | 46 ++++++++++++++++++++++
 .../test_swipl/rootfs-overlay/root/sudoku.pl       | 42 ++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/support/testing/tests/package/test_swipl.py b/support/testing/tests/package/test_swipl.py
new file mode 100644
index 0000000000..0839101599
--- /dev/null
+++ b/support/testing/tests/package/test_swipl.py
@@ -0,0 +1,46 @@
+import os
+
+import infra.basetest
+
+
+class TestSWIPL(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_swipl/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_SWIPL=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check program executes.
+        cmd = "swipl --version"
+        self.assertRunOk(cmd)
+
+        # Check swipl fails when goal is false.
+        cmd = "swipl -g false"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # Test output.
+        string = "Hello Buildroot !"
+        cmd = f"swipl -g 'writeln(\"{string}\")' -t halt"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], string)
+
+        # Check the swipl demo file works (ex: "sam" likes "pizza").
+        cmd = "swipl -g '[swi(demo/likes)]' -g 'likes(sam,pizza)' -t halt"
+        self.assertRunOk(cmd)
+
+        # Run a more complex logic program (solve a sudoku).
+        cmd = "swipl -g top -t halt /root/sudoku.pl"
+        self.assertRunOk(cmd, timeout=10)
diff --git a/support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl b/support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl
new file mode 100644
index 0000000000..2b68b6cc89
--- /dev/null
+++ b/support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl
@@ -0,0 +1,42 @@
+% taken from:
+% https://www.swi-prolog.org/pldoc/man?section=clpfd-sudoku
+
+:- use_module(library(clpfd)).
+
+sudoku(Rows) :-
+        length(Rows, 9), maplist(same_length(Rows), Rows),
+        append(Rows, Vs), Vs ins 1..9,
+        maplist(all_distinct, Rows),
+        transpose(Rows, Columns),
+        maplist(all_distinct, Columns),
+        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
+        blocks(As, Bs, Cs),
+        blocks(Ds, Es, Fs),
+        blocks(Gs, Hs, Is).
+
+blocks([], [], []).
+blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
+        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
+        blocks(Ns1, Ns2, Ns3).
+
+problem(1, [[_,_,_,_,_,_,_,_,_],
+            [_,_,_,_,_,3,_,8,5],
+            [_,_,1,_,2,_,_,_,_],
+            [_,_,_,5,_,7,_,_,_],
+            [_,_,4,_,_,_,1,_,_],
+            [_,9,_,_,_,_,_,_,_],
+            [5,_,_,_,_,_,_,7,3],
+            [_,_,2,_,1,_,_,_,_],
+            [_,_,_,_,4,_,_,_,9]]).
+
+top :- writeln("Sudoku solution:"),
+    problem(1, Rows), sudoku(Rows), maplist(portray_clause, Rows),
+    Rows = [[9, 8, 7, 6, 5, 4, 3, 2, 1],
+            [2, 4, 6, 1, 7, 3, 9, 8, 5],
+            [3, 5, 1, 9, 2, 8, 7, 4, 6],
+            [1, 2, 8, 5, 3, 7, 6, 9, 4],
+            [6, 3, 4, 8, 9, 2, 1, 5, 7],
+            [7, 9, 5, 4, 6, 1, 8, 3, 2],
+            [5, 1, 9, 2, 8, 6, 4, 7, 3],
+            [4, 7, 2, 3, 1, 9, 5, 6, 8],
+            [8, 6, 3, 7, 4, 5, 2, 1, 9]].
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
