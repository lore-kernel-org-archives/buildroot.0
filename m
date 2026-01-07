Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FAAD185D7
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75CDA60E24;
	Thu,  8 Jan 2026 11:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJzBgVbKYu8l; Thu,  8 Jan 2026 11:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D50960E26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870042;
	bh=1KacDArEDWH5XNQTEeCVDFe6BpMzRmcLsT/sbX59ggU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y2sb/xmXWDoA8s6bwe+Bo3Rfq2XRuFjl77B3Bklt6jP1tmAn6ly2k40lnN83l7jhK
	 zYXZoXcQldwlizW8458RMAgoSKWvEcCz/G3FKrXpsvQOJAv5BBKZGPJv8N16hCI2g+
	 kj6BWpIUV2fLyv5SjSV85VxRP6dgdrMRXbxo/6xXDX3NvfopCP93REIXNtPOsxe5O1
	 /Phkblx5fMWOBBKUDeqNkfjRzQIRgvlEvZRKz2Uy6XH0dpVqtBsJBPV8F3D6jwNDVN
	 sW4W1nIH6HYg7DSBJUMOHUbFOaivFlnG4HS/N3FWL6YvTk2koA2t5td2psw4/yFKAi
	 c3ePHT4rwtZqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D50960E26;
	Thu,  8 Jan 2026 11:00:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4520D436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD92F408A5
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGdc9YojUCQJ for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4570940B8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4570940B8E
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 439408834B; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:34:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab52feec52ecac3e085518981f54703b1a8799af
X-Git-Newrev: 9659afcd7956f7eca87219c89ae43fcb57ee8761
X-Patchwork-Hint: ignore
Message-Id: <20260108110024.439408834B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-net-http: bump to version 6.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=9659afcd7956f7eca87219c89ae43fcb57ee8761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/OALDERS/Net-HTTP-6.24/diff/OALDERS/Net-HTTP-6.23#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-http/perl-net-http.hash | 7 ++++---
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 094b9e5da0..c286ee0ece 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,5 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-sha256  0d65c09dd6c8589b2ae1118174d3c1a61703b6ecfc14a3442a8c74af65e0c94e  Net-HTTP-6.23.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  3728289552dc5031700596e0cf4092b4  Net-HTTP-6.24.tar.gz
+sha256  290ed9a97b05c7935b048e6d2a356035871fca98ad72c01c5961726adf85c83c  Net-HTTP-6.24.tar.gz
 
 # computed by scancpan
-sha256  0ed700a4bfc022e999d83407f71ab62ead96662d8f7bbebfd857376bf3ed6528  LICENSE
+sha256  bd8fcd2e2a8c322e3d9ff9dc943b0ca651760327bdcb82f0adecd8573442c096  LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index 08e81f95a1..df360c9cb9 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.23
+PERL_NET_HTTP_VERSION = 6.24
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
