Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E4EE728E1
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6281542148;
	Sat, 30 Sep 2023 19:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6281542148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpL7Tcte69JS; Sat, 30 Sep 2023 19:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AB30420E4;
	Sat, 30 Sep 2023 19:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AB30420E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9AC1BF2A7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 067A5415C8
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 067A5415C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojcfM85_TaQv for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:03:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1026404DA
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1026404DA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDF7A83C8B; Sat, 30 Sep 2023 19:03:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 21:03:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11a46002ae11a0766a4ec9d3d8ccafe7be42c2fc
X-Git-Newrev: 8c3c741439acb817e156fe28083ba0c6a0c4c720
X-Patchwork-Hint: ignore
Message-Id: <20230930190343.CDF7A83C8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg-utils: actually install to
 target
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c3c741439acb817e156fe28083ba0c6a0c4c720
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b9bf1c6535cb (package/opkg-utils: add opkg-utils as target pkg)
misspelled the macro to install to target, most probably as a bad
copy-paste from the host macro.

Fix that.

Reported-by: Michael Hacker <mh@superbox.one>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opkg-utils/opkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index ad267c5c94..384a7323ee 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -16,7 +16,7 @@ HOST_OPKG_UTILS_DEPENDENCIES = \
 	host-xz
 
 # Nothing to build; only scripts to install.
-define OPKG_UTILS_INSTALL_CMDS
+define OPKG_UTILS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install-utils
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
