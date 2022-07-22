Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51574C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E58D2421B8;
	Fri, 22 Jul 2022 07:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E58D2421B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4YQO1hr6UtH; Fri, 22 Jul 2022 07:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA15541B89;
	Fri, 22 Jul 2022 07:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA15541B89
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF8EF1BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8978241B73
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8978241B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6J1v5Ib3MBnP for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FC1F4175E
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FC1F4175E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 83FB0840C4; Fri, 22 Jul 2022 06:56:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:09:41 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 61fd225033988cc7c6605982b9e0791cb413554e
X-Git-Newrev: 83e32e4dfdcab10fb7882a11a0742c0340755080
X-Patchwork-Hint: ignore
Message-Id: <20220722065611.83FB0840C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/rabbitmq-server:
 replace RABBITMQ_SERVER_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=83e32e4dfdcab10fb7882a11a0742c0340755080
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

pivotal_software has been replaced by vmware in March 2022:

 <cpe-item name="cpe:/a:pivotal_software:rabbitmq:3.7.28" deprecated="true" deprecation_date="2022-03-17T14:05:30.170Z">
      <reference href="https://www.rabbitmq.com/">Product</reference>
      <reference href="https://github.com/rabbitmq/rabbitmq-server/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:pivotal_software:rabbitmq:3.7.28:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:vmware:rabbitmq:3.7.28:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avmware%3Arabbitmq

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e5189a09d7a2667bf4e12020a262c449949a53a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rabbitmq-server/rabbitmq-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index 33c3359429..969e61e2b5 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -32,7 +32,7 @@ RABBITMQ_SERVER_LICENSE_FILES = \
 	LICENSE-MPL-RabbitMQ \
 	LICENSE-MPL2 \
 	LICENSE-rabbitmq_aws
-RABBITMQ_SERVER_CPE_ID_VENDOR = pivotal_software
+RABBITMQ_SERVER_CPE_ID_VENDOR = vmware
 RABBITMQ_SERVER_CPE_ID_PRODUCT = rabbitmq
 RABBITMQ_SERVER_SELINUX_MODULES = rabbitmq
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
