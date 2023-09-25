Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0D4CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 14:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C48681328;
	Mon, 25 Sep 2023 14:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C48681328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMgTcnfF0S7e; Mon, 25 Sep 2023 14:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC32D81406;
	Mon, 25 Sep 2023 14:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC32D81406
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 861D71BF5B4
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F6E6813B3
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F6E6813B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYosoy3_Rm85 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF1980EB0
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF1980EB0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 795E187781; Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 15:48:23 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 0919c5de1938709bbe4b5d55ed1258e1b4ea007a
X-Git-Newrev: b84098a6223403f1b8518a5365b25c59b8f18678
X-Patchwork-Hint: ignore
Message-Id: <20230925140304.795E187781@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/esp-hosted:
 disable for s390x
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

commit: https://git.buildroot.net/buildroot/commit/?id=b84098a6223403f1b8518a5365b25c59b8f18678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

s390x doesn't support Wi-Fi on Linux so let's disable the package for such
architecture.

Fixes:
http://autobuild.buildroot.net/results/f52e8a14330ff281a7096baa47f387f8c1859345

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 9a9a41f8dfd4388f6cb0d9d4132ad7cfa7dedf48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/esp-hosted/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
index 43c802fa44..42e1afa8c5 100644
--- a/package/esp-hosted/Config.in
+++ b/package/esp-hosted/Config.in
@@ -1,8 +1,10 @@
 comment "esp-hosted needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_ESP_HOSTED
 	bool "esp-hosted"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  This package builds and installs the Linux kernel driver for
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
