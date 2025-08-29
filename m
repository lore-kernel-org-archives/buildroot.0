Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA4BCA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD2CE83DF5;
	Fri, 29 Aug 2025 10:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0S1KjtdPhBu; Fri, 29 Aug 2025 10:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D390783CF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D390783CF0;
	Fri, 29 Aug 2025 10:22:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEC266C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0EF7615A3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KV8V4NJgxMgA for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6BA56155A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6BA56155A
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:22:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E289987D5F; Fri, 29 Aug 2025 10:22:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:18:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcd97e1424dc3985485a9eb4e5a08a70fcfb655a
X-Git-Newrev: f547af041974ab7f7c52e7640ab22f3a60aa6ab1
X-Patchwork-Hint: ignore
Message-Id: <20250829102233.E289987D5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestWget: replace thttpd
 by Busybox's httpd server
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f547af041974ab7f7c52e7640ab22f3a60aa6ab1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to remove thttpd package from Buildroot, we have to replace it
from TestWget.

Busybox's httpd server doesn't report server identification, update
TestWget accordingly.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295041

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/testing/tests/package/test_wget.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_wget.py b/support/testing/tests/package/test_wget.py
index c121cbd21c..7279b77667 100644
--- a/support/testing/tests/package/test_wget.py
+++ b/support/testing/tests/package/test_wget.py
@@ -7,8 +7,8 @@ class TestWget(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_BUSYBOX_HTTPD=y
         BR2_PACKAGE_WGET=y
-        BR2_PACKAGE_THTTPD=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
@@ -47,11 +47,9 @@ class TestWget(infra.basetest.BRTest):
         self.assertEqual(out[0], msg)
 
         # We download one last time, showing the server response. We
-        # check we can see the OK status and our thttpd server
-        # identification.
+        # check we can see the OK status.
         cmd = f"wget --no-verbose --server-response -O /dev/null {url}"
         out, ret = self.emulator.run(cmd)
         self.assertEqual(ret, 0)
         out_str = "\n".join(out)
         self.assertIn("HTTP/1.1 200 OK", out_str)
-        self.assertIn("Server: thttpd/", out_str)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
