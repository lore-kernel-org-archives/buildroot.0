Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153F1D29DE7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1F6783BF2;
	Tue, 13 Jan 2026 19:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cyvWj1SKF15; Tue, 13 Jan 2026 19:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C80C83BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333029;
	bh=xKr6dtfXYk0P1h4uUhJf1aOi+BWRr/iVEpJd9hdPoKw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HYkdGtn+F86vf/GbKUAlNXTM644K+HaiLRJGmp7A4tRGHp7rtxq+9GC67HAYcxVWJ
	 gUKiW7AdpKdlExg2HuSZdymLaY3ZnLby7Wwoo19Ytk/eQf7ERK7t0WA+H7JjtuSLka
	 Ea0tjPMN225ymX10Ih+T5N0KFJ9WfR+g/vc57m0d00KMJ32S5kDJ0O179GGwCGJF+0
	 IFCUoWXpw5QN/BzflA6kdpU8E/atBgReoUlqM3SiB7hoO9Gejk0rNgPj0YpEA12EoT
	 DsmteiQwgpt47CF+bdU+AQaJv5wqJzJYZtWp8FenQNr6YKbJoWou54f32YvS/67CSi
	 ulQEy5lThVarQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C80C83BC0;
	Tue, 13 Jan 2026 19:37:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B6BE2CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0C6B4037A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYCE70hza1O8 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 398054053F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 398054053F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38C30873D9; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:53:43 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 49c9f10bac10cc153e29d932d2e9a4b5eeb90d2f
X-Git-Newrev: 611e3fe80d691ab2da9927af4a367144169f9b1c
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.38C30873D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/atf: update
 project URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=611e3fe80d691ab2da9927af4a367144169f9b1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The old URL redirects to the new URL.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9d334c4abf4dadfab73d6bc7cdc171bca1ad5dcc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/atf/Config.in | 2 +-
 package/atf/atf.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atf/Config.in b/package/atf/Config.in
index 43a5d4f2c9..800b488945 100644
--- a/package/atf/Config.in
+++ b/package/atf/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_ATF
 	  ATF, or Automated Testing Framework, is a collection of
 	  libraries to write test programs in C, C++ and POSIX shell.
 
-	  https://github.com/jmmv/atf
+	  https://github.com/freebsd/atf
 
 comment "atf needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index 9630cf1a33..5c294bd1aa 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATF_VERSION = 0.21
-ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
+ATF_SITE = https://github.com/freebsd/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
 ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
 ATF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
