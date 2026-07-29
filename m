Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B387C54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 20:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD8A8097A;
	Wed, 29 Jul 2026 20:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVUClYt5BXmA; Wed, 29 Jul 2026 20:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F33B80BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785356964;
	bh=xFzuVXqFrCRjLiuDKWbbVjv9tkphhtvOUz0thx7Lu2k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O7A62X7wcx3NCE2UET1wmGZZHQxWdykabX2RgLbf5Ww9GmhnrwaKMj3wyGHSejnKm
	 T7pVm+i7gfhO4AcF6/VoPPChEnEtl830chJIKo2IIG/kaFf+eJV/UQGVgPUJqStFzI
	 2yWyS46TVmp68/UodY/ZQ+Vzm2m6m8Vq9p53Y9g7IkftXlUOvswruFJAi/+C+3YskY
	 pNWzVKx+Nvz/nbcXXqg1sxWQ7X+tCqbmyZKE5OMX1VaeYSO9KF5dLLHs8qb4vz/TMd
	 uWqvya7s0ooieBebnemxm+9cmqdpq6KAdS7ZDFhaQiGiMxZffG56kFjRtsIX2O1I9n
	 VOmpBEe3IO2HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F33B80BEC;
	Wed, 29 Jul 2026 20:29:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F94F26E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2182F400C0
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZDWyMNoWhDs for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 20:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 583654009C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 583654009C
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:29:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 086688B554; Wed, 29 Jul 2026 20:28:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 22:26:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a19e6cfe63064fb827b6234142374accd0317846
X-Git-Newrev: e3cee01400b409468d7e8f5c57fe0280d1409846
X-Patchwork-Hint: ignore
Message-Id: <20260729202840.086688B554@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 6.1.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3cee01400b409468d7e8f5c57fe0280d1409846
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 6.12.98 -> 6.12.99
 - 6.6.145 -> 6.6.146
 - 6.1.178 -> 6.1.179

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/before-6.17/linux.hash               | 6 +++---
 package/linux-headers/{6.1.178 => 6.1.179} | 0
 package/linux-headers/{6.12.98 => 6.12.99} | 0
 package/linux-headers/{6.6.145 => 6.6.146} | 0
 package/linux-headers/Config.in.host       | 6 +++---
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 5102fea2ff..92f0ad8550 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a62b6a2d207ff72510e5f47156b7078e1e71797357412411b8e4fff97fc8f4c7  linux-6.12.98.tar.xz
-sha256  de100e33d8ad8b6f4b3d2335b179e961be3c00ae7a39efdb052182a8d8bf0126  linux-6.6.145.tar.xz
-sha256  7d83fa67ca75032b1ac6ef49973722073963c0cb9bc3aa7ef3efa749cf6c720f  linux-6.1.178.tar.xz
+sha256  6a477222c132033381cda981eb0127f29fbcbba17e820283bc21290f8e408629  linux-6.12.99.tar.xz
+sha256  62e6c1e456202b57b048071593e890f9e8f50fb50fe0df64f8bfbf65f360140e  linux-6.6.146.tar.xz
+sha256  dd4a164b6ffdcac6b1d958eb14bee256b10819557ee58ac5c9f6a1ae33380126  linux-6.1.179.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c396aeebc90c7aecb7f7abdf504c19b372c9926eb0cf0e91f9f09d7d870b65fe  linux-5.15.212.tar.xz
 sha256  a19ca1100640a5fd3b452eb15fe9de32f8deb4ab1866dd7db52183b1a2fad7c4  linux-5.10.261.tar.xz
diff --git a/package/linux-headers/6.1.178 b/package/linux-headers/6.1.179
similarity index 100%
rename from package/linux-headers/6.1.178
rename to package/linux-headers/6.1.179
diff --git a/package/linux-headers/6.12.98 b/package/linux-headers/6.12.99
similarity index 100%
rename from package/linux-headers/6.12.98
rename to package/linux-headers/6.12.99
diff --git a/package/linux-headers/6.6.145 b/package/linux-headers/6.6.146
similarity index 100%
rename from package/linux-headers/6.6.145
rename to package/linux-headers/6.6.146
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8e90f85a64..250fb083ab 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -474,9 +474,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.261"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.212"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.178"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.145"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.98"	if BR2_KERNEL_HEADERS_6_12
+	default "6.1.179"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.146"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.99"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.40"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.5"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
