Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3F2C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ADCE4F31F;
	Tue, 21 Feb 2023 00:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ADCE4F31F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fc9dj0hlrvOY; Tue, 21 Feb 2023 00:24:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D212A4F32F;
	Tue, 21 Feb 2023 00:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D212A4F32F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 128B11BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD575417B5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD575417B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_cB5E6_Su7n for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5B59417D0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5B59417D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD56786496; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 11:30:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b11ed25c4a0a6a4f7b9ee38390578d724caa081d
X-Git-Newrev: 26893ab1c67d7df8c1b71269051ad41b5ea03e5e
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.BD56786496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl8192eu: disable
 package for s390x architecture
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
