Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55654E87838
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2514B60828;
	Tue,  3 Feb 2026 14:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nr9nmjvPxRXE; Tue,  3 Feb 2026 14:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B4B960830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770128435;
	bh=VY4rUea/3Rjyf0iObOywJfMsoRSpXzSIA+wbMv07FHU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hkRE6Nv9XUuJzFhd+oM9Gmdf1wK3MriUjSO24lB5R4NM1p2TAOeh0aeXsPKvrWJik
	 lTVfuSwBmBYbWxsZ3hR0KlkmX4PBoMiGZgCjRy7J2VOppHDJTHozpi5XOEMmab6WwN
	 HwI5VXn/yy6L2G5pYJe7/st27CalUqJwza79qFyJ6UiMRbREvmBp8DmjbFgADgdCru
	 C3Xn7EAh5DTA6HDNX+/Xj0FyPJYgGasFJETotxzVN3B917LaGevt/nnPBcJo0MuoEw
	 92i/DV11DZYTMQZjOWpUU1GU7kcQqsOGSlX44Lwlf+5mOKtotlwmI8iy+GT4LTJ9QI
	 CsVTq9hqHqVXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B4B960830;
	Tue,  3 Feb 2026 14:20:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9321FF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75E8860830
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjhjWo_HFvmS for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD3160828
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CD3160828
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F197866C0; Tue,  3 Feb 2026 14:20:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 15:18:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d30457efd045f011458766095eb7bd0c329a202b
X-Git-Newrev: 9171d2982b72f93b973bce6887bd87a91f5c3e1a
X-Patchwork-Hint: ignore
Message-Id: <20260203142032.7F197866C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitcoin: drop dependencies on
 Boost Libraries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9171d2982b72f93b973bce6887bd87a91f5c3e1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependencies on Boost.System, Boost.Filesystem were removed in
v23.0 [0][1] and Boost.Thread in v21.99 [2].

This was never reflected in the Buildroot package so do it now.

[0] https://github.com/bitcoin/bitcoin/commit/07269321f38e46e9e02f16d7cd135ea90692638d
[1] https://github.com/bitcoin/bitcoin/commit/b87f9c5edf3895df9650131fcf8551c3ad1d7301
[2] https://github.com/bitcoin/bitcoin/commit/06e1d7d81d5a56d136c6fc88f09a2b0654a164f9

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bitcoin/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index eedb0897a5..66c8ebbfda 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -21,9 +21,6 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_USE_WCHAR
 	select BR2_HOST_CMAKE_AT_LEAST_3_22
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  Bitcoin Core is an open source project which maintains and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
