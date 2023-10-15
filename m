Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006DACDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 09:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D729405C5;
	Sun, 15 Oct 2023 09:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D729405C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blpMZH5GZwTF; Sun, 15 Oct 2023 09:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D8A6409E1;
	Sun, 15 Oct 2023 09:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8A6409E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A8CC1BF30B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 737F540333
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737F540333
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8g2kGbC_0bPx for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 09:35:34 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E67C4032F
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 09:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E67C4032F
Received: from fli4l.lan.fli4l (p54a1bf4b.dip0.t-ipconnect.de [84.161.191.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B1E7A4C0C49
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 11:35:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47854)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qrxX2-0004cH-0X
 for buildroot@buildroot.org; Sun, 15 Oct 2023 11:35:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 11:35:32 +0200
Message-Id: <20231015093532.1139778-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697362532;
 bh=QeTYMDlwZ3nTmwqXQZlRGK6IcMMKYcaMi0NburTvF20=;
 h=From:To:Subject:Date:From;
 b=JoD5qOKx6OtjC0mUTYvw7BqTC7xkyxxlHCyENLrPyMhzf0BHsilTIAsW68GJj/ptO
 kwpttyhW9smE1QwN1uCtqYvGW0SDRqxT1axjabOcxjdHXSw806+k+dRAsHo/XoRl0o
 QXYjgGNR9HPBu3v4sEFyj8omDzo2oYGbIilUAxBgDoY51pozFwRM27oX5ocv41RqQ2
 qE0AOkBNs49gRu3217RbIpW4mU1hzaHznvlPcTymLGHe4AgT1O0mqqdjZER1P5YI4U
 rhZH70/1g6hTHeH66J/RWv9oHCc4sQf3LMccI7Er4thUQzPEywsvvmwKy3228nhxQt
 8A9rH0UpQvmpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=JoD5qOKx
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.19.1
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

Removed patch 0004, not needed anymore due to upstream commit
https://github.com/samba-team/samba/commit/a25f549e9a03010996300b04271a7909b6fbf756#diff-6e2c3d973b3ce82db7b4f67111e36116517b040ed64c28f40114d2e0d535706a

Release notes:
https://www.samba.org/samba/history/samba-4.19.0.html
https://www.samba.org/samba/history/samba-4.19.1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Use-perl-module-JSON-part-of-core-i.patch | 41 -------------------
 package/samba4/samba4.hash                    |  4 +-
 package/samba4/samba4.mk                      |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
