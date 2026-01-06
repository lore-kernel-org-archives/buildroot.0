Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7A9D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 724BB40CD7;
	Wed,  7 Jan 2026 18:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDY4gHWcuP9m; Wed,  7 Jan 2026 18:02:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C037B41363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808922;
	bh=DDluCFtqaHThdMXQkYCNgJBbKwgFk8RW6yqr97ZZaZI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dJwDHGSJuWAYt3bt+b1d6PQrFXzmgHPLRfVBbKjy20cMaRDdu4/0jZR6jZx+BkmCS
	 oRxuN7SWhYZlYwBf95ye5tL4Ok0qB6N0n+SOtoGISUiiZq1ugaq7F0idVSRQN3mqJQ
	 13I/UKj0TiP2aPsAPtBF/kymIu3Cxo78FgKCmVIqyR4QN2w40ggRUHS3ktfxl3b6tx
	 7XdTxruaYqUCaL02bdmsGekKvag0Z40i56gg8qln4ksUiIrnENIEQ2X6uyDm0XTtmk
	 ZtJJvE+bonmoEXim8i3/9ey+n+Y5pPkoZdGPMw8k1oLb8okAJiozoizag6tux5GUze
	 nUsowRFAeFx5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C037B41363;
	Wed,  7 Jan 2026 18:02:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 012019ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA05740B2E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmqwX6sjvTm2 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF19540A4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF19540A4B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDD4983B69; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:52:31 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 81401483329e0b0d0c559e109a5100e87e55108e
X-Git-Newrev: 820df57a933bd1a48abd3a9da5e7dd7e068644eb
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.BDD4983B69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing: add
 libiio python bindings runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=820df57a933bd1a48abd3a9da5e7dd7e068644eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 61966c213322b192a62cc19200902934f9f432d7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../testing/tests/package/sample_libiio_bindings_python.py  |  3 +++
 .../testing/tests/package/test_libiio_bindings_python.py    | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/support/testing/tests/package/sample_libiio_bindings_python.py b/support/testing/tests/package/sample_libiio_bindings_python.py
new file mode 100644
index 0000000000..74452192c2
--- /dev/null
+++ b/support/testing/tests/package/sample_libiio_bindings_python.py
@@ -0,0 +1,3 @@
+import iio
+
+assert len(iio.scan_contexts()) == 1
diff --git a/support/testing/tests/package/test_libiio_bindings_python.py b/support/testing/tests/package/test_libiio_bindings_python.py
new file mode 100644
index 0000000000..e8cf5c3d13
--- /dev/null
+++ b/support/testing/tests/package/test_libiio_bindings_python.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestLibiioBindingsPython(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_LIBIIO=y
+        BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON=y
+        """
+    sample_scripts = ["tests/package/sample_libiio_bindings_python.py"]
+    timeout = 10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
