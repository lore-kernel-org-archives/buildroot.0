Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB0DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:23:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B46C360EFF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B46C360EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89C25404ED;
	Tue,  3 Aug 2021 22:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNG8QgdCBnqm; Tue,  3 Aug 2021 22:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76FC8404A8;
	Tue,  3 Aug 2021 22:23:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D46A51BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 042A783AD9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGM4shiAhg0b for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A51983AA7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B479C87407; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1a76863dce6cc8811b38153c2b3f34b305242567
X-Git-Newrev: 359bd30350b60948cddc51fbb246e27aa711bdcf
X-Patchwork-Hint: ignore
Message-Id: <20210803211019.B479C87407@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mongodb: add SELinux
 module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=359bd30350b60948cddc51fbb246e27aa711bdcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for mongodb is added by the services/mongodb module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mongodb/mongodb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 377484a00b..6a22acd12a 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -12,6 +12,7 @@ MONGODB_LICENSE = Apache-2.0 (drivers), SSPL (database)
 MONGODB_LICENSE_FILES = APACHE-2.0.txt LICENSE-Community.txt
 
 MONGODB_CPE_ID_VENDOR = mongodb
+MONGODB_SELINUX_MODULES = mongodb
 
 MONGODB_DEPENDENCIES = \
 	boost \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
