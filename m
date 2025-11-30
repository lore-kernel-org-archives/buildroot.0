Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78166D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 408ED83CD8;
	Fri, 12 Dec 2025 07:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Shr39LFwaoU4; Fri, 12 Dec 2025 07:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF37883C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526223;
	bh=D8d4VGA17qZHsnN8GvO3UVGrtC3jbLrSq3YiZ+jjjnU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m+8dZtbN+KhfpQmBaSIsbI9020xGrs4a4MJ6ySYFj4aU0nJC2Lw/hYbFXDJuAOrf2
	 trVwV6CK/DsgoxY3UUYh3rbOGGCMsd183JXea4jdBgzPc3hB7HipaXP73FdJkqac+6
	 cu3ovWoRaDqzoMTS3DkToffrfRiImjibgb2j+Tqp/HYwPaMR1p2wliNegjn4Z+0DVr
	 35XaN24BYBTLSqiOmR6G9MHfOHMQk4WmEiul22rdHPWsaa6vH4h7qSaOX/rR9ypECT
	 opn5tha/eMvLrjeYY6lgqhAQgtG7fq7jvTao4x0CPgI/lV5lvoYEdQEMGch+cumqve
	 13hNwuUT2Ritw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF37883C26;
	Fri, 12 Dec 2025 07:57:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5923E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A09441158
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_qOCFvQylul for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23A3B41147
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23A3B41147
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22AFA86C94; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Nov 2025 11:33:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 333a6739de3df10084f8413767300485a0179598
X-Git-Newrev: a68840d0ad196e739fe8d2414017d43299d238a4
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.22AFA86C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libupnp: bump to version 1.4.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=a68840d0ad196e739fe8d2414017d43299d238a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://sourceforge.net/projects/pupnp/files/release-1.14.25/

Added upstream sha1 tarball hash, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libupnp/libupnp.hash | 4 +++-
 package/libupnp/libupnp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 86437a7339..d04fbd5b98 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,5 @@
+# From https://sourceforge.net/projects/pupnp/files/release-1.14.25/
+sha1  664b3981f6a54dd3b921af4ab2ecdfb6d1feb626  libupnp-1.14.25.tar.bz2
 # Locally computed:
-sha256  b6423c573b758d09539f5e6c4712c1a9fd35dccf835f81d99473d50a50ad49b0  libupnp-1.14.19.tar.bz2
+sha256  36fdf15767573f4f92320f01b3fd3c1cb41732b91cfc24d10d1e6a55969c9f56  libupnp-1.14.25.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index cd148d14d0..f29275d2b5 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.19
+LIBUPNP_VERSION = 1.14.25
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
-	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
+	https://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 LIBUPNP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
