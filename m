Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD68C6FA91
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 12:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 164BD41A14;
	Thu, 22 Sep 2022 12:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 164BD41A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHkQc4LrClKI; Thu, 22 Sep 2022 12:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43B5415FF;
	Thu, 22 Sep 2022 12:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D43B5415FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 217001BF2CE
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A3FC416E7
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A3FC416E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XnWiA9gP58Zl for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 12:52:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 119B2415FF
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 12:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 119B2415FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 002C985E55; Thu, 22 Sep 2022 12:52:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 14:49:40 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c7493cb042b1acc46f0c837f85f15e3425e481b0
X-Git-Newrev: b4ed173ec15a858a0fe6aeef450713e5d0c9e03d
X-Patchwork-Hint: ignore
Message-Id: <20220922125219.002C985E55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/snmppp: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4ed173ec15a858a0fe6aeef450713e5d0c9e03d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
