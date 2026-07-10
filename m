Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2034C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A2C6606B4;
	Fri, 10 Jul 2026 16:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfKCTfaV2jrX; Fri, 10 Jul 2026 16:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D98860A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701857;
	bh=bf2j65paqaQ6Zx8bWKUSSDjIhO6njWl8S0EEqfI/2DY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HEI7VdPKir9jgi4YIQSannx/5y5bfE13iunsolpy0fE3lq8rEpCaSgR3q5iUCi8rS
	 927fnYUuJZhppPbtp8X2cnnAmx06Qx7ZjF3oag1l7+Zfze/PCmwt9NeZ7mNBEvtDvo
	 D9peWSNLsgUKkWfG0G6qRkubsRVfKcIvV207/3CAO0kRLl3lFq4Ch+BgIgAH83eNJZ
	 8r8LWPpYcdmid41v0CR+/X5S0t17oQu9h6FYZg+iUZaxW1JzVcwqSHP3lQtfM1I38n
	 u/IzZWTjzWeFNrUs0mS/i/rfd1zH9SPygYDxuqn5741gUYvE9G0UK3/bbF4zSiFP8K
	 XgcPlXje70tyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D98860A75;
	Fri, 10 Jul 2026 16:44:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB5332FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9113D409D5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mam1KtN5qfvM for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7FEB409D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7FEB409D4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBF41886A3; Fri, 10 Jul 2026 16:43:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:42:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4c690d22029fbba59d31d02fbf392d9f7cbe654
X-Git-Newrev: 2612bf23e5ce52c5e877351c13121cc6e6c2275f
X-Patchwork-Hint: ignore
Message-Id: <20260710164336.CBF41886A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libva-utils: bump version to 2.24.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2612bf23e5ce52c5e877351c13121cc6e6c2275f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/libva-utils/blob/2.24.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libva-utils/libva-utils.hash | 2 +-
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 6888647865..d7b1a0789b 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fa7ff29847b55010fbbb775b35382f97f29b7b97abe9a2f6fb3e22b36db5440a  libva-utils-2.23.0.tar.gz
+sha256  bf959a1ced3cde8176a7ff50ad358ee98e93301ac068581a8b2617c5b83afcb3  libva-utils-2.24.0.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 3fdb6bcf70..38dd14610c 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.23.0
+LIBVA_UTILS_VERSION = 2.24.0
 LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
