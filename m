Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F624E8B363
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C711840AD4;
	Tue,  3 Feb 2026 21:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkzRIyM33bFm; Tue,  3 Feb 2026 21:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB58D40BB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770152973;
	bh=4bvpaIuTKLlBxPkaW+G0nI4GNL7q3sYixYYGDXeYObQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=elaY4BI9sWwCiEozpoM7JYRmM99QZ1FlN9l8tz4Z3LvNl9rL5ngvJC8/nzSGyk8St
	 kwhVHw8EgrWuuVX4u1VeItFgls94C2DZDpZ4MW6MKh6F7+PgHKz4L9G4rjYXVdyvqA
	 yWREv/iLRzfg2gsQ3mtE6m8pEcFvbRE8s4eIRU4VOg0c87MhGj/P6OFSSTFiUKN7rq
	 R6RZyp5970QoLCwd6vuSOBGwbcmD6xt+omqDbRia5F8sEHpHNP0Ee1O8fY1x2U/Ft8
	 fNyKrmAijV1rhFEZLIxmdZoxe4nS+LEhUdXgcIdLFLFRdJaZTKNVsNcot0Gl8n5mCd
	 aqxMjJwp9e/EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB58D40BB9;
	Tue,  3 Feb 2026 21:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70565F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AA78404A0
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8q47Qx-cEff for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC0840185
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DC0840185
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:09:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A51A8671F; Tue,  3 Feb 2026 21:09:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 21:42:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd81c1766e1470b61f5e8d4461a066f64ce60c5e
X-Git-Newrev: 6d5f9b835a5beab2179e824fc28f68990a282c6b
X-Patchwork-Hint: ignore
Message-Id: <20260203210930.1A51A8671F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git: bump to 2.53.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d5f9b835a5beab2179e824fc28f68990a282c6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog
https://gitlab.com/git-scm/git/-/blob/HEAD/Documentation/RelNotes/2.53.0.adoc

Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 3dcd1d4437..c22ee800cb 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  3cd8fee86f69a949cb610fee8cd9264e6873d07fa58411f6060b3d62729ed7c5  git-2.52.0.tar.xz
+sha256  5818bd7d80b061bbbdfec8a433d609dc8818a05991f731ffc4a561e2ca18c653  git-2.53.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index bd1c1eeb61..d3625ddf08 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.52.0
+GIT_VERSION = 2.53.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
