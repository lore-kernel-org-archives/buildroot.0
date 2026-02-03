Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BAAE87820
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 12:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA50360830;
	Tue,  3 Feb 2026 12:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojmNx6rNTI4G; Tue,  3 Feb 2026 12:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5AA76086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770121457;
	bh=OzNeEX+pBx1MElGtE2JUz0JaLCIfq2TygEbUqTfLusE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pf8eFLoMC/yNp5l0F69rbbOaG/kbk+nOQNgCFJe0gsH1cHLDvegs6Fa/kJQ/wub/0
	 T/pvn0XUGlEYeTy9k7127V/7649zqKujw1levk2eQ38oEEeUfvwmHN0RRFrpdLfhdT
	 OBlEqy7M0TlhjgYvJYBlMZ3ynrgCt0KXIJe3pr1WhTVRxD9B1/my1+1u6Smc0QV+jS
	 V6awh8KDP3oxDDhP2gxnn9AbRjgZxGE2KevZDLPVwGMIbvWp6QHRZLBo3CmMj1TqDg
	 o9zqrweWPuxsSEbcSMCWvqwAzmf0dTmTLpHRBR7wrearBohKBVVOkCW+bB/zcMULJd
	 i5Xc7exEucsAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5AA76086F;
	Tue,  3 Feb 2026 12:24:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFE58F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0F5F40464
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VM-_i4Zww3Kx for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 12:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E034043F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8E034043F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B2B086656; Tue,  3 Feb 2026 12:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 12:39:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34ed3bbf0a5f2576043ff627c76df584ea936a71
X-Git-Newrev: c15b507838f7d7315610340fcfd1656a62e02cf2
X-Patchwork-Hint: ignore
Message-Id: <20260203122414.9B2B086656@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/safeclib: properly format upstream
 information in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=c15b507838f7d7315610340fcfd1656a62e02cf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001 has the upstream information, just not properly formatted,
so we fix this.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Thomas: extracted from a bigger patch from Bernd]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                           | 1 -
 package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1e4e081e83..0bf57b8ac2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -866,7 +866,6 @@ package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
 package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
-package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch lib_patch.Upstream
 package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
 package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
 package/samba4/S91smb Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch b/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
index 3cb37b96f5..75f4c2bf90 100644
--- a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
+++ b/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
@@ -7,8 +7,7 @@ some armv7 buildroot variants fail on asm.
 we already probe for that, so use it.
 Fixes GH #115
 
-[Retrieved from:
-https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c]
+Upstream: https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  tests/perf_private.h | 49 +++++++++++++++++++++++++-------------------
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
