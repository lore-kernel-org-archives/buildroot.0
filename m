Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D03DCD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA67606B0;
	Mon, 18 May 2026 18:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Dwo3pdYgQms; Mon, 18 May 2026 18:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C2DD605EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779128334;
	bh=FoJUn0fUSO6SE9OCKarE6hl4pcNU13LfndNs/lUv5wg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DNZMgprgHaEJiiIUBLfQvMvVNAgZI4zJk5zHRnvM36qWgPkbsUVnrmWLhoq3kGo+s
	 GFf2AjN49b9VGf3pTDwoAVaRVwSaXxGfWLRowQZ22hPVzHLyBqQSaO+pJttOP9hLXG
	 cAP8h4KON5o0Fyt5nGLvH4QD0c8yW/EeDtFm42t0iMdmIaB3VKDtrubRfQR7ngEoEJ
	 IGu3Fe1tR8wTjVwyXIgevWyyFYDJkUmlGAOAaEzeXmSN2kOjZVGp2jrxKcwgjX+HDi
	 F9b0oocBHVvaFvn7vi7FKsVFEtxOljP6IAZSbALeWK3Rcj+TCfIzzVJQyE029ytb0Q
	 6IQjzIG5aGlEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C2DD605EF;
	Mon, 18 May 2026 18:18:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99D521B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8890E605EF
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtFz5ohuVBHe for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3B8F605EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3B8F605EE
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:18:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EEFD8667D; Mon, 18 May 2026 18:18:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 20:17:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa7583c86b671e45ad45a27a4f904b4fb08e1ff1
X-Git-Newrev: 721a44f935d80bb3daaa8240ffc6c3f5a01107c1
X-Patchwork-Hint: ignore
Message-Id: <20260518181844.7EEFD8667D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zic: bump to 2026b
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/721a44f935d80bb3daaa8240ffc6c3f5a01107c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 7fe7582f10..75242a306f 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
-sha512  d14bc0680b9cb33d6526a2c0e483f2abafc2593cfe5fbfe7dcab940aafdc1baaec065dbaa1bb58b03586a8631ffdf43ebb22ff5a70503298b6ea2cf061d82c16  tzcode2025c.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
+sha512  55b44d52a83c9db151be32c3d78376ea7f9d4311ef15ed6fe34b855b08fc546531e51309d178d9c175a6d5d7d0b058440e45a55d200ca8925e3798dac9bc739f  tzcode2026b.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 06d8ebaf15..43e74e64c8 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2025c
+ZIC_VERSION = 2026b
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
