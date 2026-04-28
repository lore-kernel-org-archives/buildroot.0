Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067D3FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A508F40B0C;
	Tue, 28 Apr 2026 18:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFa8dMAhFod2; Tue, 28 Apr 2026 18:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04F6C40B32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401080;
	bh=IScNW/l9ofixRgfe2Ev68ZHxhCTehICPLd7b91qujJM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n3ejuwdJjb12fHffeX74LLo9QCnBsC3fosLXw0q3QdX3Nfy44qUmKBnHkFrdiOa8g
	 Gi2zzcBox/t3Qb8L1uYGILbKqmrYUE+buN/OmWE1GVTsGJlUpFtmnmTdmPoTy+wECY
	 E3z0AFepI655ORaSff/WOyFmHn/hMqCGp9QyRz6oquF7FYPsmLE0N49D56v4W0P9lr
	 PxFbhzLonh+b0JBvOZbfdw+a3HEr2+eN9r4NvrpFrJWl4LEpl4n/k91YrdZQa2SCAT
	 2FgKTdS3vLMflzjdV27AQJYY6eHxXiFBsfc6HebyWZAUYwbFzSfLbhiKWSU1k8GFEd
	 4Hh+BPUQeYqCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F6C40B32;
	Tue, 28 Apr 2026 18:31:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3977A23D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F1A383D9F
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKgVuwovidSA for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E0DE83D9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E0DE83D9D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:31:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24C05838E7; Tue, 28 Apr 2026 18:31:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:21:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3590862c9cc33a5920c05d9db948ff1d1334bce1
X-Git-Newrev: dbca3dab85fec57213e42f71024f87d7702d63f7
X-Patchwork-Hint: ignore
Message-Id: <20260428183114.24C05838E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.24.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbca3dab85fec57213e42f71024f87d7702d63f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.samba.org/samba/history/samba-4.24.1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index d9bb2eac01..a8edb75297 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.0.tar.asc
-sha256  1b1e457fd651a612cd08226cc6efd04e5d01e36d918c8b4c4e470e74e86881ea  samba-4.24.0.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.1.tar.asc
+sha256  217151ca318a5576f8e0de72ba0acdf08157ecf12adac42d1af86db0b09a5f5a  samba-4.24.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e5d73a43ef..295571ccf2 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.0
+SAMBA4_VERSION = 4.24.1
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
