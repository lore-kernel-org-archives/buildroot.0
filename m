Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B04DCCA471
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E45614FD;
	Wed,  1 Oct 2025 20:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGI45hodYLqd; Wed,  1 Oct 2025 20:53:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD3DE61551
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD3DE61551;
	Wed,  1 Oct 2025 20:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0586972
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E2C41440
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pq_R_MdD3eQz for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A39D41466
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A39D41466
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66AC4866F1; Wed,  1 Oct 2025 20:52:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:18:57 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: ba2321d0456c2e90b1deef1c3606e07b47edc860
X-Git-Newrev: 6d3a056eac566399f3dbe023daf80f839a6d4011
X-Patchwork-Hint: ignore
Message-Id: <20251001205233.66AC4866F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6d3a056eac566399f3dbe023daf80f839a6d4011
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Update the latest kernel releases to:
 - 6.12.48 -> 6.12.49
 - 6.6.107 -> 6.6.108
 - 6.1.153 -> 6.1.154

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 5bb5f21bc4..3d8e28303e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  3f1ccd0a6dc9c9777cb6fcef357c77e4a2386c84c52b6d5bbcda79c16af33b1b  linux-6.14.11.tar.xz
-sha256  5bf9eb676751bf48978e38363c772298b41a75336d5038ed6d37012399471db2  linux-6.12.48.tar.xz
-sha256  c9b73017d3c7867b9c69a542e5318620cf2b14ed23d52f6aeaaee8aded9ee447  linux-6.6.107.tar.xz
-sha256  76ebbde05899ff712856ae9b06413d71ab7162771e7bc6df4d4ab335e1fc9e48  linux-6.1.153.tar.xz
+sha256  234621e146dacce2241049555d550e4f7a6bde67ccd7ef232d47ac8145425526  linux-6.12.49.tar.xz
+sha256  601cd332aa695d16607b353feff369b4a0b36d111be077e8af54bdd41e1968a6  linux-6.6.108.tar.xz
+sha256  6f1aba92c3d0d21299eebb73161a2056c7c78c6ee77462a7cb705bd8cca8b198  linux-6.1.154.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c70262d2f902710b773ef2f35c04b3ff2111e5186c8a97da351454180aac1e99  linux-5.15.193.tar.xz
 sha256  210a37cc09f5c2b3d6f011aa1c65d2484d6f4ec17cf90df473f917abb2c26dc0  linux-5.10.244.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bfc3f6e9cc..83855a0396 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -443,9 +443,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.299"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.244"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.193"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.153"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.107"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.48"	if BR2_KERNEL_HEADERS_6_12
+	default "6.1.154"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.108"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.49"	if BR2_KERNEL_HEADERS_6_12
 	default "6.14.11"	if BR2_KERNEL_HEADERS_6_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
