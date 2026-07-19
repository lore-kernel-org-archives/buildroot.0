Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693F6C44523
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 11:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F184808A0;
	Sun, 19 Jul 2026 11:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJdH1ykERSqm; Sun, 19 Jul 2026 11:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3951F808AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784459277;
	bh=aVruLBVT4Z/bjPFjs8mIdC4KoW9AjTVqHWh8pxkCnTk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OzCRksCUmP7YRW35tht1/2yv5Ym7QsPRO2r8zAhKy4WLPTR3G9g0t+KOyN3NoE+fl
	 XX0pweDLGvjS/5/r/M6ybT1W8fLJAw2CtAMnlN4+G5ED44kEcofgrUUQNI/FgSdvUa
	 q/X8nQPbvqS0MmufXEOpLHvafecCY27o1lyZiRz3fY7GKCk29jJtd5QnGsYnIUxLvb
	 5SdaKmAtDRpzi/TEPjXdwvRQUmeEsmgxOXxEFmvFb+AW0Rli/9WKLV+Ia8o4AVNnc8
	 xRYRfNTnVuMCo4zPWSTF6tKHGXDj3cn2aLN6YzFS8IaVG0weOm/5pbwjYPPDIiL6Ma
	 DIHUxjDEHrJ0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3951F808AC;
	Sun, 19 Jul 2026 11:07:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CB681F6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EB9E808AC
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QMm6jCuTWMo for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 11:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B28808A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92B28808A0
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:07:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F95D8862A; Sun, 19 Jul 2026 11:07:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 12:42:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e39e3e11478eb763b25762ee21d2c47c04a5422d
X-Git-Newrev: 4cd5559163131e105b837d80389292e1bb6d0fc7
X-Patchwork-Hint: ignore
Message-Id: <20260719110718.6F95D8862A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: mdnsd: new runtime test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cd5559163131e105b837d80389292e1bb6d0fc7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Boot an armv5 image running the mdnsd responder alongside the mquery
client, then check that service discovery works: mquery browses for the
bundled _http._tcp service and mdnsd, on the same host, answers over the
loopback of the eth0 multicast group.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[Julien: add "mdnsd -v" invocation to show version]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_mdnsd.py | 41 +++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 42418d01a2..a0749646cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1665,6 +1665,7 @@ F:	package/ssdp-responder/
 F:	package/sysklogd/
 F:	package/uredir/
 F:	package/watchdogd/
+F:	support/testing/tests/package/test_mdnsd.py
 
 N:	Jochen Baltes <jochen.baltes@gmail.com>
 F:	package/altera-stapl
diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
new file mode 100644
index 0000000000..214eea7dd9
--- /dev/null
+++ b/support/testing/tests/package/test_mdnsd.py
@@ -0,0 +1,41 @@
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
+
+        # mdnsd only answers on multicast capable interfaces that are
+        # up, so wait for eth0 to get its DHCP address before querying.
+        cmd = "while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1; done"
+        self.assertRunOk(cmd, timeout=30)
+
+        # mquery sends a multicast query for the advertised service;
+        # output is one "+ NAME (IP)" line per instance
+        cmd = "mquery -T _http._tcp |grep -F buildroot._http._tcp.local"
+        self.assertRunOk(cmd, timeout=30)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
