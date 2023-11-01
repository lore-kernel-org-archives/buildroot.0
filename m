Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B435FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69F254000B;
	Wed,  1 Nov 2023 11:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69F254000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bX1EqhfkGKBo; Wed,  1 Nov 2023 11:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45F05430EA;
	Wed,  1 Nov 2023 11:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F05430EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BADD1BF954
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E31894EC2F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E31894EC2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B513WOlN5o0j for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:16:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 404554EC32
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 404554EC32
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 183B9862F9; Wed,  1 Nov 2023 11:16:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 10:21:41 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 176e2d2a06c3b2aacc5125d7e60423a735993f80
X-Git-Newrev: 41f4728e062c214212286e51b223720004a922d3
X-Patchwork-Hint: ignore
Message-Id: <20231101111643.183B9862F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/xen: security
 bump to version 4.14.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=41f4728e062c214212286e51b223720004a922d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Includes a number of bugfixes and the security fixes up to xsa-436:
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-6/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 957e2d2ffd94aa51f043c75ff0adf8453127b1ab)
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
