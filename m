Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650ACCD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 258AA61263;
	Sun,  3 May 2026 14:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puvkDnotMSfX; Sun,  3 May 2026 14:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B662D61274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819825;
	bh=j2qd311XYi7b/l8va3OAuGOCJBz38LzeO1ISvD1mvxY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d8JxCeS+9LpmxfyzEywxM+EUMzZJeCbBbCelesEek1xH9NbnKQHIJzMIhWMMP1eRV
	 UtAx2RVti9qLrSG1WrLh2MlpMLekSt165TwsltywheIpUPwcvKdKo71ag4h2vP1iJB
	 FZppl05gJi67d2RsuFUogdGIAbjyTqwG2ms4ke3duSo1i3T3WHywCUgWP/+1ehjC/1
	 48ZyDojsOOneqiGqmXA2JXcjNtVtVV2lEbH47XQ9uoXJbgzGugSAJSdh0CR9w5pWgS
	 Uor2RBpsU9WEs/SqB6LvooLOskCn9KgTntmTGL1UlJvciyFXVvZzc7xL5RhA9LU3Nx
	 J8HLboDGMjTfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B662D61274;
	Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A230A127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 893668409F
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWvBCWhE3biZ for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 693388409E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 693388409E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31EAF83FC0; Sun,  3 May 2026 14:50:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11e5013d97525365f19e794583bc2071d48f6fd9
X-Git-Newrev: e2db3fda4c6ad481cf4d0f31aef24e0b969d2358
X-Patchwork-Hint: ignore
Message-Id: <20260503145022.31EAF83FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-attrs: bump version to
 26.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e2db3fda4c6ad481cf4d0f31aef24e0b969d2358
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.attrs.org/en/stable/changelog.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index bf2aae1ed8..06cb8d6dfa 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  6197561dfec99660529830edcfeee0ba  attrs-25.4.0.tar.gz
-sha256  16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11  attrs-25.4.0.tar.gz
+md5  633953d1aa39cfa76c733a20fdd9c196  attrs-26.1.0.tar.gz
+sha256  d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c985eff32  attrs-26.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index fd900c5046..7456002536 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 25.4.0
+PYTHON_ATTRS_VERSION = 26.1.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/6b/5c/685e6633917e101e5dcb62b9dd76946cbb57c26e133bae9e0cd36033c0a9
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/9a/8e/82a0fe20a541c03148528be8cac2408564a6c9a0cc7e9171802bc1d26985
 PYTHON_ATTRS_SETUP_TYPE = hatch
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
