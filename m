Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20809D1BDFF
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F11CA608BA;
	Wed,  3 Dec 2025 21:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsvoYt9iZg9h; Wed,  3 Dec 2025 21:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF448606A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764798210;
	bh=igNjJuCIhQZ3LagG3jp6IIibJTXadCfBvV6z9n9dpb8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MGmMY2+prvmKv4WoavDz5GLIr4FsQc6F/ol892dMwzC4mm366Os5XISXuJSJyasCF
	 /i79VfAs5alNOvQWZ9T41Zotlxtg4hsX3ufDNOiF0EKTIeC9jQJvqRr62IsoYGblC9
	 1ysGWkjuQN8L17ZvdFMc5XKiFsp+va4vKx+J9FNAQS3BGiU3eTdNz7lhfMXQv0KD9c
	 I91GSeyW6cFwiv4LjaGnZBjt8yaVdyulTo3JsSrwte8c72lKx5qhsKLehnbXXTmQRS
	 P4xrzYogphH7JCbc6UrDbo3F1Zntub9LFo7Am5zo+IvZHQrofblZCokGEwrxsR/13h
	 bYF+DoBZQ0I7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF448606A9;
	Wed,  3 Dec 2025 21:43:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A726E7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CA1E84241
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeK99mP2HkeE for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 382968423F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 382968423F
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:43:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2741386466; Wed,  3 Dec 2025 21:43:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Dec 2025 22:40:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0981b4117dcbf323b7d90c6debf0f89685e21a95
X-Git-Newrev: bd1831d161586947141542fdd5a47f10de3e83f2
X-Patchwork-Hint: ignore
Message-Id: <20251203214329.2741386466@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.4.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd1831d161586947141542fdd5a47f10de3e83f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lwn.net/Articles/1049060/
"This is the LAST 5.4.y release.  It is now end-of-life and should not be
 used by anyone, anymore.  As of this point in time, there are 1539
 documented unfixed CVEs for this kernel branch, and that number will
 only increase over time as more CVEs get assigned for kernel bugs."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 4df1c5696a..bca5756926 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -6,7 +6,7 @@ sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
 sha256  eb6b76c269d2dc09791638b10b9dcb9d79fd2abd45113a31fc03f68731caa875  linux-5.10.246.tar.xz
-sha256  b7718766d060e6714bbe47004c71c360e844758f42fbf62cbaa5571119527962  linux-5.4.301.tar.xz
+sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4ab3516d61..79e73dab3f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -458,7 +458,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.301"	if BR2_KERNEL_HEADERS_5_4
+	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
