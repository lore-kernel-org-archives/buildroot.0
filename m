Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB4510FC442
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 20:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D886140FB2;
	Wed,  8 Apr 2026 20:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEr1jPls9HVS; Wed,  8 Apr 2026 20:58:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0585D40FD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775681901;
	bh=X0zX3ztCPmdvqdqx/9QjFYC36Kx+BMT3y19npVb9xRM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hzBBAwl6ULSTS43Q2XCmtjhETAU1EKQvoqoRQBqzrl0zwsGgTDKYeAvebfrWSooLA
	 LruLuOaYAKdsBygt7ptQ+8EnqvQ6bg/VO0pEL2q1Cb3Jg1pKpfHqVmEmCGgSPoSxSn
	 w3obbD0NiZEJrFfeeS/CZHKYYgkMBlLTJ9h/9/2mntkv+nccaxAjhRWgJUyPuKCZGE
	 aISjQsauNz0DPWP/YKfCp2C1/q5dOh4dM4B3P2C+MBTHXVd3AVXt3vsTUWhdFeVyUd
	 OAFGc/lK+XWZWSyuQRwWnf9SL0OZ1cEaIZDZ3sB+yfzZcRNtk+qsRYRpOaA+IHc3JC
	 SrEf8O3WuR2ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0585D40FD5;
	Wed,  8 Apr 2026 20:58:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57E0D237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 20:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5530682726
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 20:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uS8bAyeScaf4 for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 20:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72BE48271D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72BE48271D
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 20:58:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0836280DBE; Wed,  8 Apr 2026 20:58:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Apr 2026 22:56:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b172fdc5303c542c4bf2a9a55ff900c2dd9eed9e
X-Git-Newrev: d4b8a42fb253116befe539e5529ac4efd97ab421
X-Patchwork-Hint: ignore
Message-Id: <20260408205819.0836280DBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: security bump version to
 1.0.18
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4b8a42fb253116befe539e5529ac4efd97ab421
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libde265/releases/tag/v1.0.18

https://github.com/strukturag/libde265/releases/tag/v1.0.17
Fixes CVE-2026-33164 & CVE-2026-33165.

Used sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libde265/libde265.hash | 3 ++-
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index efd48d13aa..d977af5521 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,3 +1,4 @@
+# From https://github.com/strukturag/libde265/releases/tag/v1.0.18
+sha256  800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8  libde265-1.0.18.tar.gz
 # Locally computed
-sha256  b92beb6b53c346db9a8fae968d686ab706240099cdd5aff87777362d668b0de7  libde265-1.0.16.tar.gz
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 3d9b96134f..aab86ab3d7 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.16
+LIBDE265_VERSION = 1.0.18
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
