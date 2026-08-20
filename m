Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E940C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BE6C811D9;
	Fri, 21 Aug 2026 15:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WokjKH8rH5s; Fri, 21 Aug 2026 15:11:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325073;
	bh=OMVKM0tOuuOvJpUa5K+a5aUwpk6TTmPn/3cpXnySIwE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jYvwMvBK0fA367Urpk7OPlEB3dxz2kC40CWbsZKs6xPocOstMJInIJgacYAxPcFwv
	 WCofsyBk/LZHeDwGfVfFPVVZ4Wd3s8X0p9KZDqhd4+IG0t029QpnBqRXvd16Tj8j8+
	 u2LcRR7nsbaIS+0u4rtj0O2HgH0GMS1Qvv8Nv9MKNiqD7KbqarbxMUjsUzTXif7IeQ
	 GpLqJ2OaVdRI471zz8sq3L8ROEbIRYeS3VfPOkM55uAzOM72FzVmg2XJhQxChCfEmw
	 EAgbiKnC4wP6/msxEy5WvPW7VD+XZlaKQquOkGQWpqJPd8WX0RcF/q0TnGysBH+XJu
	 wKGUNoXg3hs4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E785181134;
	Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06E2E1CF2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED908402A8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2E8wNLt4U3jY for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AAC34004E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFFD58E1D8; Fri, 21 Aug 2026 15:10:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 10:55:56 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 78e2f9a4dd7d02a3e9bdd4ce4d159cf5aa5856f4
X-Git-Newrev: 5327a8ef60f911f0d81ea686ee098b008bb84dbc
X-Patchwork-Hint: ignore
Message-Id: <20260821151015.BFFD58E1D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libgit2: bump
 version to 1.9.3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5327a8ef60f911f0d81ea686ee098b008bb84dbc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.3

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a562b8c3aa8f47976c4eb10dc9723f1dc86e5d56)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index e8c155c994..11eab3001c 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f097c82fc06ece4f40539fb17e9d41baf1a5a2fc26b1b8562d21b89bc355fe6  libgit2-1.9.2.tar.gz
+sha256  d532172d7ab24d2a25944e2434212d63ee85f3650e97b5f7579e7f201a78ad64  libgit2-1.9.3.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 02af500a65..7c95145fce 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.2
+LIBGIT2_VERSION = 1.9.3
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
