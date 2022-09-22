Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D1DC54EE9
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 12:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3922240C15;
	Thu, 22 Sep 2022 12:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3922240C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQgKy4IRv0xy; Thu, 22 Sep 2022 12:52:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DABB40C23;
	Thu, 22 Sep 2022 12:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DABB40C23
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 825281BF2CE
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED647415FF
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED647415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sm-ZS0u0Npy6 for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 12:52:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E90ED41825
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 12:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E90ED41825
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8B1085E5E; Thu, 22 Sep 2022 12:52:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 14:49:57 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: a0b44610105636ebc21899d1c3cf72259482524a
X-Git-Newrev: aba6d544ac03fb23ced8e3215444728cc79b4e13
X-Patchwork-Hint: ignore
Message-Id: <20220922125219.D8B1085E5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/agentpp: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=aba6d544ac03fb23ced8e3215444728cc79b4e13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
