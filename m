Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820E710775FE
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 514AB60872;
	Wed, 18 Mar 2026 18:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXcrvNaic3sW; Wed, 18 Mar 2026 18:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96E9B60BAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773858109;
	bh=ZBdLrqmRS2x9Iv6HO8NeQogwa6lRS6OKSchgz8Cpv/c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GJUKnKQDRXidg1xpY4383MEwhhMIlQdsEy72sh9hrjMlrLJQNQ4TeIA3uX7+GiGAN
	 B4YU3lkiCYG+s8sY1vfjF06GMr8qwk1GvYXpISip6SC0h1ey9IA2OH8vZH4fv9iQmh
	 chULNdkC0hnDkDASWvF/qSYZN/aAr7QgLYCqhe7am/Q+4rxfE4EAdolcD2SFm5Okdx
	 CZhEQgYwpodRmLXDlNCWl3sjaHjH+LB0Boe/KR9QoYEgkEjBitYpxxijkIq3w8ve4Y
	 Rc6KQLbfThVbkXudC6H5Z7zOBj4K0Q9r3mXeFD2fKsPVw/uJWzuQAFMDRkXiufATGJ
	 qts+hgG6/aMQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96E9B60BAF;
	Wed, 18 Mar 2026 18:21:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7115D1B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55C50404A5
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZ7xsBNo3S_D for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D6E040369
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D6E040369
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:21:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7561184AC4; Wed, 18 Mar 2026 18:21:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 19:09:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e8739fab27e8a7b9850c936d95c1cdaca3ea0f9
X-Git-Newrev: 8c475011a82c32d465603c4cf73078a4e631a448
X-Patchwork-Hint: ignore
Message-Id: <20260318182146.7561184AC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: bump to version 1.41.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c475011a82c32d465603c4cf73078a4e631a448
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://github.com/janet-lang/janet/releases/tag/v1.41.1
https://github.com/janet-lang/janet/releases/tag/v1.41.2

This commit also updates the LICENCE hash, after year update:
https://github.com/janet-lang/janet/commit/6e4b0b92592860493c89243c2f0ff2c97a8784dc

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/janet/janet.hash | 4 ++--
 package/janet/janet.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 02dc550dbe..0ddc8ced77 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e7fdcb7ccc83a3be6181f7d7d71f0ea027a000e0eefe9bba3b8373c05eb5764a  janet-1.40.1.tar.gz
+sha256  168e97e1b790f6e9d1e43685019efecc4ee473d6b9f8c421b49c195336c0b725  janet-1.41.2.tar.gz
 
 # Locally calculated
-sha256  805858acec1df54018879efc78ee3ff7bab5e69908c58e46bbc2d94520f29023  LICENSE
+sha256  16e31703a3ab5c4d3e35aa8bd607551911a9d981fbf0b5fbd832fe6eed4b70ca  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index dd2283e5a9..bca7ff0500 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.40.1
+JANET_VERSION = 1.41.2
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
