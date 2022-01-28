Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1459DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 12:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD7E260B6A;
	Fri, 28 Jan 2022 12:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSGSCPPnndYn; Fri, 28 Jan 2022 12:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF57160B0E;
	Fri, 28 Jan 2022 12:48:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8A51C1162
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67F5684C64
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Na9SS8mkphgA for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 12:46:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABFF284C68
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:46:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A5BA6829FC; Fri, 28 Jan 2022 12:39:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 13:45:56 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: cd8f975dc0c526ec8761fc89f222e95c29b009c7
X-Git-Newrev: 5dd97c860cfa2109b58b5f2aa5e9d68495f79652
X-Patchwork-Hint: ignore
Message-Id: <20220128123934.A5BA6829FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/wireshark:
 security bump to version 3.4.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dd97c860cfa2109b58b5f2aa5e9d68495f79652
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix the following security issues:
- https://www.wireshark.org/security/wnpa-sec-2021-16.html
  (CVE-2021-4186)
- https://www.wireshark.org/security/wnpa-sec-2021-17.html
  (CVE-2021-4185)
- https://www.wireshark.org/security/wnpa-sec-2021-18.html
  (CVE-2021-4184)
- https://www.wireshark.org/security/wnpa-sec-2021-20.html
  (CVE-2021-4182)
- https://www.wireshark.org/security/wnpa-sec-2021-21.html
  (CVE-2021-4181)

https://www.wireshark.org/docs/relnotes/wireshark-3.4.11.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d19436b88dcea890b6a73b242e2a2cbb66e17fcd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index bc7c9f4d7e..7b67e316ed 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.10.txt
-sha1  63839abd94d3ae376f860e2d2969777680106578  wireshark-3.4.10.tar.xz
-sha256  8aa7ef4a44ae62bb8db463cf761e2cc03b97305e0e77ed5be53fa83729187cef  wireshark-3.4.10.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.11.txt
+sha1  b656d8709b8b0b3d2a94665af6bec88495ad994c  wireshark-3.4.11.tar.xz
+sha256  a0e227bce2cc3a51ef3301891a0243231990b52a39b68a84a6e32f69c4e75279  wireshark-3.4.11.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 2ba81d1f39..0361d0bb64 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.10
+WIRESHARK_VERSION = 3.4.11
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
