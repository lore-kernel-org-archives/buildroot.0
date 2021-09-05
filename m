Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396FDC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 13:58:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0789B60EE6
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 13:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0789B60EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE17E80BC0;
	Sun,  5 Sep 2021 13:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvE1oiWPMrY5; Sun,  5 Sep 2021 13:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C27780B41;
	Sun,  5 Sep 2021 13:58:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A63C1BF57B
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 13:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36DC5400C6
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 13:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJ2infMAk4NJ for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 13:57:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3218F40223
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 13:57:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 211B588596; Sun,  5 Sep 2021 13:56:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Sep 2021 15:56:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0fb6778d3eb988843ea747facaa56551a35b00a
X-Git-Newrev: d333eab3f0743a54808466b933a8591ac1eb5ed3
X-Patchwork-Hint: ignore
Message-Id: <20210905135618.211B588596@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: security bump to v2.0.12
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d333eab3f0743a54808466b933a8591ac1eb5ed3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mosquitto 2.0.12 is a security and bugfix release, notably:

* Fix possible DoS in the broker with MQTTv5
* Fix CVE-2020-13849
* Fix CVE-2021-34434

Read the full announcement on
https://mosquitto.org/blog/2021/08/version-2-0-12-released/

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index baa2a90c5a..2692aa1a9b 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.11.tar.gz.asc
-sha256  7b36a7198bce85cf31b132f5c6ee36dcf5dadf86fb768501eb1e11ce95d4f78a  mosquitto-2.0.11.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.12.tar.gz.asc
+sha256  31cf0065cb431d6f4e57a5f4d56663e839c9d177362eff89582d7cfde191c933  mosquitto-2.0.12.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 52f9c98733..06b963a994 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.11
+MOSQUITTO_VERSION = 2.0.12
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
