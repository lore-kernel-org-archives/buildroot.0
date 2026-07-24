Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691E4C531F9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E48660B79;
	Fri, 24 Jul 2026 14:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6Dgd662naPA; Fri, 24 Jul 2026 14:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1BC360B75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902344;
	bh=rlcUFEjak6Q+Wqr5Ou3NYQ28BZgT7UtywjMc6SeQunQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LT/Yx8RsG1h0+rKfBcrGIcSSNNUfXdU6IhIy6JNpGlCD4fiCrIzP971LrLtmYuzMp
	 JR3DAAu3GH97aH6mKdtbIaxb1EQHtmLVLbwbgVLN910hY2yJRrNwlxD2T+FDIcuTR9
	 CHEArBdRmYbxSkSD5vefDasTJJJ23IAJx9Stlu2phXCFCIgnBMo5p3gvoDeyYu0Dx7
	 5rPJLGMcOCI4tgCBMsFjVgPBE2Wv/fkSX1XopRXKycYiAChtSgGHqOOnSjGeLyU/XU
	 JKA25867cmm+o10q2Z0PPKtK15sUvV9mFWyBNDiNsi18hLJNiYHGCLenjuiBlAYdTB
	 YCL592qBtSWug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1BC360B75;
	Fri, 24 Jul 2026 14:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D24AE3B0
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF4D340152
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEE7w8_VoPFa for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:12:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A97F2400BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A97F2400BD
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:12:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00F818A4F6; Fri, 24 Jul 2026 14:11:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 15:18:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a0d575df1f807a830d8e450c4329ae6a8acfe183
X-Git-Newrev: fbebe4a705d110482738b0e18ed28ca8849f39b4
X-Patchwork-Hint: ignore
Message-Id: <20260724141141.00F818A4F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: mdnsd:
 new runtime test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fbebe4a705d110482738b0e18ed28ca8849f39b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Boot an armv5 image running the mdnsd responder alongside the mquery
client, then check that service discovery works: mquery browses for the
bundled _http._tcp service and mdnsd, on the same host, answers over the
loopback of the eth0 multicast group.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[Julien: add "mdnsd -v" invocation to show version]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4cd5559163131e105b837d80389292e1bb6d0fc7)
[Thomas: remove last test that requires v1.1]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_mdnsd.py | 31 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 110338753e..3a3b42a00f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1605,6 +1605,7 @@ F:	package/ssdp-responder/
 F:	package/sysklogd/
 F:	package/uredir/
 F:	package/watchdogd/
+F:	support/testing/tests/package/test_mdnsd.py
 
 N:	Jochen Baltes <jochen.baltes@gmail.com>
 F:	package/altera-stapl
diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
new file mode 100644
index 0000000000..ecc93ab6f8
--- /dev/null
+++ b/support/testing/tests/package/test_mdnsd.py
@@ -0,0 +1,31 @@
+import os
+
+import infra.basetest
+
+
+class TestMdnsd(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MDNSD=y
+        BR2_PACKAGE_MDNSD_MQUERY=y
+        BR2_PACKAGE_MDNSD_HTTP_SERVICE=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img,
+                                    "-net", "nic,model=rtl8139",
+                                    "-net", "user"])
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("mdnsd -v")
+
+        # The responder is started at boot by /etc/init.d/S50mdnsd and
+        # advertises the bundled _http._tcp service from /etc/mdns.d/.
+        self.assertRunOk("pidof mdnsd")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
