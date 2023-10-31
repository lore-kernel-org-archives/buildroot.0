Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E13EC4167D
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 18:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 268AB83E9B;
	Tue, 31 Oct 2023 18:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 268AB83E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ITzyK7Jh7dgR; Tue, 31 Oct 2023 18:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F2A083EA2;
	Tue, 31 Oct 2023 18:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F2A083EA2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4BF71BF976
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 18:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EB194199A
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 18:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EB194199A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pb7e_io8t7bT for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 18:03:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0A2B408B1
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 18:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0A2B408B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB82486270; Tue, 31 Oct 2023 18:03:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 19:02:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9d2040b064d8cb0623c7cc75f1036a2f3bf9ee5
X-Git-Newrev: 957e2d2ffd94aa51f043c75ff0adf8453127b1ab
X-Patchwork-Hint: ignore
Message-Id: <20231031180340.BB82486270@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: security bump to version
 4.14.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=957e2d2ffd94aa51f043c75ff0adf8453127b1ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes a number of bugfixes and the security fixes up to xsa-436:
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-6/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 2 +-
 package/xen/xen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 5637f0e8d9..d2350ac515 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a1a24092ad14658eed420b7d56b67d0d9d5b314e96c30a799b45f3a721f98bf0  xen-4.14.5.tar.gz
+sha256  7917681bc6e744789815131fcf7799e6b83a0d45b5801ac654322b037ce472f8  xen-4.14.6.tar.gz
 sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 169753e89f..651442cfdf 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.14.5
+XEN_VERSION = 4.14.6
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
