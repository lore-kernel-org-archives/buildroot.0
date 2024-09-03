Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1502CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80A6340A99;
	Tue,  3 Sep 2024 18:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wENhF21dXihw; Tue,  3 Sep 2024 18:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C25BA40AB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C25BA40AB2;
	Tue,  3 Sep 2024 18:38:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 835351BF59C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75DE6404C8
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYt2qU7c_pIz for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 588C340A20
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 588C340A20
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 552FF86AB8; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:29:35 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: dc53c20200d5825df8fee19a6574af49fc2a1a90
X-Git-Newrev: 935111fd263119d65771a0b8f0a16d372d0b6462
X-Patchwork-Hint: ignore
Message-Id: <20240903183810.552FF86AB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] {linux,
 linux-headers}: bump 6.{1, 6, 10}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=935111fd263119d65771a0b8f0a16d372d0b6462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 179bf242d564e18db278b39fdf67e43ec6806e28)
[Peter: drop 6.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 2d22a96650..9abc988070 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
-sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
-sha256  1ba5f93b411ead7587fe48b2eec6c656f6796d31f5e406d236913c77512497ec  linux-6.1.102.tar.xz
+sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
+sha256  5eb4706f898f50881552ff5146d892132d3ffc5298033bffe27087d3a44c4573  linux-6.1.103.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  ec6098faed64b8a47ba1772e812a6eb444385f7aa3c60d3e4739ab2fd3b29186  linux-5.15.164.tar.xz
 sha256  ca09d86a6b79706c33382d3f8606f476eb07918417a87fb1815f6a4aa81f2ba1  linux-5.10.223.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cf19b59d90..0080c944ea 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -419,8 +419,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.281"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.223"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.164"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.102"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.43"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.103"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.44"	if BR2_KERNEL_HEADERS_6_6
 	default "6.8.12"	if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
