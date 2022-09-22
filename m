Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F70C54EE9
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 12:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D5083689;
	Thu, 22 Sep 2022 12:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99D5083689
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AI_w1F-sFeqi; Thu, 22 Sep 2022 12:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE6C7827C6;
	Thu, 22 Sep 2022 12:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE6C7827C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9CBD1BF2CE
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09D6341890
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D6341890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxAD8g2OVSgH for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 12:52:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE92A41729
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 12:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE92A41729
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD95F85E55; Thu, 22 Sep 2022 12:52:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 14:49:55 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d6c0d674d9802b7fa3dd4a8543559feb8df52625
X-Git-Newrev: a0b44610105636ebc21899d1c3cf72259482524a
X-Patchwork-Hint: ignore
Message-Id: <20220922125219.CD95F85E55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/snmppp: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0b44610105636ebc21899d1c3cf72259482524a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
