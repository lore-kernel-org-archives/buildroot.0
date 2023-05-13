Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF03C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 09:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7761941805;
	Sat, 13 May 2023 09:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7761941805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GoBB3SDWQlWz; Sat, 13 May 2023 09:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1686D41822;
	Sat, 13 May 2023 09:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1686D41822
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 478A91BF86B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 09:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D89E84BA3
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 09:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D89E84BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNYGiXAMvm41 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 09:03:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B65584B9C
 for <buildroot@buildroot.org>; Sat, 13 May 2023 09:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B65584B9C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 464E58643E; Sat, 13 May 2023 09:03:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 11:02:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77314408813186716ef3cb73d65da13705842e41
X-Git-Newrev: 271745c37a044310e2c4a2142ace48f66914df2c
X-Patchwork-Hint: ignore
Message-Id: <20230513090320.464E58643E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmnl: simplify
 LIBMNL_EXAMPLES_INSTALL_TARGETS setting
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

commit: https://git.buildroot.net/buildroot/commit/?id=271745c37a044310e2c4a2142ace48f66914df2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Simplify the setting of LIBMNL_EXAMPLES_INSTALL_TARGETS as suggested by
Arnout Vandecappelle in [1].

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20220502051059.8301-1-dariobin@libero.it/
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmnl/libmnl.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 7c48196d75..cea528422e 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -20,15 +20,12 @@ define LIBMNL_EXAMPLES_BUILD_CMDS
 endef
 LIBMNL_POST_BUILD_HOOKS += LIBMNL_EXAMPLES_BUILD_CMDS
 
-LIBMNL_EXAMPLES_INSTALL_TARGETS += \
-	$(addprefix examples/genl/, genl-family-get genl-group-events)
-LIBMNL_EXAMPLES_INSTALL_TARGETS += \
-	$(addprefix examples/kobject/, kobject-event)
-LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+LIBMNL_EXAMPLES_INSTALL_TARGETS = \
+	$(addprefix examples/genl/, genl-family-get genl-group-events) \
+	$(addprefix examples/kobject/, kobject-event) \
 	$(addprefix examples/netfilter/, nfct-create-batch \
 		nfct-daemon nfct-dump nfct-event nf-log \
-		nf-queue)
-LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+		nf-queue) \
 	$(addprefix examples/rtnl/, rtnl-addr-add rtnl-addr-dump \
 		rtnl-link-can rtnl-link-dump rtnl-link-dump2 rtnl-link-dump3 \
 		rtnl-link-event rtnl-link-set rtnl-neigh-dump \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
