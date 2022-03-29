Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC322C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6294961125;
	Tue, 29 Mar 2022 20:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlTMDncWnu9P; Tue, 29 Mar 2022 20:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B24F61119;
	Tue, 29 Mar 2022 20:30:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 244FE1BF2E3
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F740843A7
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kO0izpy0rjeL for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 894FB843A6
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 446F885F88; Tue, 29 Mar 2022 20:20:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 21:48:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0bd54a26cb32187432f56504cd358fb09186c303
X-Git-Newrev: 0009e18a52ad6bb7152a6de9910dad863157537f
X-Patchwork-Hint: ignore
Message-Id: <20220329202022.446F885F88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-rpi-gpio:
 enable package on aarch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=0009e18a52ad6bb7152a6de9910dad863157537f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Enable the python-rpi-gpio package on 64-bit ARM architectures. I've tested
this with a Raspberry Pi 4 64-bit and Python 3 build and it works as expected.

Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 45f2609ca2eb5577ec5e6e204aec5a3eb2e80253)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
