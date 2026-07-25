Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548E4C531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 09:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65F6409F6;
	Sat, 25 Jul 2026 09:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XxIUMG9kZTa; Sat, 25 Jul 2026 09:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C38A409FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784972752;
	bh=NZKFxqLi2U4EOoc9MzIOn1/ZQ3r15h/JwITlYCULugo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jpCZerei922Npsb9yipH8VXjfmiICvKYfSf4n6tyvsCZItPJgMmSaHvdF+k0BgdrM
	 nHqHHkqZvT2v3P/DD9+rdOoK0HRCvyc3r3p7eHaZ6rdTB+CWTdGJXybyA/NrxcEnpy
	 nsi33StyjN/h4Sy7weauAh9wW98uaGmVoDaxq/evQYV3m92NqDiuievL3BLH1xHFAZ
	 jYTZD95O3kCIVTOk5uTwD6LvYo2PYAEJc59S9fOuny0cqgRMyXgPClV5OrntgLuqH4
	 25yPPQ+Bg3KQP7UxPkFlOZPSsoxdj2x9A7hg7ls9BGMOKf3H3xLtNN0tZkpMF30RdZ
	 B1xHjcl5wjmVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C38A409FA;
	Sat, 25 Jul 2026 09:45:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52898977
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42FBE400AB
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSaAW0vzyJtp for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 09:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76B7A4005E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76B7A4005E
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 543A78A393; Sat, 25 Jul 2026 09:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 11:35:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a2f933f8cad336a325f6207e9c9829a883a53a1
X-Git-Newrev: f6ca8d4f5f27232f439bb3e68ace6f7baf20d5cd
X-Patchwork-Hint: ignore
Message-Id: <20260725094510.543A78A393@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libass: security bump version to
 0.17.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6ca8d4f5f27232f439bb3e68ace6f7baf20d5cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libass/libass/releases/tag/0.17.5

Fixes CVE-2026-61626 & CVE-2026-61627.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libass/libass.hash | 3 ++-
 package/libass/libass.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 2f4f718813..467c9b3816 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,4 @@
+# From https://github.com/libass/libass/releases/tag/0.17.5
+sha256  2dca25c0e0c837ddf00b52011b3f82cac1e4ddd3ad018227806b0c2288864acc  libass-0.17.5.tar.xz
 # Locally computed
-sha256  78f1179b838d025e9c26e8fef33f8092f65611444ffa1bfc0cfac6a33511a05a  libass-0.17.4.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index ff42c6d621..3675a75f93 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.17.4
+LIBASS_VERSION = 0.17.5
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
