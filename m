Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906D0C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECFC341999;
	Thu, 29 Feb 2024 15:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpkpJxUG2Q-P; Thu, 29 Feb 2024 15:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654A541931
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654A541931;
	Thu, 29 Feb 2024 15:52:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 165391BF980
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9E1C4180E
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u66IcHdv3MBO for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD090417F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD090417F5
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:33:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A75D287D71; Thu, 29 Feb 2024 15:33:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:17:12 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5d06ac104a38c55426ed0a04a95d82c94cfc5a41
X-Git-Newrev: 02fa1029773d508a6b6ddb02d48b6477bf92136a
X-Patchwork-Hint: ignore
Message-Id: <20240229153304.A75D287D71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/frr: drop libnl
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=02fa1029773d508a6b6ddb02d48b6477bf92136a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

libnl is not needed to build frr since the addition of the package in
commit 26d82d006ba15777d19892b327bde343d82a9ff5

No mention of libnl found in https://github.com/FRRouting/frr or
https://docs.frrouting.org/projects/dev-guide/en/latest/building.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit efa955ac415e2b50f63710e4fc1de8fd3e0dc099)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/frr/Config.in | 1 -
 package/frr/frr.mk    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index c2e9577a27..f6c058e6df 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_FRR
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_LIBYANG
-	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_JSON_C
 	help
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 19f346fd7b..a4b4bccaf9 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -12,7 +12,7 @@ FRR_CPE_ID_VENDOR = linuxfoundation
 FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
-FRR_DEPENDENCIES = host-frr readline json-c libyang libnl \
+FRR_DEPENDENCIES = host-frr readline json-c libyang \
 	$(if $(BR2_PACKAGE_C_ARES),c-ares)
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
