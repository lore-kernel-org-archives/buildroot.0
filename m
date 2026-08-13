Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D9DC5DF6A
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF6256082D;
	Fri, 14 Aug 2026 13:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mBLhtxJ0oDI; Fri, 14 Aug 2026 13:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9B0060DFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713706;
	bh=D1Ubhc/MnMmvtM/vFeyb3uoSnATkrPmLa93QlOout80=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LniBy1IvKltcUOP8yXx1Pxv2FwJdSxTy4vXQDXyWU4P+TeFTNoytfY08i4zxlGJii
	 kMEIoI0vlv1fW2T08r3trxdBRBVVBo+U4wAlVfmpN+Pi8FYqEyV9p4EfLLFa3xTTFJ
	 n4XLv1fzjE2B9jDvVo5CxbF4m0E7DzTd8lVlGoEf+azU+sYHYKe56mz9a640es1ZmO
	 38DFrjHUJglMWpR4B/sLcin77cVGF5aY8RLrSz2QHCIrVwgPEKYzJ4UDmfxKbhtHA2
	 oGmixQ1HCoOd+YpsvZ/KdUw1Qldy/7QVlTC5nwNzuZjGjGv4NJbs3ql6dkRAm+SL7I
	 MyBXMao6e+wAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9B0060DFE;
	Fri, 14 Aug 2026 13:21:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C159E139C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B316460689
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxnBoLnzMIaG for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4754160633
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4754160633
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EFD98D66C; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: f60e785b4c5e9ab2ccad792cba75fd9341dabb33
X-Git-Newrev: ac7852ed489824251293d4eb3916b517389d403a
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.3EFD98D66C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/{glibc,
 localedef}: security bump to 2.43-49-g8017bcfc4d
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac7852ed489824251293d4eb3916b517389d403a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

This fixes the following vulnerability:
- CVE-2026-6368

(alternative to commit a4d4c7527a28cd2efdb178735b90037c319818d9)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 97862aef14..d9aaceea30 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  647325cc2e9f2c6260f3c48d0385ac5e30cb60d2ec2e5afd649555c518c9bf60  glibc-2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674-git4.tar.gz
+sha256  6c6ec86c66f0484c6916e849e20433ebc67869649c72a772cdf1bb6ca408d516  glibc-2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 797df314e9..375429cfd4 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
+GLIBC_VERSION = 2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 8eff7f136d..6d82759a1f 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
+LOCALEDEF_VERSION = 2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
