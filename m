Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC150C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5985741057;
	Wed, 22 Feb 2023 20:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5985741057
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3E6MQXSJGvr; Wed, 22 Feb 2023 20:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA46940566;
	Wed, 22 Feb 2023 20:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA46940566
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60A371BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 487C8612A6
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 487C8612A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7F_O4rIbqfme for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:11:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85AEB60BAB
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85AEB60BAB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 705E18684A; Wed, 22 Feb 2023 20:11:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 21:09:45 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: a007e20b33ddc224d014392f5490218a12c94add
X-Git-Newrev: fc5a107fd3f4bd5c72e48fd4df12abe1319e401d
X-Patchwork-Hint: ignore
Message-Id: <20230222201137.705E18684A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/rtl8192eu:
 disable package for s390x architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc5a107fd3f4bd5c72e48fd4df12abe1319e401d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Fixes:
http://autobuild.buildroot.net/results/9987dfc041c7cc3327b73b8d97e8d482b20555e2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 26893ab1c67d7df8c1b71269051ad41b5ea03e5e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
