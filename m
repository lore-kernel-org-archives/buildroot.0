Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B8CFCC051
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE95683D73;
	Fri,  6 Mar 2026 18:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1i8Fnq26V6L2; Fri,  6 Mar 2026 18:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A5F983D64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772820030;
	bh=p4EbPgJi/ZoejmgR/XO3RloFW3dTQi/T9oLA3DElBFA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B4JI+90xwHU6F+7FDX9cSWETfrMZ6UqpIIa2nZylDn6LIzqFveGBE3zbNnGYqW83X
	 9b740HdTxnK3kqTtmEkA6vdGgeymnnje0PzOj5xnkQtZ6IUV16nhfxYnfEmPE/+g7L
	 Mk8VTgCoZPoNwlHNjTNyQclsLudAo8k2wm5YDFEmy+c3OW2iz5lRaNbyRw3lxtKrrD
	 x7k3oy73f1N9QugsvFE8+8G0ABWUza9S0wx2KevWSOokNqseX+I6UpayybE9sMfKnM
	 8KBBYwnbOTF+eBG+1bdYj+RJ8r2uzA2OhCU0hUFqvrAhLShnD4KDNmvS8RgW5UmWPQ
	 ZlwJwasPh14QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A5F983D64;
	Fri,  6 Mar 2026 18:00:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C00425B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0154841DF4
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYj76EA2OEgR for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17FA040628
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17FA040628
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:00:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E4B1813BF; Fri,  6 Mar 2026 18:00:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 18:57:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44b2e34988bab95b65a9aefeed91f9fdc071655d
X-Git-Newrev: aa461fd35379784b08042633c1f70a381d45a4e3
X-Patchwork-Hint: ignore
Message-Id: <20260306180025.1E4B1813BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{1, 6,
 12}.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa461fd35379784b08042633c1f70a381d45a4e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/before-6.17/linux.hash               | 6 +++---
 package/linux-headers/{6.1.165 => 6.1.166} | 0
 package/linux-headers/{6.12.75 => 6.12.76} | 0
 package/linux-headers/{6.6.128 => 6.6.129} | 0
 package/linux-headers/Config.in.host       | 6 +++---
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 233dacaff8..90e67be8bd 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  06ee7927556ff1aa8810c4826501b0fdb169ebdc180644b882cf7c143ac1c177  linux-6.12.75.tar.xz
-sha256  669633bb8480021f15c38883fb2f6fe2087cc8b69a582f26f6b7d4ae6b348e48  linux-6.6.128.tar.xz
-sha256  5a817184f1be901b75c7e0afc02376bc3ac51624e03ec6f7b8a5f9d395d22ef4  linux-6.1.165.tar.xz
+sha256  bbb43e834c46e6bd49a5c28f22e679a937443404e1f653204d4b24929f3ad896  linux-6.12.76.tar.xz
+sha256  caa08f0122224fbbfab177e2a37cc2a94a0046bd2e7e87f03f8913f2b812448a  linux-6.6.129.tar.xz
+sha256  818dfc742158d18f70a6abccd77b7e4366cb7f26a88687f94dae392a9f089449  linux-6.1.166.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
 sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
diff --git a/package/linux-headers/6.1.165 b/package/linux-headers/6.1.166
similarity index 100%
rename from package/linux-headers/6.1.165
rename to package/linux-headers/6.1.166
diff --git a/package/linux-headers/6.12.75 b/package/linux-headers/6.12.76
similarity index 100%
rename from package/linux-headers/6.12.75
rename to package/linux-headers/6.12.76
diff --git a/package/linux-headers/6.6.128 b/package/linux-headers/6.6.129
similarity index 100%
rename from package/linux-headers/6.6.128
rename to package/linux-headers/6.6.129
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4ef19c2e9c..7c2f9a7aa2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -466,9 +466,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.165"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.128"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.75"	if BR2_KERNEL_HEADERS_6_12
+	default "6.1.166"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.129"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.76"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.16"	if BR2_KERNEL_HEADERS_6_18
 	default "6.19.6"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
