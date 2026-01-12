Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99E8CF45C0
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 18:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 255AD60C14;
	Mon, 12 Jan 2026 18:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT3E7Y2jwLBZ; Mon, 12 Jan 2026 18:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B342B60BFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240950;
	bh=AfBpAMK2tGaYw4NrnEmN3qFbmLRTL9tK5Whp+T3DGRM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LqmlZ5414hAKJS+sbWcW37B4EU9u2IUGpX7VpgHh/d1HX442Ad5Dkd2A5qXNN9Kgh
	 1ycX+JfKcaa8aeRftAvsYK3LejPj/KzHCyIupUtrIIt5GTm/P1ZkR8ghQ1xIPT4RY9
	 CgOKuUOdezXwAmuJu8kh0zyljenuIqzZ5ndR85vjghAVgI9v52DP/T0HLPfvVrZ8UD
	 3MXRdJqnDcGHh59JzVj/xYw6yzloEe6WECKDO4KfDHFuSYMX+0asZg8bLUAw9iZNpA
	 EADtGZSRt5o2QTiRUsasZA6nrO7sV5gnT6S75aVCXotr3Yt17eFk3V+lRvdawND7cy
	 21N3eqLFJDPKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B342B60BFD;
	Mon, 12 Jan 2026 18:02:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62AC31CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FD9683F4B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4lbHDsK_rwb for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 18:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A087683F4A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A087683F4A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E52588549; Mon, 12 Jan 2026 18:02:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 19:01:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdeecb18ab3d5a53363d581ab9c991b5f5562571
X-Git-Newrev: ce30d9680e10d9cfd2c8ffbe58fbd9142d921596
X-Patchwork-Hint: ignore
Message-Id: <20260112180227.8E52588549@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-sub-quote: bump to version
 2.006009
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce30d9680e10d9cfd2c8ffbe58fbd9142d921596
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENCE: update copyright years & minor cleanup & use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/HAARG/Sub-Quote-2.006009/diff/HAARG/Sub-Quote-2.006008#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perl-sub-quote/perl-sub-quote.hash | 6 +++---
 package/perl-sub-quote/perl-sub-quote.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-sub-quote/perl-sub-quote.hash b/package/perl-sub-quote/perl-sub-quote.hash
index 8db560fd44..823c49ef1a 100644
--- a/package/perl-sub-quote/perl-sub-quote.hash
+++ b/package/perl-sub-quote/perl-sub-quote.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  f19c60039ba87f69f7f9357fc0a03e07  Sub-Quote-2.006008.tar.gz
-sha256  94bebd500af55762e83ea2f2bc594d87af828072370c7110c60c238a800d15b2  Sub-Quote-2.006008.tar.gz
+md5  8f4600b812f6106a1f907ee47a87bd1d  Sub-Quote-2.006009.tar.gz
+sha256  967282d54d2d51b198c67935594f93e4dea3e54d1e5bced158c94e29be868a4b  Sub-Quote-2.006009.tar.gz
 
 # computed by scancpan
-sha256  de7a14750e81d97e19e111df58a3b51e3f2c8ec2d2dd90f576f54243251972c6  LICENSE
+sha256  ca095549209becaf2d8f1d4623bccd8512045acbf74a41ea839007b1b47174d4  LICENSE
diff --git a/package/perl-sub-quote/perl-sub-quote.mk b/package/perl-sub-quote/perl-sub-quote.mk
index 3c2a25be51..da2bd7e2dc 100644
--- a/package/perl-sub-quote/perl-sub-quote.mk
+++ b/package/perl-sub-quote/perl-sub-quote.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_SUB_QUOTE_VERSION = 2.006008
+PERL_SUB_QUOTE_VERSION = 2.006009
 PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
 PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
