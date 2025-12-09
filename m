Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BC1D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35C7C8162E;
	Fri, 12 Dec 2025 07:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiwVZQRrme60; Fri, 12 Dec 2025 07:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E811383F39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526346;
	bh=I2ORiJVtqrrsMKmrl9aQ5TIdFNepqMIHHUjfKPeWNMU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oMqHVH3yC01VpirFDtC18BgNzsJXVrZWKxu33Bf+6h6SvZbTdNxajF/zGgWpltWdC
	 Bp8RmlkewgTW01wB0fBp1VH0Hp+qnvimooop+86tzEZToKvHvbI98B6IDXIxPTmDJ2
	 4EdUFtrPW9moSN3/0u7tqtd0zBaqXchgpXYON89v1VPxSlV66Ibmc6eJr1bI+tpFWn
	 TkPzFaJf762HxJAxaLCCy+HEKCec0fzRFejIVoinXPKC6uIzJsNKyoqdYxNtzoqZBP
	 Dj1xeyv2y2oEVKM1jdTdBh12UWoz+DZuD5mA5oNrla9txpmavk0XI6Le7q4U7qLh+y
	 Xnzgmdh+/XISQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E811383F39;
	Fri, 12 Dec 2025 07:59:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C94F7E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 037F24118F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfHKiX1Zasvr for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121FA41199
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 121FA41199
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1157885C4C; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db72d16ca1d781f7237dfb0fe6cacd52aeeda6b4
X-Git-Newrev: b6565f494eda8edcf6dd9d38b857fafd35de2384
X-Patchwork-Hint: ignore
Message-Id: <20251212075539.1157885C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ubus: bump version to git 3cc98db1a
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6565f494eda8edcf6dd9d38b857fafd35de2384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://git.openwrt.org/?p=project/ubus.git;a=shortlog;h=3cc98db1a422dcf560f2d6347fd410f17565a89d

This bump includes a patch which adds cmake4 compatibility.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ubus/ubus.hash | 2 +-
 package/ubus/ubus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index e35f37b03d..3d8206b974 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ba7602c660cb2c15c0e04942414e4cf3d96622622406c5fc3b88895694aebb9f  ubus-afa57cce0aff82f4a7a0e509d4387ebc23dd3be7-git4.tar.gz
+sha256  f625bda868133e28749b9eed64f9c3a838c75594e46a6a536e7e3582fe4da8e3  ubus-3cc98db1a422dcf560f2d6347fd410f17565a89d-git4.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index 913c0e3e39..c0f0264065 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBUS_VERSION = afa57cce0aff82f4a7a0e509d4387ebc23dd3be7
+UBUS_VERSION = 3cc98db1a422dcf560f2d6347fd410f17565a89d
 UBUS_SITE = https://git.openwrt.org/project/ubus.git
 UBUS_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
