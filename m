Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B82C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 11:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5F844063C;
	Tue, 20 Dec 2022 11:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5F844063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eeG3rbSv7z6y; Tue, 20 Dec 2022 11:50:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1709940606;
	Tue, 20 Dec 2022 11:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1709940606
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38E751BF4DD
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 11:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13C6141299
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 11:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13C6141299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51dkOEAFaFAa for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 11:50:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ABD74089C
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 11:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ABD74089C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1243986A95; Tue, 20 Dec 2022 11:50:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 12:45:51 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 981474c29364b84154af122d2413fd0f6f8c89e5
X-Git-Newrev: 511da4717d65000d6b98c61e4b5efa9f35db1a84
X-Patchwork-Hint: ignore
Message-Id: <20221220115049.1243986A95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/rtl8189es:
 disable -Werror to fix build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=511da4717d65000d6b98c61e4b5efa9f35db1a84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fixes:
http://autobuild.buildroot.net/results/349893c66fcfbbf0e0e10285299581894254c941/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit abb36a1f5f619991a1a66c1a87b9881294465ab9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8189es/rtl8189es.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 6acc409e73..c2ee77f922 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -11,7 +11,8 @@ RTL8189ES_LICENSE = GPL-2.0
 RTL8189ES_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189ES=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="-Wno-error"
 
 define RTL8189ES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
