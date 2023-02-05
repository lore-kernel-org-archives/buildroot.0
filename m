Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C7FC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF19B6077D;
	Sun,  5 Feb 2023 14:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF19B6077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmUeqF9725cD; Sun,  5 Feb 2023 14:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C12D60776;
	Sun,  5 Feb 2023 14:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C12D60776
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FAD01BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA70741558
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA70741558
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNmWy4EmGEpa for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:39:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA86F4150E
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA86F4150E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4FA7838A5; Sun,  5 Feb 2023 14:39:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 15:37:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02befac8f9404ae30d0d090221d21a8460c82ec7
X-Git-Newrev: ce2ac1fecfdd61c01bb34984624f2d37fea91f91
X-Patchwork-Hint: ignore
Message-Id: <20230205143927.C4FA7838A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 4.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce2ac1fecfdd61c01bb34984624f2d37fea91f91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-0411, CVE-2023-0412, CVE-2023-0413, CVE-2023-0414,
CVE-2023-0415, CVE-2023-0416 and CVE-2023-0417

https://www.wireshark.org/security/wnpa-sec-2023-01
https://www.wireshark.org/security/wnpa-sec-2023-02
https://www.wireshark.org/security/wnpa-sec-2023-03
https://www.wireshark.org/security/wnpa-sec-2023-04
https://www.wireshark.org/security/wnpa-sec-2023-05
https://www.wireshark.org/security/wnpa-sec-2023-06
https://www.wireshark.org/security/wnpa-sec-2023-07

https://www.wireshark.org/docs/relnotes/wireshark-4.0.3.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index e9026b8caa..7128b560ae 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.2.txt
-sha1  0127180ff18515b086fe5603f767f53ddaa64c1a  wireshark-4.0.2.tar.xz
-sha256  f35915699f2f9b28ddb211202d40ec8984e5834d3c911483144a4984ba44411d  wireshark-4.0.2.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.3.txt
+sha1  243b0057cfe6d447662e81b5646110aaf8b63c81  wireshark-4.0.3.tar.xz
+sha256  6c51e15bcc0afb93734e686dbff354ffd159f570bd2904bcbbad6f3feb7e9511  wireshark-4.0.3.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index e2a424ef0f..12c36575df 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.2
+WIRESHARK_VERSION = 4.0.3
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
