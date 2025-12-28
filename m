Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58270E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72AC1405C3;
	Sun, 28 Dec 2025 21:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UMCXVnALrAn; Sun, 28 Dec 2025 21:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705C2405F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766955626;
	bh=pMC9qvg85iTNn+QYUcfo+/DJHt1Huczz5jkaRnrRQQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qVugyhXn7iUbnqdaiVOEdK2iZkg7OEoutGd7Fg8iL9+PblFeMI5ZQ7m7iK97m3wMb
	 KiFZWVOLGJyWHS25PeyWAMLmUkyUCXl37cnHoDv29YXAnWJ9/0fj1Il+MaWbMK7myW
	 W/f4z2DW/IUs4BpXDLY/NjJtHE42l2GhaNphGlHD6g09/+opRcz/3sG03lFR0Sxcak
	 P6F8VFj0K/zmdrKNPaaPJbMLzp3DOv28Wl3GLgjmAd97xIvjI/xr+RgKz9BxnaJ2BD
	 kgJ6h6Lfv2Ig9wptMU7xlLGwbaCYKIs9J3ARIJmnGAH9Hd1heUbnG9tg+ERaJrpXJq
	 IpqSCmsgugrFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705C2405F1;
	Sun, 28 Dec 2025 21:00:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11AE3D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC91D405F1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQAsf-bEyOp9 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D88405C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42D88405C3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24987879C6; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:00:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bca4631208089263d0ff2aa6377436ec1a387240
X-Git-Newrev: 77d1dcd2eaa75386f8f044d213877543e46c72be
X-Patchwork-Hint: ignore
Message-Id: <20251228210024.24987879C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpp-httplib: remove stale
 IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=77d1dcd2eaa75386f8f044d213877543e46c72be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit [1] removed the stale cpp-httplib patched but the
IGNORE_CVES entry wasn't removed.

[1] 8988278241 package/cpp-httplib: remove stale patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cpp-httplib/cpp-httplib.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 62255180f4..ed5c33d2a5 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -13,9 +13,6 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dtest=false
 
-# 0001-merge-commit-from-fork.patch
-CPP_HTTPLIB_IGNORE_CVES += CVE-2025-46728
-
 ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
 CPP_HTTPLIB_CONF_OPTS += -Dcompile=true
 CPP_HTTPLIB_DEPENDENCIES += host-python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
