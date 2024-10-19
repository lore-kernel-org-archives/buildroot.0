Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46834D3C92C
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 20:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA3F080D5D;
	Sat, 19 Oct 2024 20:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eA_sZACpJy2g; Sat, 19 Oct 2024 20:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A30A80D78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A30A80D78;
	Sat, 19 Oct 2024 20:17:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1B1D27D7
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0CDC4051E
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1xFbNWCImXZ for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 20:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0A8840535
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0A8840535
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:17:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D052860A9; Sat, 19 Oct 2024 20:17:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 22:13:15 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3877c0bfe2b79e319a32c2492f61de14c7398597
X-Git-Newrev: ee31fb1242fe22fb71013cfd5371557ddc25e84b
X-Patchwork-Hint: ignore
Message-Id: <20241019201749.9D052860A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/mosquitto:
 security bump to version 2.0.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee31fb1242fe22fb71013cfd5371557ddc25e84b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

For change log, see:
https://github.com/eclipse/mosquitto/blob/v2.0.19/ChangeLog.txt

The change log mention 2 security related fixes.
There is no allocated CVE.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bd127d0c3ffc57646f4908264728da4ea074241b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 453c1934dd..34f50906c1 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.18.tar.gz.asc
-sha256  d665fe7d0032881b1371a47f34169ee4edab67903b2cd2b4c083822823f4448a  mosquitto-2.0.18.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.19.tar.gz.asc
+sha256  33af3637f119a61c509c01d2f8f6cc3d8be76f49e850132f2860af142abf82a9  mosquitto-2.0.19.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index b847e56fec..7a7d49cd36 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.18
+MOSQUITTO_VERSION = 2.0.19
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
