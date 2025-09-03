Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3F5CA1010
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 22:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDCDB4234D;
	Wed,  3 Sep 2025 22:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PXzRP8eibGw; Wed,  3 Sep 2025 22:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C614234B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C614234B;
	Wed,  3 Sep 2025 22:14:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45781930
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 22:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3752342344
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 22:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5GrWI9wD4Nk for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 22:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59EAE42340
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59EAE42340
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 22:14:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 455E887EC7; Wed,  3 Sep 2025 22:14:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 00:04:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 597d5d10ec77f7655e2608c2c45a257a9be50352
X-Git-Newrev: 49d5a88901b8f137a24b9d35de72afd927eacd25
X-Patchwork-Hint: ignore
Message-Id: <20250903221419.455E887EC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wireshark: security
 bump to v4.2.13
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49d5a88901b8f137a24b9d35de72afd927eacd25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See the release notes:
- https://www.wireshark.org/docs/relnotes/wireshark-4.2.12.html
- https://www.wireshark.org/docs/relnotes/wireshark-4.2.13.html

This fixes the following vulnerability:
- CVE-2025-5601:
    Column handling crashes in Wireshark 4.4.0 to 4.4.6 and 4.2.0 to
    4.2.12 allows denial of service via packet injection or crafted
    capture file
    https://www.cve.org/CVERecord?id=CVE-2025-5601

Also update hash for COPYING because of Wireshark commit
614add27f29269e681e4d32138bea4951985fe0a that changes the FSF address

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 891ec88b6da102035a5951d41df624decb3458ff)
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wireshark/wireshark.hash | 8 ++++----
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 8b3245551a..f1f2f58442 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,7 +1,7 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.11.txt
-sha1  f4e908e73ab90982e7f712e0a9b5f4cce85ca058  wireshark-4.2.11.tar.xz
-sha256  dd80f30e9853105dacb5357e5832d960437160bbb4b147e8f1a7ead168afaa18  wireshark-4.2.11.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.13.txt
+sha1  e5a08396a98d5dfba4078c66677aacd50d47ec90  wireshark-4.2.13.tar.xz
+sha256  2454aa650276264d23aca28e1b62eb5d4bd12b64aa261d38c06b33f97b8fa3dd  wireshark-4.2.13.tar.xz
 
 # Locally calculated
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
 sha256  fce67c1558e448fac784ce9a30cb47956488bc3ef6ec16316c38b0668b3cad2e  README.md
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 72415448c4..bd81224ae7 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.2.11
+WIRESHARK_VERSION = 4.2.13
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
