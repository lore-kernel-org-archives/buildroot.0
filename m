Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BAEC6FA82
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 12:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 962B161009;
	Thu, 22 Sep 2022 12:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 962B161009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YDgy0NL_CWN; Thu, 22 Sep 2022 12:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E6261094;
	Thu, 22 Sep 2022 12:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E6261094
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A835B1BF2CE
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9165883455
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9165883455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqkKprAzUoAR for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 12:51:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C071383163
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 12:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C071383163
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB1FD85E38; Thu, 22 Sep 2022 12:51:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 14:50:06 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: f5fcd64dfcf0a3133cde0a90909cac1f2ef84d70
X-Git-Newrev: a6f5c04744a0b6576b5246d55a1a96647e4910a9
X-Patchwork-Hint: ignore
Message-Id: <20220922125113.AB1FD85E38@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/snmppp: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6f5c04744a0b6576b5246d55a1a96647e4910a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The curren URL is specific to an old version, and it is not reachable
anymore.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1d23e01c3b79ce8cf709671d1aa10e12b8bb4cb5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snmppp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 1f05f53f9f..f3a076714d 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SNMPPP
 	help
 	  SNMP++v3.x is a C++ API which supports SNMP v1, v2c, and v3.
 
-	  http://www.agentpp.com/snmp_pp3_x/snmp_pp3_x.html
+	  https://www.agentpp.com/api/cpp/snmp_pp.html
 
 if BR2_PACKAGE_SNMPPP
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
