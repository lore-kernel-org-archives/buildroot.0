Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC29C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 11:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E87B760C19;
	Wed, 23 Feb 2022 11:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIbV22vrEXDK; Wed, 23 Feb 2022 11:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1726F60B34;
	Wed, 23 Feb 2022 11:55:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF001BF9B4
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BF0A82726
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=metanate.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s88tZB9LHe94 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 11:55:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FED18132F
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=ZCZJzOm8/LkHo57qioWn9w2ZxO0D98Ev//4hpHdIs7E=; b=O2
 t65MfNLpSeK7C8EEfmXRbb3th/lWnxJUZubIW6+3UP5UHdO9ck/6gdRQbo8CAKCZ+fsgYHvktKCrX
 Atcfx3748YXHv6jawPwSHfqpK2UIPrPrpC3+hWaI3g9cwP8UQERBRFddtJ7QCgxkLLC6CfPA2H9Zk
 +sD6svYuGattD8XQEfR34lUxpI7XyFqWFrI74YlXz6n/fVC1sXUYAMJgKuu01l0NEeddPg3bDXeB6
 7oEvQCPh5lNka5BAxCtXT05YBTiv8K5nMza29qW6a0QR1knkfdYk3g/8IdUL0t1KV02Svh9y7h61J
 Z/SZthcWT8/lmvsDNEPJ15825tREpigg==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1nMqEj-00036D-0z; Wed, 23 Feb 2022 11:55:13 +0000
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 11:55:06 +0000
Message-Id: <20220223115506.1191031-1-john@metanate.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Authenticated: YES
Subject: [Buildroot] [RFC PATCH] package/libiberty: use the same version as
 binutils
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
Cc: John Keeping <john@metanate.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libiberty is built from the binutils source but this package has
languished on version 2.32 while the binutils package now uses 2.36.1 by
default.

Even between the 2.32 version and GDB 10.2 which is the default (and
where host-libiberty is used instead of a version bundled in the GDB
source) there are memory leak fixes and several improvements to
demangling.

Update the libiberty package to simply use the same version as binutils
so that there is no need to remember to update this package in the
future.  Replace the .hash file with a symlink so that the binutils
hashes are used automatically.

Signed-off-by: John Keeping <john@metanate.com>
---
I'm not sure if this is this is the best way to improve the situation
here - it's the smallest change to get something a bit more modern (in
most circumstances), but I wonder if libiberty should use the GDB source
instead as that's the one package we know both bundles libiberty source
and will use host-libiberty in preference.

 package/libiberty/libiberty.hash | 6 +-----
 package/libiberty/libiberty.mk   | 4 ++--
 2 files changed, 3 insertions(+), 7 deletions(-)
 mode change 100644 => 120000 package/libiberty/libiberty.hash

diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
deleted file mode 100644
index 0dafcea520..0000000000
--- a/package/libiberty/libiberty.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
-
-# Locally computed, same as binutils.hash
-sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
new file mode 120000
index 0000000000..e0655d3af3
--- /dev/null
+++ b/package/libiberty/libiberty.hash
@@ -0,0 +1 @@
+../binutils/binutils.hash
\ No newline at end of file
diff --git a/package/libiberty/libiberty.mk b/package/libiberty/libiberty.mk
index 6235a8b956..d0847bf298 100644
--- a/package/libiberty/libiberty.mk
+++ b/package/libiberty/libiberty.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBIBERTY_VERSION = 2.32
-LIBIBERTY_SOURCE = binutils-$(LIBIBERTY_VERSION).tar.xz
+LIBIBERTY_VERSION = $(BINUTILS_VERSION)
+LIBIBERTY_SOURCE = $(BINUTILS_SOURCE)
 LIBIBERTY_SITE = $(BR2_GNU_MIRROR)/binutils
 HOST_LIBIBERTY_DL_SUBDIR = binutils
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
