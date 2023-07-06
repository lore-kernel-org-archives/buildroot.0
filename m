Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DE2EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 15:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 597A360FF4;
	Thu,  6 Jul 2023 15:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 597A360FF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ss4YEjN06Dfy; Thu,  6 Jul 2023 15:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9467E60F6E;
	Thu,  6 Jul 2023 15:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9467E60F6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD17B1BF39F
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 15:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 944438224A
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 15:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 944438224A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i73FAxi8q_HC for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 15:36:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A7EB821B2
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 15:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A7EB821B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45EFB86918; Thu,  6 Jul 2023 15:36:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 17:12:34 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 94a381ed47fd536a3b383bd8433d16766c2b3195
X-Git-Newrev: df7c755a55d532e565500a5b1cd855d35c2c1fbc
X-Patchwork-Hint: ignore
Message-Id: <20230706153611.45EFB86918@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/heimdal: Use perl
 module JSON:PP, part of core, instead of JSON package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=df7c755a55d532e565500a5b1cd855d35c2c1fbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
http://autobuild.buildroot.net/results/48b/48b52d205150e30e522b40d1c7b51f339ae8b0db/

This patch ports the existing patch for the samba4 package:
https://git.busybox.net/buildroot/tree/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 770f097ee6f22e48ee4ceba517bd8bb75bc419fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...dule-JSON-PP-part-of-core-instead-of-JSON.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch b/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
new file mode 100644
index 0000000000..7323ac70df
--- /dev/null
+++ b/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
@@ -0,0 +1,57 @@
+From f6fdb0a28e3bfcb3fd0aa1c81ad59c5411c0d660 Mon Sep 17 00:00:00 2001
+From: Andrew Sim <andrewsimz@gmail.com>
+Date: Sat, 10 Jun 2023 09:00:24 +0200
+Subject: [PATCH] Use perl module JSON:PP, part of core, instead of JSON
+ package
+
+This patch removes the need for an external package.
+
+Ported from
+https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
+https://github.com/openwrt/packages/commit/402f4ba4eff65b80a9deaa6085256112bec4d67b#diff-208d4e0345c9d29fbec23d6f655ba794afd3052f5cb8dd73944db72ce81b847b
+
+Upstream: https://github.com/heimdal/heimdal/pull/1176
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cf/make-proto.pl | 4 ++--
+ configure.ac     | 1 -
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/cf/make-proto.pl b/cf/make-proto.pl
+index 36a040ce6..4af21916b 100644
+--- a/cf/make-proto.pl
++++ b/cf/make-proto.pl
+@@ -4,7 +4,7 @@
+ use Getopt::Std;
+ use File::Compare;
+ 
+-use JSON;
++use JSON::PP
+ 
+ my $comment = 0;
+ my $doxygen = 0;
+@@ -70,7 +70,7 @@ if($opt_x) {
+     my $EXP;
+     local $/;
+     open(EXP, '<', $opt_x) || die "open ${opt_x}";
+-    my $obj = JSON->new->utf8->decode(<EXP>);
++    my $obj = JSON::PP->new->utf8->decode(<EXP>);
+     close $EXP;
+ 
+     foreach my $x (keys %$obj) {
+diff --git a/configure.ac b/configure.ac
+index cedb4c01f..cecd030e6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -56,7 +56,6 @@ if ! test -f "$srcdir/lib/asn1/der-protos.h" ||
+     AC_KRB_PROG_PERL
+     AC_KRB_PERL_MOD(Getopt::Std)
+     AC_KRB_PERL_MOD(File::Compare)
+-    AC_KRB_PERL_MOD(JSON)
+ fi
+ 
+ AC_KRB_PROG_YACC
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
