Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF949C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91255405E2;
	Tue,  7 Feb 2023 10:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91255405E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45IRue8fWu1I; Tue,  7 Feb 2023 10:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3201640472;
	Tue,  7 Feb 2023 10:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3201640472
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51A5D1BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BBFF60BBA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BBFF60BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtI-D5NUASMs for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:32:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 588D060B00
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 588D060B00
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47FFD84003; Tue,  7 Feb 2023 10:32:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 11:30:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b11ed25c4a0a6a4f7b9ee38390578d724caa081d
X-Git-Newrev: 26893ab1c67d7df8c1b71269051ad41b5ea03e5e
X-Patchwork-Hint: ignore
Message-Id: <20230207103205.47FFD84003@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8192eu: disable package for
 s390x architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=26893ab1c67d7df8c1b71269051ad41b5ea03e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Fixes:
http://autobuild.buildroot.net/results/9987dfc041c7cc3327b73b8d97e8d482b20555e2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8192eu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8192eu/Config.in b/package/rtl8192eu/Config.in
index 4d71b711c3..969ba090ce 100644
--- a/package/rtl8192eu/Config.in
+++ b/package/rtl8192eu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8192EU
 	bool "rtl8192eu"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  A standalone driver for the RTL8192EU USB Wi-Fi adapter.
@@ -10,4 +11,5 @@ config BR2_PACKAGE_RTL8192EU
 	  https://github.com/clnhub/rtl8192eu-linux
 
 comment "rtl8192eu needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
