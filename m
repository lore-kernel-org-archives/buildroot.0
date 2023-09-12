Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4593DEE3F29
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 21:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3E5D81B17;
	Tue, 12 Sep 2023 21:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3E5D81B17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWdgT8Ws5yUG; Tue, 12 Sep 2023 21:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A3A81C6E;
	Tue, 12 Sep 2023 21:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31A3A81C6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D59C71BF964
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF98781B17
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF98781B17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N3p10G8154Gl for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 21:14:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D86B781C6E
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D86B781C6E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C50E9869CF; Tue, 12 Sep 2023 21:14:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 23:09:52 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c56404b44985608b8c06172cfaa22c6844f12797
X-Git-Newrev: 3aa5e8b997e4506dd357d4b3785ccf10a35b6165
X-Patchwork-Hint: ignore
Message-Id: <20230912211406.C50E9869CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mosquitto:
 security bump to version 2.0.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=3aa5e8b997e4506dd357d4b3785ccf10a35b6165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following security issues:

- CVE-2023-28366: Fix memory leak in broker when clients send multiple QoS 2
  messages with the same message ID, but then never respond to the PUBREC
  commands.
- CVE-2023-0809: Fix excessive memory being allocated based on malicious
  initial packets that are not CONNECT packets.
- CVE-2023-3592: Fix memory leak when clients send v5 CONNECT packets with a
  will message that contains invalid property types.
- Broker will now reject Will messages that attempt to publish to $CONTROL/.
- Broker now validates usernames provided in a TLS certificate or TLS-PSK
  identity are valid UTF-8.
- Fix potential crash when loading invalid persistence file.
- Library will no longer allow single level wildcard certificates, e.g. *.com

For more details, see the changelog:
https://mosquitto.org/ChangeLog.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9f1ca943d554afe855f7eca2a0199481cc2c0426)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 2cfd0d9422..cbe54d6d1a 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.15.tar.gz.asc
-sha256  4735b1d32e3f91c7a8896741d88a3022e89730a1ee897946decfa0df27039ac6  mosquitto-2.0.15.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.16.tar.gz.asc
+sha256  638db9e43e89d243ea98d10d66e76ff376131217780decd01abaffacc66d8035  mosquitto-2.0.16.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index a95a2cac4d..f146a86d0a 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.15
+MOSQUITTO_VERSION = 2.0.16
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
