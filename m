Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C3CC531F7
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 16:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E03CA80E7F;
	Thu, 23 Jul 2026 16:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74J1LgAhq4y9; Thu, 23 Jul 2026 16:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F140F810F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784825211;
	bh=G9nlfNuPfykgcm7dbFJpA9/CeUwBbilFHjrgcuaZhtU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XMPjVl1myWPwmHcIOUjqYygEVvx61pDlKlEfAmMHDQQuLA5K8HjptYG8MIaylbVpg
	 l/dw121PFw3HUK4CuFsK0NLmEh4biuKeDoKtjaBo0RXNw4QVRphp8H9YFBrrJf1eWg
	 tfVvFktv2wSQq70NiSjgt/6YHV6gzg8zCWX4Rfqg1t2U+4OWwoRcHLkTBzO++BM2W8
	 dBtGZy4ius6E//C5AHD1UeE52BpDsGJ/TElddamjO4ZFIcLCymYRmBzoRBUnOpXgHN
	 WaAkexfRm6894iF8VKHplec73hRvAjkyCU5E5iK/gJNvVUcWIvt8zNFrQZC+vFgo5n
	 4OfDZIqq98zHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F140F810F7;
	Thu, 23 Jul 2026 16:46:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1D1396C
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97EE940A9F
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xB_Je1tLKTRf for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 16:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B29440A89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B29440A89
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 16:46:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57F208A3F4; Thu, 23 Jul 2026 16:46:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Jul 2026 18:42:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95b77f7a71fdb312421dab8839d6fdfa4964c9eb
X-Git-Newrev: 2a17921b60cd4a7e237287c791812a93164de11e
X-Patchwork-Hint: ignore
Message-Id: <20260723164608.57F208A3F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ugetty: use correct SPDX license
 identifier
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a17921b60cd4a7e237287c791812a93164de11e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BSD-0-Clause is not a recognized SPDX license identifier. 0BSD is used
in the LICENSE file, and LICENSE.0BSD matches the 0BSD license text
[1].

[1] https://spdx.org/licenses/0BSD.html

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ugetty/ugetty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
index d3424bee42..6214498094 100644
--- a/package/ugetty/ugetty.mk
+++ b/package/ugetty/ugetty.mk
@@ -6,7 +6,7 @@
 
 UGETTY_VERSION = f1b7858778800b7256e9874f266c1d16ced22a6e
 UGETTY_SITE = $(call github,ryancdotorg,ugetty,$(UGETTY_VERSION))
-UGETTY_LICENSE = BSD-0-Clause or MIT or CC0-1.0
+UGETTY_LICENSE = 0BSD or MIT or CC0-1.0
 UGETTY_LICENSE_FILES = LICENSE LICENSE.0BSD LICENSE.CC0 LICENSE.MIT-0
 
 define UGETTY_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
