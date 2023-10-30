Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7006C4167D
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E83C85104;
	Mon, 30 Oct 2023 10:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E83C85104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEYWm7TDo7jp; Mon, 30 Oct 2023 10:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 881B585507;
	Mon, 30 Oct 2023 10:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881B585507
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EB3B1BF38B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2815C7066B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2815C7066B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60w-mquEG-0t for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AD527046A
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AD527046A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CF2D86168; Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 11:16:46 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: be9c7b92e4e77074e2de34c190ea901784a6ec2f
X-Git-Newrev: 6ac17539d61fa19920b4545d204251f75ddb2597
X-Patchwork-Hint: ignore
Message-Id: <20231030101903.0CF2D86168@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/wireshark:
 security bump to version 4.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ac17539d61fa19920b4545d204251f75ddb2597
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

https://www.wireshark.org/news/20231004.html
https://www.wireshark.org/news/20231004a.html

Fix CVE-2023-5371:
https://www.wireshark.org/security/wnpa-sec-2023-27.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7385c7f8b302db76a944240ee32d9afafa1db2f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index f044f99483..c9b693c9cb 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.8.txt
-sha1  8ca1cc4471d0cb835cd5216833c393fa23bc154f  wireshark-4.0.8.tar.xz
-sha256  16663585c0ffefd5593a6628d4a20cc8241b9703b11283cfe71ead2b750888c8  wireshark-4.0.8.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.10.txt
+sha1  830ba7ff602da90323bbc5ec15941c0878d9ee4a  wireshark-4.0.10.tar.xz
+sha256  b2e3ff03fa2be9058a9ffbedd12b0a670433bd16c8cc6c432ab48dabc2df1898  wireshark-4.0.10.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 500bdbb77a..2f563950b2 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.8
+WIRESHARK_VERSION = 4.0.10
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
