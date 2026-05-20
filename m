Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53509CD5BA4
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF8DD418A0;
	Wed, 20 May 2026 19:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tE28QM9TpFVE; Wed, 20 May 2026 19:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27436418A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779305636;
	bh=vtxi8p0ragt/MWVyeFd/QdJxb5OexsUCTcfvt6etS8c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qMOFhKTHKfFU2ZJ3NI9kS6RTcuIAyIvnuvu0FCwDYJRj4XAx5s87pJ/Ymhvu5Gl9e
	 Zvczi1kdpx4Zmm7p33ZEDQmp23CLIAC/oG77omSGjOng3X2OBHjmQ1RaPEmKVWQTy2
	 rjdtyyB/G3QDGmj5n4UK3/NkGOoIxMM7lWOxZSLt6L6URK3niXpKCrDaJW8Zoxb/7t
	 5Hrl37oIugaTY8dGmG0qXFuPFWtfFKuJlhTGXU6Pxu8IZwjunoYHF19ksFczxSKVf4
	 js6JBrHeY8xZRp1O/gNwjnUTHD111W3IWV4tRm433rqtIXfQB6M3yB2Gor51+VGtuK
	 nrGrJmhSh1APA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27436418A3;
	Wed, 20 May 2026 19:33:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F6CC357
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00D6240D25
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GssdZm-2q2qB for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19CAB40D1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19CAB40D1A
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:33:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D66E88691A; Wed, 20 May 2026 19:33:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 21:31:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 944f41e9e20554191d87bc9efee238b9237f9efd
X-Git-Newrev: 0d3d25bcc95c4d18f6c123eb4e90b9ac93264504
X-Patchwork-Hint: ignore
Message-Id: <20260520193344.D66E88691A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: security bump version to
 1.0.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d3d25bcc95c4d18f6c123eb4e90b9ac93264504
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libde265/releases/tag/v1.0.19

Fixes CVE-2026-45382 & CVE-2026-45383.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libde265/libde265.hash | 4 ++--
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index d977af5521..0412936d42 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libde265/releases/tag/v1.0.18
-sha256  800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8  libde265-1.0.18.tar.gz
+# From https://github.com/strukturag/libde265/releases/tag/v1.0.19
+sha256  bb19a0b485d2643e0eeb7e91f3ab32d1ad617e7c487dbedc91214ca3dbd8d7eb  libde265-1.0.19.tar.gz
 # Locally computed
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index aab86ab3d7..8c2fa4a3c3 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.18
+LIBDE265_VERSION = 1.0.19
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
