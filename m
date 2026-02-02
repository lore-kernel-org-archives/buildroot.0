Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A138AE73140
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 796056076B;
	Mon,  2 Feb 2026 08:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4fAvgTp2wpJB; Mon,  2 Feb 2026 08:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96AFA60785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770020693;
	bh=C0Q+VoAxgIox+Z3/Rh+i66Xb/ihoKnaeWUJR3CWEf30=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o3Q5yJEJ2/nHM0w0Ckk9N8+kYl+smWK935duSBTB9fcHyoizNz6r5BsIkNgcCE08W
	 MImmIi/+NvgdZPkPjmB9CztYsVmQVBlJj162Rgpa5ZM8fUfV0ckrKfR0sSkSi6npDw
	 JZiP5WGKoOsnKmwD0VBvq5Ae8B7Ron6wz15CAIPgnjaxj0RAK++EjRkWNTzhTJxDLq
	 Mzp4nJzMs5eeMTWhi0kASTkqwMpCQP14/mtJt2ox8jaTGcgn+A9/Udm/ufbbY90mtX
	 fQWIMdNRzG0AUTdCs7yUOzGq49Mi3eTlLOAhfNcqpDD1hmH6NOzw+R5jZbvQspyZ/f
	 OqBoI8tfSPEFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96AFA60785;
	Mon,  2 Feb 2026 08:24:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 884B034E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7605040927
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARKjDQlSQ214 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A74CE4091D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A74CE4091D
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:24:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9177E86241; Mon,  2 Feb 2026 08:24:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 09:23:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e5a961eb0b74399d81518ef3865c32b118ea6da
X-Git-Newrev: 191367ad120a564949001e0bf91425ad2cbed107
X-Patchwork-Hint: ignore
Message-Id: <20260202082450.9177E86241@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: bump version to 1.12.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=191367ad120a564949001e0bf91425ad2cbed107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://dev.gnupg.org/source/libgcrypt/browse/master/NEWS;libgcrypt-1.12.0
https://dev.gnupg.org/T7643

Updated license hash due to upstream commit
https://dev.gnupg.org/rC67b8da4ef62734927e061327efa9a6f48616d114

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash | 6 +++---
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index a170a1c827..60050b856e 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  b0d3d966894a5ee3b629e55350464f69e1c7859e  libgcrypt-1.11.2.tar.bz2
-sha256  6ba59dd192270e8c1d22ddb41a07d95dcdbc1f0fb02d03c4b54b235814330aac  libgcrypt-1.11.2.tar.bz2
+sha1  02f80e9bc9967609b7041ef874eae4e542f240a5  libgcrypt-1.12.0.tar.bz2
+sha256  0311454e678189bad62a7e9402a9dd793025efff6e7449898616e2fc75e0f4f5  libgcrypt-1.12.0.tar.bz2
 # Locally calculated
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 5c38e0e2db..4dffbdc3bf 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.11.2
+LIBGCRYPT_VERSION = 1.12.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
