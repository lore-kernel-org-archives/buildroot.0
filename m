Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107F7CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5783855B9;
	Tue,  9 Jun 2026 13:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jm61zkgtbuKg; Tue,  9 Jun 2026 13:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63DB98559D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010089;
	bh=5ExdFle4spDljyDO8Y1vIB8sxlA+sMDV6pa1UBg0J0s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BICQ6Ba7raK1HEspQ8/hVwIJn4KcLICmgg0amUzmZbZ4qRmNGxh9fdeviuOLw0V/8
	 hD+WQ98G5V1WoCkOgL/QKEj+x3wmNZcrfa+nQ4N1MazAls0MA+Q0puI+iSSAmzpBDM
	 O6yH/BS9oz5U5cFzaqYVe2FM4xL9+eSmb/Rz6y76d9OnKhUuAjXwbew8U5A+/qtMwS
	 OgVOBJuCzbrmXTmK5P+5TM521kd0RO2p77dCT4GWJ1qDdv8T0NO5MNi+BRRlbd8ojf
	 cv/fE6eAy3wZkzsLwTygx/LRHl75CCTgEY3Xw7mneZ6ykHfv700hkOvyb8OcvIhelc
	 TI31cniuhMcNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63DB98559D;
	Tue,  9 Jun 2026 13:01:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E251C196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C89556F691
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnCQBn1e9rFG for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DCB86F67E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DCB86F67E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3ADE987E8D; Tue,  9 Jun 2026 13:01:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec210e7c87ef7b631d1dc1438cf9c9547ae1480b
X-Git-Newrev: e07f0eba7eced2d5d382ea4f74e414104ee03119
X-Patchwork-Hint: ignore
Message-Id: <20260609130101.3ADE987E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/restorecond: bump version to 3.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e07f0eba7eced2d5d382ea4f74e414104ee03119
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index dcfbd54617..19c1c36473 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  d57b6ffe7eafd01af58e5efa50f8522eca73c0b3cb2955ca3f33397ba074a1a7  restorecond-3.9.tar.gz
+sha256  a1ae64084d4a9dd550669301cc456873879f49fe77f71ee2fca9f9d3a16646a0  restorecond-3.10.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index e8f432c88d..c0234aadab 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.9
+RESTORECOND_VERSION = 3.10
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
