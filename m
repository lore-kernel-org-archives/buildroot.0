Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCEBC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85D3461111;
	Sat, 17 Sep 2022 12:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D3461111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBcqAR6XiWvZ; Sat, 17 Sep 2022 12:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA01961121;
	Sat, 17 Sep 2022 12:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA01961121
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D03361BF96B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B76AB41D97
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B76AB41D97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x1iVDvxCQlH2 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:51:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA4EB41D81
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA4EB41D81
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 954B7842A0; Sat, 17 Sep 2022 12:51:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 14:51:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d23e01c3b79ce8cf709671d1aa10e12b8bb4cb5
X-Git-Newrev: 0e4418b0cf327f19bd2212e51c49de00c94e06d3
X-Patchwork-Hint: ignore
Message-Id: <20220917125110.954B7842A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/agentpp: fix broken URL in help
 text
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e4418b0cf327f19bd2212e51c49de00c94e06d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The curren URL is specific to an old version, and it is not reachable
anymore.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
