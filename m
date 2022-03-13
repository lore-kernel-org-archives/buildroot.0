Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08114C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 21:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFD75404D1;
	Sun, 13 Mar 2022 21:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqsdr-sFuDef; Sun, 13 Mar 2022 21:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F2E3404AF;
	Sun, 13 Mar 2022 21:31:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BBD91BF309
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D16381BCF
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4RYyj5mPJSg for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 21:30:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0778281415
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 21:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9164C83D1D; Sun, 13 Mar 2022 21:21:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 22:02:43 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: d8cb00a283392b51bb34919e2366ba93762436ae
X-Git-Newrev: 91339db0ee99a5257b7e964f0c12bd307a421e54
X-Patchwork-Hint: ignore
Message-Id: <20220313212141.9164C83D1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/wireshark:
 security bump to version 3.4.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=91339db0ee99a5257b7e964f0c12bd307a421e54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix CVE-2021-4190, CVE-2022-0581, CVE-2022-0582, CVE-2022-0583,
CVE-2022-0585 and CVE-2022-0586

https://www.wireshark.org/security/wnpa-sec-2021-22.html
https://www.wireshark.org/security/wnpa-sec-2022-01.html
https://www.wireshark.org/security/wnpa-sec-2022-02.html
https://www.wireshark.org/security/wnpa-sec-2022-03.html
https://www.wireshark.org/security/wnpa-sec-2022-04.html
https://www.wireshark.org/security/wnpa-sec-2022-05.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit db0f8006c1c8685dc98446b5b9e768e52d2f2591)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 7b67e316ed..db1f71e9ef 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.11.txt
-sha1  b656d8709b8b0b3d2a94665af6bec88495ad994c  wireshark-3.4.11.tar.xz
-sha256  a0e227bce2cc3a51ef3301891a0243231990b52a39b68a84a6e32f69c4e75279  wireshark-3.4.11.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.12.txt
+sha1  91ca69b0029e58b9c824266237ab392a62f0a248  wireshark-3.4.12.tar.xz
+sha256  881a13303e263b7dc7fe337534c8a541d4914552287879bed30bbe76c5bf68ca  wireshark-3.4.12.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 0361d0bb64..a5ca4b1f73 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.11
+WIRESHARK_VERSION = 3.4.12
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
