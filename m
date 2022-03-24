Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD74C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A13E541089;
	Thu, 24 Mar 2022 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbRVINNohIDQ; Thu, 24 Mar 2022 21:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 851CB41064;
	Thu, 24 Mar 2022 21:15:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD1E71C115D
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAECB405AD
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Td_AdG_ePv9I for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:15:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD9EC401E1
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:15:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A0CC185C5B; Thu, 24 Mar 2022 21:06:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 21:51:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a38c6827dba0a5ccee5504167344ea6bba44e9d9
X-Git-Newrev: 45f2609ca2eb5577ec5e6e204aec5a3eb2e80253
X-Patchwork-Hint: ignore
Message-Id: <20220324210619.A0CC185C5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rpi-gpio: enable package on
 aarch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=45f2609ca2eb5577ec5e6e204aec5a3eb2e80253
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the python-rpi-gpio package on 64-bit ARM architectures. I've tested
this with a Raspberry Pi 4 64-bit and Python 3 build and it works as expected.

Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-rpi-gpio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-rpi-gpio/Config.in b/package/python-rpi-gpio/Config.in
index 4f59ebdb06..f3c0928c62 100644
--- a/package/python-rpi-gpio/Config.in
+++ b/package/python-rpi-gpio/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_RPI_GPIO
 	bool "python-rpi-gpio"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	help
 	  A Python module to control the GPIO on a Raspberry Pi.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
