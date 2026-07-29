Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BCEC54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 20:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA6F80F36;
	Wed, 29 Jul 2026 20:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ToZO9kuVa0W; Wed, 29 Jul 2026 20:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2060480F1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785355595;
	bh=7IwcXpnYO+CfPJHFAfulgvBszIzSEjWu2WJvwlpDOLI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g+v3v0hQULBv1agGWhiPhjtDZw/eSfdDoDC3DAlhonHslOijykC13pzynPvNagwNl
	 rDMA5/+3FT1+nLx7+mRrUJLJm+spM/8JvPYy/ey8JB4oi0McUV1KwXaHxO4NTxWLpe
	 dGCQBOpARgL7SHaxNPRyQdIrXA9zp/O5SCUnHkJeHMq4fclP7r52PS8ouRIqG445h9
	 uUkm1X4l135R3jB9BOHyTouMgFmAQxHYK+XCv8mQHhRaR/5Xff5XUrqfHDBYopBBvj
	 Yic5oUQqGQAJM2aFIq7FMHd2WTxjJBG07besWgQTWZNbFy88HLDb1TcyN7+dINou06
	 0JGzpfsXutfRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2060480F1E;
	Wed, 29 Jul 2026 20:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6501826E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 484FC4065D
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLZLvnkKJPBv for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 20:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90C0B40623
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90C0B40623
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4351A8B553; Wed, 29 Jul 2026 20:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 21:19:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f8fa5ee0db859a5f87aff144e88bcc4b899a6c4
X-Git-Newrev: 2e237d22179f7f534900e0fd11fc74942d12a6b2
X-Patchwork-Hint: ignore
Message-Id: <20260729200548.4351A8B553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-grubenv: bump to version
 e4cdd9db21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e237d22179f7f534900e0fd11fc74942d12a6b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Update License hash due to year change.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Julien: add "package/" in commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index f3083e5d39..06456f6818 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bdb055332952f471d36d30cf8148d1d34eae16b8671cfd98200eaab5bc392a7f  mender-grubenv-e4cdd9db213de15e79576b40fd3f07736ac85709.tar.gz
-sha256  38791d93beae962b266e11ac888ea2af4f07578b272c2f9dcb05f54f32960a76  LICENSE
+sha256  9200dfc8ce8d9e5fae13947857fec44961df87c5bee92f90e37049279a94fb6f  mender-grubenv-ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4.tar.gz
+sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index cf2f7520c0..d93159802d 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = e4cdd9db213de15e79576b40fd3f07736ac85709
+MENDER_GRUBENV_VERSION = ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
