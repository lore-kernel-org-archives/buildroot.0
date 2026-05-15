Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FF0CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 503E384199;
	Fri, 15 May 2026 09:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1F9-8HYZt2fH; Fri, 15 May 2026 09:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E62A83FE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839012;
	bh=C4Li99zhiVpMcPk024YBx9tfyHnoHLj80g/yue85pdc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W4QQJ2S0X8R98u5xceemfQNJl+MK+XDUmpptB5gShcFDIlnUebPnVSxyCxnvIcWva
	 AJ1SQSIiFZm7gAz8yIZdeCANf78oPzWwPrv5X9k0L6Zwm03+UKWxSQU2Edo8wXT9oJ
	 BV2Zu5Y+bJU5REukof++bAVawDqKTMg2z1RbFDSILGIW14rlhWL4Uowc4axxIn68HD
	 KzW9Oumt4k7bM2RGjdW3RiMER2OGUAvRHr57X+JnczGFjB5I+4voV93vHJo1//9XCC
	 O4KBgfQDBvIYu/43mOqInTkd/rBmEZIWv/hWlOhFDMaf0IsutsjppvfbeB6C8VgZi9
	 fZ1eucbbgqG1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E62A83FE7;
	Fri, 15 May 2026 09:56:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A23636E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A407483EF7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfmTQ1JIImPN for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7507A83EB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7507A83EB3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA04F8632D; Fri, 15 May 2026 09:56:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4f92439320ed1da7c6ab1285adbc1e16cf80af8d
X-Git-Newrev: 372f0ea9cefceb2f56a5dfedf612631eea1f47bc
X-Patchwork-Hint: ignore
Message-Id: <20260515095633.DA04F8632D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libatomic_ops: bump
 version to 7.10.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/372f0ea9cefceb2f56a5dfedf612631eea1f47bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/bdwgc/libatomic_ops/blob/v7.10.0/ChangeLog

Switch to tarball provided by upstream which also contains autoconf'ed
files so we can remove autoreconf.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libatomic_ops/libatomic_ops.hash | 2 +-
 package/libatomic_ops/libatomic_ops.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 64de98954d..8089a9b04d 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ea8295ac627646e37fd194d31535bbc02da60b908c8166c5e04d2461a53cb059  libatomic_ops-7.8.4.tar.gz
+sha256  0db3ebff755db170f65e74a64ec4511812e9ee3185c232eeffeacd274190dfb0  libatomic_ops-7.10.0.tar.gz
 sha256  969294c9324b2d360ae2a08edd5ca6f9cd754cb71b71e56bee15d2f10bb10496  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index bbd7f36db8..c68a4b782b 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.8.4
-LIBATOMIC_OPS_SITE = $(call github,bdwgc,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
-LIBATOMIC_OPS_AUTORECONF = YES
+LIBATOMIC_OPS_VERSION = 7.10.0
+LIBATOMIC_OPS_SITE = https://github.com/bdwgc/libatomic_ops/releases/download/v$(LIBATOMIC_OPS_VERSION)
 
 # From doc/LICENSING.txt: "Our intent is to make it easy to use
 # libatomic_ops, in both free and proprietary software.  Hence most
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
