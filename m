Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA59CAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 719378072A;
	Mon,  8 Sep 2025 14:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDjVNd933Kwk; Mon,  8 Sep 2025 14:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 112CE80728
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 112CE80728;
	Mon,  8 Sep 2025 14:17:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10FFE279
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7917F6060E
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9pFYWEnftaD for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C90B960605
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C90B960605
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C680181353; Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 00:04:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49d5a88901b8f137a24b9d35de72afd927eacd25
X-Git-Newrev: 49fa20e6678ee32e4b26979f5cb4d149876fbedd
X-Patchwork-Hint: ignore
Message-Id: <20250908141630.C680181353@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: bump to latest upstream
 stable v4.4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=49fa20e6678ee32e4b26979f5cb4d149876fbedd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release notes:
- https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html
- https://www.wireshark.org/docs/relnotes/wireshark-4.4.9.html
- (and all patch versions inbetween)

Also update the README hash, as it has been updated in Wireshark commit
1832f2bc3948248bf21acab5dd16fca8d5477a1a

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wireshark/wireshark.hash | 8 ++++----
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index f1f2f58442..88eb7ef494 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,7 +1,7 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.13.txt
-sha1  e5a08396a98d5dfba4078c66677aacd50d47ec90  wireshark-4.2.13.tar.xz
-sha256  2454aa650276264d23aca28e1b62eb5d4bd12b64aa261d38c06b33f97b8fa3dd  wireshark-4.2.13.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.9.txt
+sha1  dc91c68b03b389645fa6dade92960863d74bca1d  wireshark-4.4.9.tar.xz
+sha256  60551dc787f41e87aeaa1e9c33304f9008037e3baf9fa11aef9c2d584cc0b54b  wireshark-4.4.9.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
-sha256  fce67c1558e448fac784ce9a30cb47956488bc3ef6ec16316c38b0668b3cad2e  README.md
+sha256  39887d884b6473f5897c915ae8e9497e5bc2c1f6decec2ce820d5fd716d763cc  README.md
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index bd81224ae7..9ccd8f9a9e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.2.13
+WIRESHARK_VERSION = 4.4.9
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
