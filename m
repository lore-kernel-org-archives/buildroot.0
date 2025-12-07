Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC78D4337E
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EBF584061;
	Fri, 12 Dec 2025 07:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxCEREXPI_-U; Fri, 12 Dec 2025 07:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09F68840C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526294;
	bh=VSsQEbvVlRbbkNx6ThnVxjKm2VjWLXAyVAqyZHoC4AA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XCxTVUCS+e+aTgOdyINvEgaQ1mBjXxQlOpm+bu2Q376Vmg5tKIi53nrb1xgEaQp69
	 O/w8DffExifHEpAcosFxFxMjDf831TXYT2D1f6Osnll/cXJuNvO5Ma6y5Q0l3Ooo0K
	 tydJUhAfkqwTMFzNCUKg1QjIFapg0cT5w08AXVBkB2iplQEPT06RO/3kuGJqqbQJNQ
	 Ep5aZrqPo+KOvJvb30KHinO1K6iEPEuMzKoyTE8DQx6wiqst276vsnv1bEPgkbB6w1
	 BKxk8vt5NNo41POzv6BygDmnOO8yBE/m/eAhrX6wo7uxHcWUXW/pdkPiZ2/p7NdArN
	 2TBx++j0N+QDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F68840C6;
	Fri, 12 Dec 2025 07:58:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBB6B2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA9B141113
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YK-ZMjdFADY for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E1441124
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00E1441124
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F40B4869E8; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7f3bdb7b26ff7c52b5911e7707aa915a34f1391
X-Git-Newrev: dfe531ef8fbd2eb5d1eb8b067d5416e0ec540060
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.F40B4869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/signal-estimator: fix cmake 4
 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfe531ef8fbd2eb5d1eb8b067d5416e0ec540060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Bump-minimal-cmake-version-to-3.5.patch   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/signal-estimator/0001-Bump-minimal-cmake-version-to-3.5.patch b/package/signal-estimator/0001-Bump-minimal-cmake-version-to-3.5.patch
new file mode 100644
index 0000000000..b2316edd9b
--- /dev/null
+++ b/package/signal-estimator/0001-Bump-minimal-cmake-version-to-3.5.patch
@@ -0,0 +1,22 @@
+From 1c6a2dbda2e76782c3ae92eb25731352dcbd0f7c Mon Sep 17 00:00:00 2001
+From: Victor Gaydov <victor@enise.org>
+Date: Sat, 16 Sep 2023 14:58:20 +0400
+Subject: [PATCH] Bump minimal cmake version to 3.5
+
+Upstream: https://github.com/gavv/signal-estimator/commit/1c6a2dbda2e76782c3ae92eb25731352dcbd0f7c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2c5fadfb..78967cd2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0.0)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(SignalEstimator)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
