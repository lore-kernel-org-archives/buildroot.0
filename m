Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BCFC6FA86
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 12:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 095AE83231;
	Thu, 22 Sep 2022 12:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 095AE83231
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QoFZ-nWPL97; Thu, 22 Sep 2022 12:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3578A83163;
	Thu, 22 Sep 2022 12:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3578A83163
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9A401C1190
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91E0A61009
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E0A61009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BGz6Yul_mLmh for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 12:51:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C56E160E0F
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 12:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C56E160E0F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3F1C85E1E; Thu, 22 Sep 2022 12:51:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 14:50:08 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: a6f5c04744a0b6576b5246d55a1a96647e4910a9
X-Git-Newrev: e7efc0738afb6d2735d6df2540025b6fae7182dc
X-Patchwork-Hint: ignore
Message-Id: <20220922125113.B3F1C85E1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/agentpp: fix
 broken URL in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7efc0738afb6d2735d6df2540025b6fae7182dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The curren URL is specific to an old version, and it is not reachable
anymore.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0e4418b0cf327f19bd2212e51c49de00c94e06d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/agentpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/agentpp/Config.in b/package/agentpp/Config.in
index 8c6b11d644..cc7537519a 100644
--- a/package/agentpp/Config.in
+++ b/package/agentpp/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_AGENTPP
 
 	  SNMPv3 support is enabled if SNMP++ enables it.
 
-	  http://www.agentpp.com/agentpp3_5/agentpp3_5.html
+	  https://www.agentpp.com/api/cpp/agent_pp.html
 
 comment "agent++ needs a toolchain w/ threads, C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
