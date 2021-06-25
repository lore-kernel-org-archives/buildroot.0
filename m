Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D57C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:40:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C556103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31C556103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 058A84044C;
	Tue,  3 Aug 2021 21:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJ1tqI_uSORd; Tue,  3 Aug 2021 21:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2040B4022E;
	Tue,  3 Aug 2021 21:40:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7F71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24A08837DA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-SOcMQrxVRn for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73B7683A9F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BDEE18827E; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Jun 2021 13:59:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 047a9d9eaa254616a44ae9edebf611ab16453922
X-Git-Newrev: 3cf2782906d5cc05a3966c25518d2ce01f11afc8
X-Patchwork-Hint: ignore
Message-Id: <20210803210955.BDEE18827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/infra/emulator.py: update pre-built kernels
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3cf2782906d5cc05a3966c25518d2ce01f11afc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The pre-built vexpress kernel used by the testing infrastructure is a
4.0.0 kernel, which is getting old to be used with reasonably recent
toolchains.

This commit updates the pre-built kernels for both the versatile and
vexpress machines to 5.10.7 (they have already been put online).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/infra/emulator.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 5611ec96e8..0a77eb80fc 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -54,16 +54,16 @@ class Emulator(object):
 
                 if arch == "armv7":
                     kernel = infra.download(self.downloaddir,
-                                            "kernel-vexpress")
+                                            "kernel-vexpress-5.10.7")
                     dtb = infra.download(self.downloaddir,
-                                         "vexpress-v2p-ca9.dtb")
+                                         "vexpress-v2p-ca9-5.10.7.dtb")
                     qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "vexpress-a9"]
                 elif arch == "armv5":
                     kernel = infra.download(self.downloaddir,
-                                            "kernel-versatile-4.19")
+                                            "kernel-versatile-5.10.7")
                     dtb = infra.download(self.downloaddir,
-                                         "versatile-pb-4.19.dtb")
+                                         "versatile-pb-5.10.7.dtb")
                     qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "versatilepb"]
                     qemu_cmd += ["-device", "virtio-rng-pci"]
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
