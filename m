Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7990EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09EE241518;
	Tue, 19 Jul 2022 15:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09EE241518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FYjOeudGCN2; Tue, 19 Jul 2022 15:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179DE40873;
	Tue, 19 Jul 2022 15:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 179DE40873
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02B5D1BF951
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A6B3402AF
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A6B3402AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfHjftpQPk3w for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FAA14098C
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FAA14098C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8A10383D0E; Tue, 19 Jul 2022 14:59:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 17:08:55 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 78b3a2b33e72bd4ef2a42b495297a6bdb8ec4e5c
X-Git-Newrev: 8428f5430bc682efa16b90756853b3429460cbc1
X-Patchwork-Hint: ignore
Message-Id: <20220719145920.8A10383D0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/iptables: drop
 duplicated dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=8428f5430bc682efa16b90756853b3429460cbc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

libnetfilter_conntrack dependency is wrongly duplicated since commit
b835171cf9db23095c669b872dbaa15fc1e99898

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: drop from "main" _DEPENDENCIES instead]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 857447d2d29912abfc11a79854f1299096d7d34a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iptables/iptables.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 555bb384fd..f6c1248057 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -8,8 +8,7 @@ IPTABLES_VERSION = 1.8.7
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
