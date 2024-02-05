Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A88FC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 296DB41743;
	Mon,  5 Feb 2024 11:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 296DB41743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1MPwBBUKtVj; Mon,  5 Feb 2024 11:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45D2441760;
	Mon,  5 Feb 2024 11:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D2441760
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D19A1BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6721960FAD
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6721960FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3DAO87ELB8e for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:35:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9944460FA0
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9944460FA0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8882886BEA; Mon,  5 Feb 2024 11:35:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:35:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 081162580f99d1a68133f7f513bf2cd6d1b8b6b6
X-Git-Newrev: 7fd6473a2b8c4ca274bd8a3b53e55d6af5242f9a
X-Patchwork-Hint: ignore
Message-Id: <20240205113531.8882886BEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml-parser-perl: bump to
 version 2.47
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7fd6473a2b8c4ca274bd8a3b53e55d6af5242f9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file 'README' has changed due to the following diff:

-      $p3->parse($foo, ProtocolEncoding => 'ISO-8859-1');
-      close($foo);
+      $p3->parse($fh, ProtocolEncoding => 'ISO-8859-1');
+      close($fh);

This does not affect the licensing terms.

A 'LICENSE' file was added in 2.47, but it contains the terms of the
wrong license (Artistic 2.0), while this package is under Artistic or
GPL-1.0+. This has been reported upstream at
https://github.com/cpan-authors/XML-Parser/pull/99.

Signed-off-by: Kevin Cui <bh@bugs.cc>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxml-parser-perl/libxml-parser-perl.hash | 4 ++--
 package/libxml-parser-perl/libxml-parser-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.hash b/package/libxml-parser-perl/libxml-parser-perl.hash
index c3ef1016e8..4b91386573 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.hash
+++ b/package/libxml-parser-perl/libxml-parser-perl.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d  XML-Parser-2.46.tar.gz
-sha256  6a2e768443ed00f09d3d4bc4dd14451035eac13c6864d68d8e2f76edf5a044f2  README
+sha256  ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8  XML-Parser-2.47.tar.gz
+sha256  3bedfe79fbad08a2b50e1b2b6123e40c68b58b1988d53763b63b6fd295bb0f90  README
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 37cef2e418..06bbd3b1ad 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML_PARSER_PERL_VERSION = 2.46
+LIBXML_PARSER_PERL_VERSION = 2.47
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
