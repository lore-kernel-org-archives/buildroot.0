Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3791DF9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 077AC84DCB;
	Tue, 14 Apr 2026 17:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdzPBjsdaf0q; Tue, 14 Apr 2026 17:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3080E84DB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776189388;
	bh=rz73W3vSvzK7dnD80engZl0a1L5x6tHx/7zGl477ywk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FkLOcZh+B5Ou4vH2AaXwF68GBzYEl7Mn5xoKZ25BEvNSbvw1PUsUkehVCRzZZ1s0B
	 GBMts6I8eEP285TpBhsnSJnAFVaXTUSOHqUqzjZi6pQN0cyXZBYqyaS+QZn2QbLt9l
	 GyvE2081LD94wmEcQksS4t8nMRw32PE3UxJHRGOb4sOFSTsohaKF1EkVc+UQpwGFfI
	 VBTg/peFfNvVLfQI/jb3pBwXZFE8eCuAX3TEfZCfUGA6uzl+RaBuOzeOghp9HCFMEK
	 cdYVyS6yXGERsgcSsY+p3FfNdZgdzwZpv/6A5Fl872B/EsgNhRk4tsitHTm1i6sb5n
	 qOShhLOT1/Ayg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3080E84DB3;
	Tue, 14 Apr 2026 17:56:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B331283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D37E403E5
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fXwUnW2CuUB for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7901540392
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7901540392
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:56:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F138B7FEBB; Tue, 14 Apr 2026 17:56:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:55:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf1df9a356ce43a9d554391a3903c181aac7e4e0
X-Git-Newrev: cdbe16042abccf7a1089e210b6643517f5fabfe5
X-Patchwork-Hint: ignore
Message-Id: <20260414175624.F138B7FEBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpciaccess: bump version to 0.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cdbe16042abccf7a1089e210b6643517f5fabfe5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.x.org/archives/xorg-announce/2026-March/003674.html

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpciaccess/libpciaccess.hash | 5 +++--
 package/libpciaccess/libpciaccess.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index e50aacc846..eb35208bfd 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-March/003483.html
-sha512  ef27999446e735df2331e94219ee3dafe9198a2472bb452f63ef9c9c446d5431f9e231e224cfabdeba1402974a5a0064546f9abced4d1770f994f5fc0c2b3310  libpciaccess-0.18.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-March/003674.html
+sha256  3c55aa86c82e54a4e3109786f0463530d53b36b6d1cfd14616454f985dd2aa43  libpciaccess-0.19.tar.xz
+sha512  a20ea0ef3d650e2cdc18423ea4770780ce273c35115eece85dbbb59e5f2e24bdbaf88e53b1648f2c5d4fa34b015a3fe8318721bf5655a86a835db323e6ecd4f7  libpciaccess-0.19.tar.xz
 # Hash for license file:
 sha256  f33f360f8905940dac01aa21597fe8a6727ca6f4ffa43b380e2116fd0666aa8a  COPYING
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index cd35b27015..8e72ab1a64 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.18.1
+LIBPCIACCESS_VERSION = 0.19
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.xz
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
