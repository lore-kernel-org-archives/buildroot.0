Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2674C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 16:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F551408BC;
	Mon,  2 Jan 2023 16:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F551408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZ1KukixyEpO; Mon,  2 Jan 2023 16:58:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE7C8408EA;
	Mon,  2 Jan 2023 16:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE7C8408EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A50601BF2EC
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 16:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E6B960F44
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 16:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E6B960F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CO2SZVlDz3vU for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8760E60F23
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8760E60F23
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 718B88711B; Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Jan 2023 17:55:40 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 0f93339159b7da0b07831ae47377d39c8aed0d4d
X-Git-Newrev: 3ce37efe7f8940ecb9410190c70e924e7ade03af
X-Patchwork-Hint: ignore
Message-Id: <20230102165752.718B88711B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/wireshark:
 security bump to version 3.4.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ce37efe7f8940ecb9410190c70e924e7ade03af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix CVE-2022-3190: Infinite loop in the F5 Ethernet Trailer protocol
dissector in Wireshark 3.6.0 to 3.6.7 and 3.4.0 to 3.4.15 allows denial
of service via packet injection or crafted capture file

https://www.wireshark.org/security/wnpa-sec-2022-06.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b86de52da2141ed289ad2892c34d3110d02f7b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index db1f71e9ef..56363e717f 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.12.txt
-sha1  91ca69b0029e58b9c824266237ab392a62f0a248  wireshark-3.4.12.tar.xz
-sha256  881a13303e263b7dc7fe337534c8a541d4914552287879bed30bbe76c5bf68ca  wireshark-3.4.12.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.16.txt
+sha1  b0e64d5fdd6701106d94bdc8f59dd40a34c7c807  wireshark-3.4.16.tar.xz
+sha256  6acb3155b89b65bcdbcdac7a9e6a59013a6e21d8ae6a8249a9af4fe9ce3d91ba  wireshark-3.4.16.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index e5d5e6f677..5da344fc55 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.12
+WIRESHARK_VERSION = 3.4.16
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
