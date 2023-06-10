Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A04C7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 07:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CF90841D9;
	Sat, 10 Jun 2023 07:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CF90841D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwunHpw4my7T; Sat, 10 Jun 2023 07:06:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5BF84190;
	Sat, 10 Jun 2023 07:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5BF84190
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A787D1BF841
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 07:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78A3641BC0
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 07:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78A3641BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMF0TsJcHPTm for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 07:06:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BABD041BA8
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BABD041BA8
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 07:06:34 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout05.t-online.de (Postfix) with SMTP id C0B6410535
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 09:06:31 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd74.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7sg9-4fxWPx0; Sat, 10 Jun 2023 09:06:29 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:49096)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7sg8-0002E6-3B
 for buildroot@buildroot.org; Sat, 10 Jun 2023 09:06:29 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 09:06:28 +0200
Message-Id: <20230610070628.228669-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686380789-327FBCD8-CE4559CE/0/0 CLEAN NORMAL
X-TOI-MSGID: 31c7908c-aa00-4e01-8d1c-cef6d0a26e69
Subject: [Buildroot] [PATCH 1/1] package/heimdal: Use perl module JSON,
 part of core, instead of JSON:PP package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/48b/48b52d205150e30e522b40d1c7b51f339ae8b0db/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...JSON-part-of-core-instead-of-JSON-PP.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/heimdal/0001-Use-perl-module-JSON-part-of-core-instead-of-JSON-PP.patch

diff --git a/package/heimdal/0001-Use-perl-module-JSON-part-of-core-instead-of-JSON-PP.patch b/package/heimdal/0001-Use-perl-module-JSON-part-of-core-instead-of-JSON-PP.patch
new file mode 100644
index 0000000000..a7d8777a78
--- /dev/null
+++ b/package/heimdal/0001-Use-perl-module-JSON-part-of-core-instead-of-JSON-PP.patch
@@ -0,0 +1,54 @@
+From f77b0d16ace70d93c018241e25826611f3124604 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 10 Jun 2023 09:00:24 +0200
+Subject: [PATCH] Use perl module JSON, part of core, instead of
+ JSON:PP package
+
+Ported from
+https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
+
+Upstream: Not applicable
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
+index b946dfff4..c08cb24dc 100644
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
