Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983E5C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 345836110E;
	Sat, 17 Sep 2022 12:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 345836110E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqnzRJueQ37i; Sat, 17 Sep 2022 12:51:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6358960A8D;
	Sat, 17 Sep 2022 12:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6358960A8D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4FEC1BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0A9884068
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A9884068
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-joL4YYKUMV for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:51:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D63B84307
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D63B84307
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8AD8E8429F; Sat, 17 Sep 2022 12:51:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 14:50:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9beef1f0c474f4e5953797df0e7cddbe39df253
X-Git-Newrev: 1d23e01c3b79ce8cf709671d1aa10e12b8bb4cb5
X-Patchwork-Hint: ignore
Message-Id: <20220917125110.8AD8E8429F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snmppp: fix broken URL in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d23e01c3b79ce8cf709671d1aa10e12b8bb4cb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The curren URL is specific to an old version, and it is not reachable
anymore.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
