Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E97C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 19:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B1F440217;
	Tue,  4 Oct 2022 19:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B1F440217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEd9hntFmOwp; Tue,  4 Oct 2022 19:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25AD5401A4;
	Tue,  4 Oct 2022 19:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25AD5401A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D20C81BF405
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE4C34019B
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE4C34019B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8j68dOV9iTZ for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 19:54:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7B68400BF
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7B68400BF
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:54:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 86D40D2F53
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:51:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AE97F60008;
 Tue,  4 Oct 2022 19:50:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1ofnwK-003uSN-7T; Tue, 04 Oct 2022 21:50:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 21:50:30 +0200
Message-Id: <20221004195039.931947-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221004195039.931947-1-peter@korsgaard.com>
References: <20221004195039.931947-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/11] {toolchain,
 linux-headers}: add support for 5.18 headers
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not add a preconfigured 5.18.x version to linux-headers as 5.18.x is
already EOL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host                        | 6 +++++-
 toolchain/Config.in                                         | 5 +++++
 .../toolchain-external-custom/Config.in.options             | 6 +++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ab59bdd368..9d993a2e99 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -133,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_18
+	bool "5.18.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17
-	bool "5.17.x or later"
+	bool "5.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 219578092b..c49691cff2 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -567,6 +567,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -580,6 +584,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
 	default "5.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 	default "5.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 	default "5.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 6727778f42..16f1ac0a5e 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -127,8 +127,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_18
+	bool "5.18.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_17
-	bool "5.17.x or later"
+	bool "5.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_16
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
