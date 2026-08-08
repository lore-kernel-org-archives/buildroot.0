Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3125C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 13:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AF7A80E56;
	Sat,  8 Aug 2026 13:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeTJbMXf8tE4; Sat,  8 Aug 2026 13:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DA2D80E5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786197385;
	bh=M0ohogQ2pqmZY65RnI/pU8kF+FxPk7evMYvnEseuK0o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V5YWjpSTRVCmSRnq4XkKPT/Gf2GLEqKdCMoowqslZkwSSPWGpcjL+AclQGqvSC4nU
	 0oLMoaczm36fXkInxLkyWOT2igUQrqCKno4ZKZXJfaHIVUgYJlR7qBq1QB9+L8J6ZB
	 5Oijp2wvLbXYqn8d2+e4FJHSAwDb3T7bg1AlVRz585TJ/0X1n6SvHv6W2RLzwnnBIr
	 s+v8nniwHvk8F4lUXhtCwHE9KZd1l8tKK0a9xO5u4qIPj00qU6TeWQGMrMG3SR68L1
	 lUVAtJ3NWkPKxRtqd2Xw3ZpnIs8hyQn/ldhBDk5SNsnEEamEcubEs814EUQs35AsHJ
	 Fg3naQa+S6MgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DA2D80E5D;
	Sat,  8 Aug 2026 13:56:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6372C282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 494BC60677
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0gUh9JUUBfN for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 13:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A876065E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78A876065E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:56:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FD5388441; Sat,  8 Aug 2026 13:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 15:48:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef655b53dd5c3fa52b133e09b7d5b7ec1aea12e6
X-Git-Newrev: 6fe61bd9650bd2a3474b2d5c04568200ad518a28
X-Patchwork-Hint: ignore
Message-Id: <20260808135536.5FD5388441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: security bump version to
 1.5.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fe61bd9650bd2a3474b2d5c04568200ad518a28
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://blog.clamav.net/2026/08/clamav-154-and-146-security-patch.html

Fixes CVE-2025-8088, CVE-2026-20337, CVE-2026-20338, CVE-2026-20339,
CVE-2026-20345, CVE-2026-20346, CVE-2026-20347 & CVE-2026-20348.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index be5a2ec5c7..2daa66494f 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  89af57a45bbf13de4dc91ed7f20b435388c88428eb7dc30639a02b2f0fc2dad1  clamav-1.5.3.tar.gz
+sha256  1af1117a228f1b5bc7fa91a0dabc37848a99e7d25188e9be8043332ce721dfd3  clamav-1.5.4.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 9467174e93..1777366fef 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.5.3
+CLAMAV_VERSION = 1.5.4
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
