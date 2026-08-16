Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E23C5DF6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 13:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47EC880E78;
	Sun, 16 Aug 2026 13:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWt_P6G4XajG; Sun, 16 Aug 2026 13:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86F7880E6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786887820;
	bh=UYqv3IFMDJBVaUi+7jFp/KZLQ0lcsCd0HGvjkstysPE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HY7NNv4WiJ96b+L0QO7p6a7ZRUgg+4KBtiEtq6GUUsoW7pFwh2LU8fH/9jWfjAsXD
	 0QO3mswltWzpbA7pUC0SttDqWyib590RbmIAj+Ujz9bz3a0yFfflb7zMT/t9t1onTn
	 /wMfuflj4T0+qN0Uz7UA1A+AlHmCb32Cm69L14BydEJdRajKefvGD8BdpO8ZnKynMv
	 yrBfsy1OXknfayMf9RyxhozoN14/slyxduDOvxEimmPix0G460lrAFmgq+DgnxUv0+
	 JneV1Hx67QKo7pBDmOZDNKvKP3Z16V2s6eF5G+VnFhXINuBwjFEHn5F+Lno06MNWKF
	 dAJ56+/Kv6XCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F7880E6A;
	Sun, 16 Aug 2026 13:43:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 072623A0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E13B960632
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsN_kbhlRle6 for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 13:43:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A052605E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A052605E4
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:43:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 261268DA79; Sun, 16 Aug 2026 13:42:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 15:19:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ec3435c0add9c5fc8310fa65f40b076aa121609
X-Git-Newrev: 1f48599867d9fe45433c14d9f23eb3bd8fe07a7f
X-Patchwork-Hint: ignore
Message-Id: <20260816134247.261268DA79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quickjs: bump to 2026-06-04
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f48599867d9fe45433c14d9f23eb3bd8fe07a7f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for a Changelog:
https://bellard.org/quickjs/Changelog

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 70dfb2d19c..4509e54e99 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f1f322aea3bb3a90858db85c9fe717013fde4df7dfcafe2f57e78f5bb4b4a0c  quickjs-2025-09-13.tar.xz
+sha256  b376e839b322978313d929fd20663b11ba58b75df5a46c126dd19ea2fa70ad2a  quickjs-2026-06-04.tar.xz
 sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 511f142456..72535ff4ef 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2025-09-13
+QUICKJS_VERSION = 2026-06-04
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
