Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755A6D185CC
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE59860A7B;
	Thu,  8 Jan 2026 11:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4C3vWyracGK; Thu,  8 Jan 2026 11:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E46C160DC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870029;
	bh=flm4DtPb/HHAyeVc4b5viYLNurEqRjI7Opu8wXsmiVk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nWpI9qfNXdpk+6nZIdc67YwJs8gKgrlbcfLPp/LRl4LFSlA6D+Mvdy/bXspN66DQ0
	 ehJCnjL3k+me05WiT2wmnFDONdu099HhY30hVOeePz/oClPJwpOd1gupAWVW2Tp3qc
	 oaCJFGW44XiuYq8ZrfencvOe2eEYbFTL5W8afig7Q7Oj0SAqfO2NKhxOirTqjG18dx
	 4j/adYkbM0f6Th6OOpPB8SHdAD4CZNJK6ZZnD4z5yYmgElXQrC+5rLT7/wmxCOeACI
	 A3AM+xSxUavMgRt0SjNW8sF8omvQgJww669VdjMJzzxhYQuRlihgtP8HVVXXNqTott
	 AtstbNzeECfJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E46C160DC2;
	Thu,  8 Jan 2026 11:00:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46FD3436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0B2A408A5
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mH4eIEtGH8j for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECF6240A91
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECF6240A91
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAF1D88440; Thu,  8 Jan 2026 11:00:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 23:32:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23f335da435f0fdffa49bd1620fe3632b0493ac0
X-Git-Newrev: 8143138f9d764b574c1f5fa51df7ddc81e8c99c4
X-Patchwork-Hint: ignore
Message-Id: <20260108110023.EAF1D88440@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-datetime-tiny: bump to
 version 1.08
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

commit: https://git.buildroot.net/buildroot/commit/?id=8143138f9d764b574c1f5fa51df7ddc81e8c99c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/DAGOLDEN/DateTime-Tiny-1.08/diff/DAGOLDEN/DateTime-Tiny-1.07#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-datetime-tiny/perl-datetime-tiny.hash | 8 ++++----
 package/perl-datetime-tiny/perl-datetime-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.hash b/package/perl-datetime-tiny/perl-datetime-tiny.hash
index 8dc0765751..eab7aa4052 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.hash
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  5ac2924652edb0cf5fda7c9d52162b3f  DateTime-Tiny-1.07.tar.gz
-sha256  83568a22838cb518fbeb9e060460ec7f59d5a0b0a1cc06562954c3674d7cf7e4  DateTime-Tiny-1.07.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  da729efd2fc3331f623e2f8ef41508f7  DateTime-Tiny-1.08.tar.gz
+sha256  eaff931132fa8aa7a2e1688fd3d6d7ec55ea6eb071cacd4aaeb0cf91ce1af7d6  DateTime-Tiny-1.08.tar.gz
 
 # computed by scancpan
-sha256  21cda7a55a8d4b32a43c654f0d4d4a1587096b35bf2a93ea12a2e3a8c2c0b88f  LICENSE
+sha256  2993a1ab6fe37cf97f35487f2e3fe7142aed0a50781feb5c4832fe9a95eccee7  LICENSE
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.mk b/package/perl-datetime-tiny/perl-datetime-tiny.mk
index 2a4264261e..6a43b8dc74 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.mk
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATETIME_TINY_VERSION = 1.07
+PERL_DATETIME_TINY_VERSION = 1.08
 PERL_DATETIME_TINY_SOURCE = DateTime-Tiny-$(PERL_DATETIME_TINY_VERSION).tar.gz
 PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_DATETIME_TINY_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
