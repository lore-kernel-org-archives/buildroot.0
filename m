Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07DFEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927C74211C;
	Fri, 13 Feb 2026 19:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWPzS7rGknmQ; Fri, 13 Feb 2026 19:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCC9342112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011527;
	bh=iDSGy/BZ5owxLeX5yY+NdBULiWIuW1zXVTJK68jtwRY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SzmzPBt90DjAo6JxNfghOerc7wXm3ZNr+DULryIGhmymtwSkQedYk3J88bZvFritG
	 lokpCdME8O4cqPBDX0idEK1QsVzFyHYwfGThb7IGYmxw2CO9zOBC418TlRpSCmPzoQ
	 +WD0c0E/GBXZP4wNv2tPvzRcuQfBTtuTPT8ssIPKWSmlwtpttkR3kV5K820gLGSIPA
	 crLTCNkE/cmEqAPl9FWTR2+c/5QHfcZL4Tnrc+H+vNnouemVpGBuDULpY/NvmOJbar
	 OiqT7UGYjYM7VXJtLw9roR3vbmxAIu0gxgJAwFPduQ1DcKG39QNxsVzjNhBi1qKu4Q
	 cgW0LKY5pvtYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCC9342112;
	Fri, 13 Feb 2026 19:38:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4265BEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 584E2412C6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkRAKW_a5NKS for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6185841305
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6185841305
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 562E182A80; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:58:53 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 48c6ff60b2bd8286caeb5125ceb47937e936c03c
X-Git-Newrev: dfedd20a8c9c3ee6cbc18d2b7f8bc5ca324e387d
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.562E182A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/safeclib:
 properly format upstream information in patch
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dfedd20a8c9c3ee6cbc18d2b7f8bc5ca324e387d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Patch 0001 has the upstream information, just not properly formatted,
so we fix this.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Thomas: extracted from a bigger patch from Bernd]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c15b507838f7d7315610340fcfd1656a62e02cf2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                           | 1 -
 package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 96603f8ea7..bf416b616a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -918,7 +918,6 @@ package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
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
