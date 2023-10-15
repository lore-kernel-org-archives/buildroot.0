Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2A7CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8497414D6;
	Sun, 15 Oct 2023 20:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8497414D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UcLJ1ykR7s4; Sun, 15 Oct 2023 20:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EB52414CE;
	Sun, 15 Oct 2023 20:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EB52414CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE95D1BF28F
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D598940361
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D598940361
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9ZLQjn0BTmF for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:05:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA46A40360
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA46A40360
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DE7A8578B; Sun, 15 Oct 2023 20:05:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:04:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cebff375c230386adef9ccbba5074042d0d0da7d
X-Git-Newrev: a8ff60cff9402dcd04fffb67af15dfe2caab0995
X-Patchwork-Hint: ignore
Message-Id: <20231015200531.8DE7A8578B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.19.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8ff60cff9402dcd04fffb67af15dfe2caab0995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0004, not needed anymore due to upstream commit
https://github.com/samba-team/samba/commit/a25f549e9a03010996300b04271a7909b6fbf756#diff-6e2c3d973b3ce82db7b4f67111e36116517b040ed64c28f40114d2e0d535706a

Release notes:
https://www.samba.org/samba/history/samba-4.19.0.html
https://www.samba.org/samba/history/samba-4.19.1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...indal-Use-perl-module-JSON-part-of-core-i.patch | 41 ----------------------
 package/samba4/samba4.hash                         |  4 +--
 package/samba4/samba4.mk                           |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch b/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
deleted file mode 100644
index aa55c09891..0000000000
--- a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From bd8fc19c8383914b518a9d56f4c08fba3baeb967 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 7 May 2023 11:02:26 +0200
-Subject: [PATCH] 3rdparty/heimdal: Use perl module JSON:PP, part of core, instead
- of JSON package
-
-Downloaded from
-https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/heimdal/heimdal/pull/1176
----
- third_party/heimdal/cf/make-proto.pl | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/third_party/heimdal/cf/make-proto.pl b/third_party/heimdal/cf/make-proto.pl
-index 36a040ce6c0..ad21dbad9e1 100644
---- a/third_party/heimdal/cf/make-proto.pl
-+++ b/third_party/heimdal/cf/make-proto.pl
-@@ -4,7 +4,7 @@
- use Getopt::Std;
- use File::Compare;
- 
--use JSON;
-+use JSON::PP;
- 
- my $comment = 0;
- my $doxygen = 0;
-@@ -70,7 +70,7 @@ if($opt_x) {
-     my $EXP;
-     local $/;
-     open(EXP, '<', $opt_x) || die "open ${opt_x}";
--    my $obj = JSON->new->utf8->decode(<EXP>);
-+    my $obj = JSON::PP->new->utf8->decode(<EXP>);
-     close $EXP;
- 
-     foreach my $x (keys %$obj) {
--- 
-2.25.1
-
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 9843d419f0..5e65295e4c 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.18.8.tar.asc
-sha256  4fb87bceaeb01d832a59046c197a044b7e8e8000581548b5d577a6cda03344d1  samba-4.18.8.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.19.1.tar.asc
+sha256  ce3b7f0d18bf91aa5fd646e8bb385a3b35375b703c6e5123b02b85a1abc81879  samba-4.19.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9cf7a59d9b..124ce564d2 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.18.8
+SAMBA4_VERSION = 4.19.1
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
