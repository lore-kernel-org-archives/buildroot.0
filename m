Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6802ACD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C00C85527;
	Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2QuC2XxHXqT; Tue,  9 Jun 2026 13:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86849855B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010090;
	bh=3gxHZgNTsrXprG1o31NoelhXEG1bP5pgWDkMR6J+rmQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L3zd4acl6CjF9gdFzeyQdZoRMIZF75HYwcA5vir40L2TBTy0PpaYpIWdL4NVjO55f
	 KlwnrBWFIkhCVpuNxBiIs8vdTnIoAdfLkASKPLbKzTVlXqUIlgEiq7gq4bEXpzFn1O
	 XKkKxsshDm7C81JWD7iCE3nvy85La9TGeHVkOAA/CGaz4TdMqQV2REbPoYYYi9V5W9
	 vMI9aDO7lt9snH8Cts+v6fKqzNwiKiC/XiHwoWdrOueiBrn8Ub768OBjhcKGIxwEmN
	 g66Pm8AQZheRB03Rz2pFFiK3lb2z5u3wLBNj7/TawjPqSGUcMPktNAERSgHPsJ/3eF
	 AEy3X8d0jKxLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86849855B2;
	Tue,  9 Jun 2026 13:01:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03527190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E794D40DC4
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRHfxOjWl5Qg for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3562940DA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3562940DA8
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6496887E7E; Tue,  9 Jun 2026 13:01:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e07f0eba7eced2d5d382ea4f74e414104ee03119
X-Git-Newrev: 7e0c02b0912eeea18fb12ce159d3160f6d1169dd
X-Patchwork-Hint: ignore
Message-Id: <20260609130101.6496887E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/selinux-python: bump version to
 3.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e0c02b0912eeea18fb12ce159d3160f6d1169dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/selinux-python/selinux-python.hash | 2 +-
 package/selinux-python/selinux-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 44095dcd74..e976d3f55f 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  dcfa5f1919dcb7e7b775851994eb5c83b7580dc496cd2d1f73867dfa074d2339  selinux-python-3.9.tar.gz
+sha256  9d0a5b69f2fbcce8e5ccd8e0f17d56f71e6005a756386f8fb36c31f9424191a2  selinux-python-3.10.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 27ff12ad06..279592d43d 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.9
+SELINUX_PYTHON_VERSION = 3.10
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
