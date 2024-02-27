Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320E9C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 22:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00DAF402F0;
	Tue, 27 Feb 2024 22:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLbDKNOqimcw; Tue, 27 Feb 2024 22:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2544240309
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2544240309;
	Tue, 27 Feb 2024 22:24:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEAEC1BF842
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBE3640309
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNz4IX4IOyoa for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 22:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F59402F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21F59402F0
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 22:24:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B7E687B3E; Tue, 27 Feb 2024 22:24:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 23:24:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 433c4fd38b15efcf74b410e5068e2e51eeba6e46
X-Git-Newrev: 13083cf8c0edb0ac1cae4895505720658e8dd75d
X-Patchwork-Hint: ignore
Message-Id: <20240227222447.1B7E687B3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: fix build with autoconf
 2.72
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

commit: https://git.buildroot.net/buildroot/commit/?id=13083cf8c0edb0ac1cae4895505720658e8dd75d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use ERLANG_FIX_AUTOCONF_VERSION to fix the following build failure
raised since bump of autoconf to version 2.72 in commit
524f3536029dace3ce9aa154d3ca4685582e1955:

ERROR: autoconf of version 2.72 found in path! You need to have autoconf of version 2.71 in path.

Fixes: 524f3536029dace3ce9aa154d3ca4685582e1955
 - http://autobuild.buildroot.org/results/c9e8df3427fca9e8e75488e32bca18e81009238c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/erlang.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 1600b59381..84d2f4e898 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -17,14 +17,22 @@ ERLANG_CPE_ID_VENDOR = erlang
 ERLANG_CPE_ID_PRODUCT = erlang\/otp
 ERLANG_INSTALL_STAGING = YES
 
+define ERLANG_FIX_AUTOCONF_VERSION
+	$(SED) "s/USE_AUTOCONF_VERSION=.*/USE_AUTOCONF_VERSION=$(AUTOCONF_VERSION)/" $(@D)/otp_build
+endef
+
 # Patched erts/aclocal.m4
 define ERLANG_RUN_AUTOCONF
 	cd $(@D) && PATH=$(BR_PATH) ./otp_build update_configure --no-commit
 endef
 ERLANG_DEPENDENCIES += host-autoconf
-ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
+ERLANG_PRE_CONFIGURE_HOOKS += \
+	ERLANG_FIX_AUTOCONF_VERSION \
+	ERLANG_RUN_AUTOCONF
 HOST_ERLANG_DEPENDENCIES += host-autoconf
-HOST_ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
+HOST_ERLANG_PRE_CONFIGURE_HOOKS += \
+	ERLANG_FIX_AUTOCONF_VERSION \
+	ERLANG_RUN_AUTOCONF
 
 # Return the EIV (Erlang Interface Version, EI_VSN)
 # $(1): base directory, i.e. either $(HOST_DIR) or $(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
