Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21231D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC3F3413C6;
	Wed,  7 Jan 2026 18:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcJS-tJQDJs5; Wed,  7 Jan 2026 18:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D5CB4142A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808945;
	bh=o5guWihzXLGTWaGzYJgBk88lFwPKriW1Oe7Y8QdrfSM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=npHieOB8AVqLBrzj1S41egSDsqkkAAxQWLRn9NzdpZWI+5GL30og1eoqJ+x5Vq43n
	 RDMZw5ktId/5k+w8c/0KvZTwfbPcE4RWhofntxitzuyMeqyRYhI/2VX7qzZ3BB+o94
	 WKyoAM+CTdl3jlX4CZzQ9ivYVDkpS/26kQTPlLjAPANkggbkf9ADUBQDnnQszxnNie
	 ji6yIFtfDovSRiTGVGA2sy5V3X/akp9ULRgRLqGtY51oUf3RnKrG3bKRhG2ZIyD10w
	 RFlS4u8uIe4ezRjEKCuB58UOv6VEyrGuREt3Pr8i9Jhj1Am5f3uWJun8Eax1SJ2uM3
	 zBYCorXjqbBAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D5CB4142A;
	Wed,  7 Jan 2026 18:02:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 031EE25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9DF240C31
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOyPRrax0aIN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF87D40A5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF87D40A5E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEB1A8039B; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:54:32 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 9011ca9d31e724c6db3e08204bae601429938d9a
X-Git-Newrev: 9dedbd569c66ea10c4878ff26ca5696fa1b0c4dc
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.EEB1A8039B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/matchbox-fakekey:
 switch to gz tarball
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9dedbd569c66ea10c4878ff26ca5696fa1b0c4dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.

No autobuild errors recorded due to previous download error with
matchbox-lib.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c687f2fcf50b5aedfc91f6b2c042405235e58396)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/matchbox-fakekey/matchbox-fakekey.hash | 2 +-
 package/matchbox-fakekey/matchbox-fakekey.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/matchbox-fakekey/matchbox-fakekey.hash b/package/matchbox-fakekey/matchbox-fakekey.hash
index 3627b13913..03fcfef6d3 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.hash
+++ b/package/matchbox-fakekey/matchbox-fakekey.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4e2fdc9bc20df469d53885c40e104122140131e06d4c184902070ec0b0f2ca9f  libfakekey-0.3.tar.bz2
+sha256  d282fa6481a5b85f71e36e8bad4cfa938cc8eaac4c42ffa27f9203ac634813f4  libfakekey-0.3.tar.gz
 sha256  3271662131760e9b30dd92495a0ea0b598fc457798cc67948947365299dd607d  src/libfakekey.c
diff --git a/package/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
index 99921ef8e7..4f32cd9378 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox-fakekey/matchbox-fakekey.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MATCHBOX_FAKEKEY_VERSION = 0.3
-MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
+MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.gz
 MATCHBOX_FAKEKEY_SITE = \
 	http://git.yoctoproject.org/cgit/cgit.cgi/libfakekey/snapshot
 MATCHBOX_FAKEKEY_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
