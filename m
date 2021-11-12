Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3159C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:40:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8CE60F45
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA8CE60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75ED140628;
	Fri, 12 Nov 2021 22:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVm23B5uPIeR; Fri, 12 Nov 2021 22:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBDB140625;
	Fri, 12 Nov 2021 22:40:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B54EF1C1148
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B256640627
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ySo4C0o9ngu for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:40:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8EEA40606
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4A2188C967; Fri, 12 Nov 2021 22:36:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 23:23:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4427b298396b8bf1190b3b1ea4ceacb37b05aaa2
X-Git-Newrev: 1477b60d4ef8b653493132c2a2edf48f26426e55
X-Patchwork-Hint: ignore
Message-Id: <20211112223605.4A2188C967@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_luvi: switch to
 armv5 to boot with rng support enabled
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
Content-Type: multipart/mixed; boundary="===============8814241184446848677=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8814241184446848677==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1477b60d4ef8b653493132c2a2edf48f26426e55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the commit replacing moonjit by luajit [1] luvi doesn't work without
rng support enabled.

Switch to armv5 to use virtio-rng-pci on the qemu command line [2].

[1] 9450b53c8e06f1b5a75840b82c0f4663a5d75c45
[2] https://git.buildroot.net/buildroot/tree/support/testing/infra/emulator.py?h=2021.08.1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_luvi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_luvi.py b/support/testing/tests/package/test_luvi.py
index a85a6f4d27..eb15ad31b5 100644
--- a/support/testing/tests/package/test_luvi.py
+++ b/support/testing/tests/package/test_luvi.py
@@ -17,7 +17,7 @@ class TestLuvi(infra.basetest.BRTest):
 
     def login(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv7",
+        self.emulator.boot(arch="armv5",
                            kernel="builtin",
                            options=["-initrd", cpio_file])
         self.emulator.login()

--===============8814241184446848677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8814241184446848677==--
