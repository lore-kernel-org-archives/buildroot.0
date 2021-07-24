Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF90C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:53:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4623060E97
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4623060E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CC2041574;
	Sat, 24 Jul 2021 07:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tE9DdwW5Xfhk; Sat, 24 Jul 2021 07:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29083414C8;
	Sat, 24 Jul 2021 07:53:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 081CB1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA220606D5
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2nQySRI2ZvC0 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 07:51:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E1A6606E9
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:51:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0EC00888E8; Sat, 24 Jul 2021 07:17:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 09:50:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26c647f031e1dc7fd3a59c6905d0dc98f6506c73
X-Git-Newrev: 6bcbaaae1e0bfccc4d2b858bdc1c646b7fc7da7b
X-Patchwork-Hint: ignore
Message-Id: <20210724071726.0EC00888E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-net-dns: bump to version 1.32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6bcbaaae1e0bfccc4d2b858bdc1c646b7fc7da7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

now, LICENSE lives in its own file.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-dns/perl-net-dns.hash | 6 +++---
 package/perl-net-dns/perl-net-dns.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index a6236357ec..916603e715 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  2a0364cea1ab6c1134506921d909f393  Net-DNS-1.31.tar.gz
-sha256  00024a8e371605c6d8422a27a0a87af8b7cf66f26502102e68ddd4baf7cfc615  Net-DNS-1.31.tar.gz
+md5  e8ee02ec42dfeb10ae4a0d175d5fcafc  Net-DNS-1.32.tar.gz
+sha256  b890a7b44d573f27cc713caadf1e12eaaa4478a6504d1157194df614316b5b50  Net-DNS-1.32.tar.gz
 
 # computed by scancpan
-sha256  e4f3224d86bd79ac3d11ea513fcb83c68c20701346653699225331e2b7a2d447  README
+sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 7be1b822c3..afba3e216a 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.31
+PERL_NET_DNS_VERSION = 1.32
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-PERL_NET_DNS_LICENSE_FILES = README
+PERL_NET_DNS_LICENSE_FILES = LICENSE
 PERL_NET_DNS_DISTNAME = Net-DNS
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
