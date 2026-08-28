Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D69FC61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 12:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E330C80AE3;
	Fri, 28 Aug 2026 12:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqLlQn6R1FI0; Fri, 28 Aug 2026 12:12:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787919176;
	bh=NvMhceYNqP4GYRd4qGAVgDNDZA/PTuNt/DYR4H3Qazo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nu5k1tGxwkzvhYpiEGEt1RAyUt0TVZyYv5hcIDQz5W6o/0nyPlEU6d1j0JNSyMbS9
	 U1dixcHWbJHGChxnNMR+xXxTwYCktpRRpsFH4hX9EKhvbEJdrLvSqlpG3FesH28EiR
	 RSkH/Cn4Z1UhUyrHqUea9W/cgcZgIj8WOhEQQfJfSKSSALVdYSHTygQBF3fANxGgwW
	 pk0+tApzViAyQh/Nrzgri04G8aU0rif8UsGocO9xFURldmggF/T6FmeGPhn1ZdCdQB
	 GNhpHijr5dYMT+x3I8XU3DTXOdbdib3Hkssv+aHI5jMJllKu456Dtz+yoVS7x4jzc4
	 u/S77SgKWVGZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2425380CA3;
	Fri, 28 Aug 2026 12:12:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B42D5355
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 12:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A835400A6
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 12:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEtNyI23-rZR for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 12:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5C684005A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 12:12:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA5EA921E8; Fri, 28 Aug 2026 12:11:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 14:03:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7e6e19e97bda5fd399df9bb6d393a523b32ea2e3
X-Git-Newrev: f48ae8880554fbd433b27dd3c585ad9585eddbfb
X-Patchwork-Hint: ignore
Message-Id: <20260828121156.CA5EA921E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/broot: bump to version
 1.59.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f48ae8880554fbd433b27dd3c585ad9585eddbfb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Changelog: https://github.com/Canop/broot/blob/v1.59.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 176c663d62..a6d767c769 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  cad8fb5e23b422aef80ea14797de7c709c97a5d2bb8019cddaea87811b17a652  broot-1.58.0-cargo6.tar.gz
+sha256  5a0ac9419b66b7a7763c4ec0e53394b38e87b2cc11958aa6d352e6b4c74020a0  broot-1.59.0-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 91b35abd6b..2f1648fb6f 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.58.0
+BROOT_VERSION = 1.59.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
