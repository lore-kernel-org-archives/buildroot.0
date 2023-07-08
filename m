Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111D9EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 19:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8206E40327;
	Sat,  8 Jul 2023 19:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8206E40327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AhBzo8yW9SiC; Sat,  8 Jul 2023 19:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6DFB405A5;
	Sat,  8 Jul 2023 19:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6DFB405A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8DF01BF2B9
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83DB460ACC
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83DB460ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYLiBxKsj_Iy for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 19:42:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BFBE60A9D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BFBE60A9D
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 19:42:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1A53A4C0E88;
 Sat,  8 Jul 2023 21:41:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43470)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIDoU-0005KE-0N;
 Sat, 08 Jul 2023 21:41:50 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 21:41:49 +0200
Message-Id: <20230708194149.3441129-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708194149.3441129-1-bernd@kuhls.net>
References: <20230708194149.3441129-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688845310;
 bh=qyRqvdcAN+eHGmfRU6flR9enrr2wee8e2SLL1DWZ5OU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=igEGmMmMMnWw8KFoiSvk91AZdiFvc2U5FO109EV063PlN2GVMNdC/NX80wZHK6I0R
 xJ9ta0oIfekN80jXvNM4q2AI07CrRNgrPjtAPSDpIX51RILGIny2gmdYnfw42ByNFr
 oZraff14LHUHPOv6RgQrr1yiPltN0LpIO4mzyJqf642xWqdwv6sxnUCoW35QfOBiKy
 MrrkHgXLPaX/I072gnsQcA1iOPTjMcqCTzu2UAq4TQpLDA2BVXvdmOsjkQknXBB6+r
 o3D4DJCRDptLwgbis1S3P6dvZz2EDPkPeydGlvux2t8oXoeG6qvcsqNtECox7W00Eb
 jEcanUQaaQmfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=igEGmMmM
Subject: [Buildroot] [PATCH 6/6] package/perl-uri: bump version to 5.19
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

Removed md5 hash.

Switch to new maintainer repo as indicated by metacpan.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-uri/perl-uri.hash | 3 +--
 package/perl-uri/perl-uri.mk   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index daf043347f..eaf57623b3 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  63675c429cfb1df73d7d21a9302e1000  URI-5.17.tar.gz
-sha256  5f7e42b769cb27499113cfae4b786c37d49e7c7d32dbb469602cd808308568f8  URI-5.17.tar.gz
+sha256  8fed5f819905c8a8e18f4447034322d042c3536b43c13ac1f09ba92e1a50a394  URI-5.19.tar.gz
 
 # computed by scancpan
 sha256  d4f0b7a8771dcb1eee79a38c2e466eb997e23565a6687dd1900a2027eabe12a0  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index d4bfcb44ef..a7fab863a6 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.17
+PERL_URI_VERSION = 5.19
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
-PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SI/SIMBABQUE
 PERL_URI_LICENSE = Artistic or GPL-1.0+
 PERL_URI_LICENSE_FILES = LICENSE
 PERL_URI_DISTNAME = URI
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
