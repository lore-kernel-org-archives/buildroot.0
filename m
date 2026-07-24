Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76283C53215
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 131DD60B86;
	Fri, 24 Jul 2026 14:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIG3GNnxwOKS; Fri, 24 Jul 2026 14:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B5CA60B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902434;
	bh=k8XFs11UN7FF48696D3m+BtStJaMlay3bUexgKdrQsU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lm6EPLqNPCO+e8o8kDGYmV1T9gmQhol47+igKEDcKBVZz6JgLanievX7bQuo549tv
	 bISMTA3MxCsDYkHF1k+N4mlVnr7EUv+SlaExOL5ProESS1SNzWAUiUDhtCWO2yJYGu
	 a8jL9g4YksRBfzH75rDGSoEBDNOeJzfuhXzGKTuEmAW/Y5A8DkhMsuKis3Wuv3JJ/M
	 wtqa42X4SX9McNXDBf3mB6mk7aRhknsyI3Tz7um6RlaiK7iRj7S5Pqr2NnxPuOCx66
	 WeJ9lsOE+Ao7uK+4EPS3n/JD83ENVEN7OcBw6eHimh+iwfPJMDRmL+uTjyUc5Dw64F
	 3jdfvVzlQ8V2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B5CA60B7B;
	Fri, 24 Jul 2026 14:13:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B485F490
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B29FF40B39
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuHVj_-4Q9s7 for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F23FA40B3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F23FA40B3E
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 492728A50F; Fri, 24 Jul 2026 14:13:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 15:19:22 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 9b4559d6f10d1a1b3ba78506da33c64c190e9d91
X-Git-Newrev: 637f35b9f99ceb34846900cec14996349a2e009a
X-Patchwork-Hint: ignore
Message-Id: <20260724141311.492728A50F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing: mdnsd:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/637f35b9f99ceb34846900cec14996349a2e009a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
index 3530d515a2..7064e4c281 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1657,6 +1657,7 @@ F:	package/ssdp-responder/
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
