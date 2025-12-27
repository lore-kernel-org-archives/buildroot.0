Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA44E9271A
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 19:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DAF2405D5;
	Sat, 27 Dec 2025 19:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqc8h1iEuorC; Sat, 27 Dec 2025 19:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07F23405B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766862553;
	bh=/NKhb0tKX34qJoYws9fzeug23DieO8qOIcTnehk92dY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QHxKAPXPk941sw59Ckzeiy9rOxRTqx8CV/z8UC1wxyZZ1dqJtEAxtH1f0DA+jSqiS
	 /kUfk4IKlz0/crkFM0N0WC6D0w+nL0bnLO3/xUSNc1bECKNPZCl7agdI7C4Yl+biyF
	 pHz1H+N4snZ17qIn8meqNXVIQcEvyrAMxdcTM5U3paNveOnAkX+derw2p8bmOY7x90
	 thS0+xvw9BG9vBcu3ce12vFmfPYVVfCoQ3eCTnE3YQ1iCyYWtEOGrWYgYI+yyJ+9SP
	 r9iCaj69kyRtCcmOqqMt8w63oNekG5IVRIgmukhTBEWk7G3LgKxA3Jb6OT12FQFb49
	 xzUsRLEAvZW8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07F23405B7;
	Sat, 27 Dec 2025 19:09:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C4EED8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 19:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 128E580F19
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 19:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQKiswd60nyo for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 19:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 651AF80F10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 651AF80F10
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 19:09:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54E05877FE; Sat, 27 Dec 2025 19:09:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 20:07:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fb7422f072d287851a3c56fec0fe0307d5ffc0d
X-Git-Newrev: 673adebb0c8dc34c5572c7419dd3545ab2981380
X-Patchwork-Hint: ignore
Message-Id: <20251227190911.54E05877FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/broot: bump version to 1.54.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=673adebb0c8dc34c5572c7419dd3545ab2981380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/Canop/broot/blob/v1.54.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
[Julien: update changelog URL to use tag]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index e01762f275..f2a5b59263 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a006e15ec340d05451459f6e95a52789b6f55c93617129ca9178d00d43437cef  broot-1.53.0-cargo4.tar.gz
+sha256  e41a6e9c9bfac22ebbc55c7af1cbfeca08ce68d6a9935e05da5f38d224edb245  broot-1.54.0-cargo4.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index a5c5ba2271..f8043ee02a 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.53.0
+BROOT_VERSION = 1.54.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
