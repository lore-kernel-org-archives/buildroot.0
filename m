Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAC0CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 10:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF256F551;
	Fri, 13 Oct 2023 10:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF256F551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id funLEM2AqsuW; Fri, 13 Oct 2023 10:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECEF661512;
	Fri, 13 Oct 2023 10:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECEF661512
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 757341BF349
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 483ED400CB
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 483ED400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cpd9kgBN1m72 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 971B94172A
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 971B94172A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82DFA846E3; Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 12:13:44 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: dd6ec5949eee32654709b074e20ca11046ad4f3b
X-Git-Newrev: fd28c24131fc5471de3ef6776c11ace91f139987
X-Patchwork-Hint: ignore
Message-Id: <20231013102537.82DFA846E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/opkg-utils:
 actually install to target
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd28c24131fc5471de3ef6776c11ace91f139987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit b9bf1c6535cb (package/opkg-utils: add opkg-utils as target pkg)
misspelled the macro to install to target, most probably as a bad
copy-paste from the host macro.

Fix that.

Reported-by: Michael Hacker <mh@superbox.one>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8c3c741439acb817e156fe28083ba0c6a0c4c720)
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
