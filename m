Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8ACE9129D
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 09:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D7D0840E6;
	Thu,  5 Feb 2026 09:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qw8O6PjUM5SH; Thu,  5 Feb 2026 09:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FCF7840FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770283657;
	bh=5QLyj1fqdRyU5A8buMilpQ5hD/MvjntchZKZPrffPXc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NZV737xoFIr4smmUu1K3sob+19SxmpQdj3fGB/hKsyFooEp0Rf1DzDwCUtT8I4qLb
	 qT40hliVceybJdBcqWN8pER17gvboCMapNm8h34JeBjB4/C+3MUjWjyTPHX9GuOvH+
	 ra2a44jksDI7EBotCloj4VLf5zhOvIXElFsmuFc1+inq3mOgHsliphADnpG3dcbBPA
	 Eop9fA2saBoTPwaFQVmlTmz79phsT6WhplWCqHicpEWoUddplmJdhY7QfwtexU6vLG
	 1m878CKu1jNtWbG4ceSXMzHgiVboL4wybkdCr/NmSdbdsltDlUHv6G7q2LzK2JXQxa
	 j4bjMFpxNa+Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FCF7840FB;
	Thu,  5 Feb 2026 09:27:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FF3BF5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64E174043B
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94fQs5H_kpZf for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 09:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84CB940402
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84CB940402
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:27:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 683D2869C8; Thu,  5 Feb 2026 09:27:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 10:25:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a1061d28c418dacdfe57a13050503f59fc3e4f5
X-Git-Newrev: 4ad58f30677ac2c3c61da41dd702d3a15d62a3af
X-Patchwork-Hint: ignore
Message-Id: <20260205092731.683D2869C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-mythtv: bump version to
 21.2.14-Omega
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ad58f30677ac2c3c61da41dd702d3a15d62a3af
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/janbar/pvr.mythtv/blob/21.2.14-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index dcb363a095..a8b6ca79b6 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8cec35fe171a388fa9eab4366d5e1f6fcca869a995bc3ea4e3566a38a2db75c4  kodi-pvr-mythtv-21.2.3-Omega.tar.gz
+sha256  c34a54d06aefef1c4c250ab766c459becc1fdaf42782da75cf749b71585bf6dd  kodi-pvr-mythtv-21.2.14-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index d4c70013cc..78ea3041b7 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.2.3-Omega
+KODI_PVR_MYTHTV_VERSION = 21.2.14-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
