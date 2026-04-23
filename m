Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440F0FDEE50
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 872BC60F92;
	Thu, 23 Apr 2026 21:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOfZJj7bJP3v; Thu, 23 Apr 2026 21:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0061F60F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776978245;
	bh=VuRVijA+ImTOBo1PRpsp6Hmd3cpEVJhkVgMwVKtVNY4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pf0epiy0haOGmfAPfVpm0QVZh8lfWkuZyJwAnu72mnnfddoDbH/q1N/SuxiKf1Q9E
	 kM6UPq4LNfkF+Mi2FfqHMtnBjZNuZGZUsMwlbEeqgxI8i50PMPxF5YCoeW/Y+oOhZq
	 hyhkSsAPWfNNSSua7QPjtH9Ya5uNukAR9RAE9Bc4XxrRGcoIbsSWdeAcbRc2rrKU9i
	 rZM8lmEBsGg4m9Ym2E+PnslieLULrnFFsDnCidBlw7j/Z8ITSVtYwWQ8GvhYUMWYsv
	 4LhSfs990StxCa9YngmpJ9Zy9gz2XnWpbhT9fVi0BsLvL5SgPAGnYszXWVUWFxvkNu
	 TfxQNFASsxhpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0061F60F83;
	Thu, 23 Apr 2026 21:04:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1048231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 21:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92FED411F8
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 21:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zUWKa7xP53M for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 21:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C98F040CEB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C98F040CEB
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 21:04:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55EFA828E5; Thu, 23 Apr 2026 21:04:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 22:34:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6774a1e4c8442d187ce6839d9a1b6dc3d04d684c
X-Git-Newrev: 9dd9e5a4def8b7bb00479aadfab5103e57bb23cf
X-Patchwork-Hint: ignore
Message-Id: <20260423210402.55EFA828E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-net-ssleay: bump version to
 1.96
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9dd9e5a4def8b7bb00479aadfab5103e57bb23cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/radiator-software/p5-net-ssleay/blob/1.96/Changes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perl-net-ssleay/perl-net-ssleay.hash | 4 ++--
 package/perl-net-ssleay/perl-net-ssleay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 219edd4e0f..739df2c181 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  1b22c764e5a094c6261e37a4b1f148ce  Net-SSLeay-1.94.tar.gz
-sha256  9d7be8a56d1bedda05c425306cc504ba134307e0c09bda4a788c98744ebcd95d  Net-SSLeay-1.94.tar.gz
+md5  63772ad94b874b5f0f025c2a4285f82f  Net-SSLeay-1.96.tar.gz
+sha256  ab213691685fb2a576c669cbc8d9266f8165a31563ad15b7c4030b94adfc0753  Net-SSLeay-1.96.tar.gz
 
 # computed by scancpan
 sha256  685e534b60d4e2b4fbb1a259a83b5a86e877a919bbb9efc95994276f706a3a71  LICENSE
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 7f58093082..1ba2227bc4 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.94
+PERL_NET_SSLEAY_VERSION = 1.96
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHRISN
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
