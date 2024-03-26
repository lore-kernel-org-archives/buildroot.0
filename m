Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3E3C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 20:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E36C4059F;
	Tue, 26 Mar 2024 20:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17WjX448xjPI; Tue, 26 Mar 2024 20:14:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33C1C40698
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C1C40698;
	Tue, 26 Mar 2024 20:14:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D3131BF40E
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 20:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A04081FE2
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 20:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skPt_ig0j_vz for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 20:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8990181F2B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8990181F2B
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 20:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79F24842AA; Tue, 26 Mar 2024 20:14:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 18:06:03 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a8ea81b2e60d2e8f3abe73a6aebf68f8594ebc28
X-Git-Newrev: 33e2f18b3c952124a36b9f9bad2493aa67f285e3
X-Patchwork-Hint: ignore
Message-Id: <20240326201410.79F24842AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Revert "package/libdrm:
 disable tests"
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

commit: https://git.buildroot.net/buildroot/commit/?id=33e2f18b3c952124a36b9f9bad2493aa67f285e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This reverts commit 3daacade133e40d38a38073c9ba9b1bf44c52c67.

The libdrm tests also include the useful command line utilities such as
modetest and modeprint, so leave them enabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index c4028244bb..52ac13b7d0 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -17,8 +17,7 @@ LIBDRM_DEPENDENCIES = \
 
 LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=disabled \
-	-Dman-pages=disabled \
-	-Dtests=false
+	-Dman-pages=disabled
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
