Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F69D185D6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2F160DF4;
	Thu,  8 Jan 2026 11:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qT9YMZ1h_bzF; Thu,  8 Jan 2026 11:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8965060DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870031;
	bh=zZkJ6Yu1V4twvM2a19eL+RyQGvQqDgoZLBFSRDJUCKg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oQ3Er8lcubnJPBYflwUqZnJ1raJuHhAdW8XfrHciFkp9Uat8lAhz4mLJvSxZi77Ua
	 QOyJtlxSTTgk93x/mmqIIPZwG0SNG/cEKR6u/1XXep8YISxdD5kyvTcknaO6HmvrHF
	 JVhQqwB9Lb45whUNT9IbozUCiPkl1ysOWO/li8OOacbqzeOK4NlEAGN6Q/3kUR4tA5
	 8P/fcX5juREn6/NHBZv8BG93xeeofPZ/4h3aDwTV4wS5s/LzUEIQ3eaI67m8elnWzf
	 yW8saJvUltHVEDSWU6oxVtwr2+rUo7PZyIZX4RgO/Zp9/2g+kk5Cg1nVvCiKZoGw6B
	 aGg9VBULBiPfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8965060DE1;
	Thu,  8 Jan 2026 11:00:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A31A2237
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9550A60A98
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DEVTuYZdiOM for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE668608AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE668608AA
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DA9288443; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:28:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93d3d86c641372d3ef57928497c5587292cab36b
X-Git-Newrev: e938e5476554aa7fd60c6feb0df415e6be9a329b
X-Patchwork-Hint: ignore
Message-Id: <20260108110023.9DA9288443@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-module-build-tiny: bump to
 version 0.052
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e938e5476554aa7fd60c6feb0df415e6be9a329b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-module-build-tiny/perl-module-build-tiny.hash | 4 ++--
 package/perl-module-build-tiny/perl-module-build-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.hash b/package/perl-module-build-tiny/perl-module-build-tiny.hash
index 6b467c3ec1..9f173d3f12 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.hash
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  15b4434617b61e70315c0838c020a48e  Module-Build-Tiny-0.051.tar.gz
-sha256  74fdce35e8cd4d787bc2d4fc1d43a291b7bbced4e94dc5fc592bd81ca93a98e9  Module-Build-Tiny-0.051.tar.gz
+md5  91e56a426d82dbf33761984e26ed8acb  Module-Build-Tiny-0.052.tar.gz
+sha256  bd10452c9f24d4b4fe594126e3ad231bab6cebf16acda40a4e8dc784907eb87f  Module-Build-Tiny-0.052.tar.gz
 
 # computed by scancpan
 sha256  1ce3282467869416f29b0c5f7773d1b80181fb9e08bef64e3829e8c53e19b64e  LICENSE
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index ca2fddeeb6..cbb2dfc54b 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_TINY_VERSION = 0.051
+PERL_MODULE_BUILD_TINY_VERSION = 0.052
 PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
 PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
