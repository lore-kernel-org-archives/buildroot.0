Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDDDCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C4F840B62;
	Sun,  7 Apr 2024 19:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ox4rsauPgWEC; Sun,  7 Apr 2024 19:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 749B740B3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 749B740B3E;
	Sun,  7 Apr 2024 19:39:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87C821BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7300A8120C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DygZU18nm53W for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834BF81233
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 834BF81233
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D65E85C11; Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:33:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 624fb727f6c91e68c39a27e4f66e2bf8de298e89
X-Git-Newrev: 241b18b51e3219a06e19010ec874b3bb681ca110
X-Patchwork-Hint: ignore
Message-Id: <20240407193903.6D65E85C11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-net-ssleay: bump to version
 1.94
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

commit: https://git.buildroot.net/buildroot/commit/?id=241b18b51e3219a06e19010ec874b3bb681ca110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with libressl raised
since commit 9d8f9c73a2fd087dd2e8d8853a80da605fa64e4b:

SSLeay.c: In function 'XS_Net__SSLeay_X509_policy_tree_free':
SSLeay.c:17730:9: error: unknown type name 'X509_POLICY_TREE'
17730 |         X509_POLICY_TREE *      tree = INT2PTR(X509_POLICY_TREE *,SvIV(ST(0)))
      |         ^~~~~~~~~~~~~~~~

https://metacpan.org/dist/Net-SSLeay/changes

Fixes: 9d8f9c73a2fd087dd2e8d8853a80da605fa64e4b
 - http://autobuild.buildroot.org/results/974b7cdd275249c888fc6205f6ca31a3cf28b18f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/perl-net-ssleay/perl-net-ssleay.hash | 4 ++--
 package/perl-net-ssleay/perl-net-ssleay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 9caff68edd..219edd4e0f 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  c73821e9790b3bdb3471d9b8faf48bbb  Net-SSLeay-1.93_01.tar.gz
-sha256  876d022fbc719631b11d6bb4b6e78db3c19bbca578093c376c8f9900a4432aa3  Net-SSLeay-1.93_01.tar.gz
+md5  1b22c764e5a094c6261e37a4b1f148ce  Net-SSLeay-1.94.tar.gz
+sha256  9d7be8a56d1bedda05c425306cc504ba134307e0c09bda4a788c98744ebcd95d  Net-SSLeay-1.94.tar.gz
 
 # computed by scancpan
 sha256  685e534b60d4e2b4fbb1a259a83b5a86e877a919bbb9efc95994276f706a3a71  LICENSE
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 8b7b2b973b..7f58093082 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.93_01
+PERL_NET_SSLEAY_VERSION = 1.94
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHRISN
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
