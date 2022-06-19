Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F09CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 12:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E46460A98;
	Sun, 19 Jun 2022 12:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E46460A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfrXmL2y_brZ; Sun, 19 Jun 2022 12:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CBBA607A1;
	Sun, 19 Jun 2022 12:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CBBA607A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4611BF2E4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1781F6079D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1781F6079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zas_9at4UODq for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 12:41:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50F8360774
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 12:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50F8360774
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 63F8E87134; Sun, 19 Jun 2022 12:28:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 14:35:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c7b46945e656e03713ffeb1230211ec81791478
X-Git-Newrev: 857447d2d29912abfc11a79854f1299096d7d34a
X-Patchwork-Hint: ignore
Message-Id: <20220619122848.63F8E87134@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iptables: drop duplicated
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

commit: https://git.buildroot.net/buildroot/commit/?id=857447d2d29912abfc11a79854f1299096d7d34a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnetfilter_conntrack dependency is wrongly duplicated since commit
b835171cf9db23095c669b872dbaa15fc1e99898

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: drop from "main" _DEPENDENCIES instead]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iptables/iptables.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a54194a8c3..a6143677d1 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -8,8 +8,7 @@ IPTABLES_VERSION = 1.8.8
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
-IPTABLES_DEPENDENCIES = host-pkgconf \
-	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
+IPTABLES_DEPENDENCIES = host-pkgconf
 IPTABLES_LICENSE = GPL-2.0
 IPTABLES_LICENSE_FILES = COPYING
 IPTABLES_CPE_ID_VENDOR = netfilter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
