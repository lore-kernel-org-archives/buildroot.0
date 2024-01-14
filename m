Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32C1C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 16:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79A7260669;
	Sun, 14 Jan 2024 16:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79A7260669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnEEMyY79DT1; Sun, 14 Jan 2024 16:43:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C26F960743;
	Sun, 14 Jan 2024 16:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C26F960743
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DADC1BF41F
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6744D402DC
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6744D402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dau8xAedfnjj for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 16:43:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59FB8402DA
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 16:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59FB8402DA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 475FB86157; Sun, 14 Jan 2024 16:43:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 17:38:06 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cf79204de42758317c254d4b618dcaf99f74d165
X-Git-Newrev: f092de882dd9a87723842272fb33078e57f1cea9
X-Patchwork-Hint: ignore
Message-Id: <20240114164315.475FB86157@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/wireshark:
 security bump to version 4.0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=f092de882dd9a87723842272fb33078e57f1cea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- GVCP dissector crash. CVE-2024-0208.
- IEEE 1609.2 dissector crash. CVE-2024-0209.

https://www.wireshark.org/security/wnpa-sec-2024-01
https://www.wireshark.org/security/wnpa-sec-2024-02

https://www.wireshark.org/docs/relnotes/wireshark-4.0.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1e3d206f154915ec86d7750bf7f846b6da412a1a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index a6ef69b1af..6610eb7781 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.11.txt
-sha1  4af3140d69f9d41e1c4e161fad66304a6920ddce  wireshark-4.0.11.tar.xz
-sha256  4c341cc33a6c512d983f4126e6f3e5c249f604e14ab7f337d38b1cbe58199e3d  wireshark-4.0.11.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.12.txt
+sha1  e00d90769995bf786b05c05bdd9a2c6c8e372e70  wireshark-4.0.12.tar.xz
+sha256  e4e3d618ba11e159fb163f0dc4716a8b72a065aafd1111db9405332552a5a115  wireshark-4.0.12.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 6fb4b60f2b..3759f9bf94 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.11
+WIRESHARK_VERSION = 4.0.12
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
