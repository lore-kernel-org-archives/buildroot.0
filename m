Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524B2C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:27:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1738660F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1738660F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E99C960A66;
	Tue,  3 Aug 2021 23:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJ-e6aa_qs9w; Tue,  3 Aug 2021 23:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3282C6090A;
	Tue,  3 Aug 2021 23:27:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1446A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77BCE40E4C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGrFWXbpcnPJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 964E340E55
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DE14F8827E; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jul 2021 21:42:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3fbeabd62012b5ce14dca2fcb9b6cf2d20419af0
X-Git-Newrev: 5633f2fb7a5e733d2900aa5a372b4de88ef767c1
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.DE14F8827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-rotas: bump to
 version 0.2.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5633f2fb7a5e733d2900aa5a372b4de88ef767c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

diff COPYPRIGHT:
-Copyright (C) 2018-2019 Francois Perrad.
+Copyright (C) 2018-2021 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-rotas/lua-rotas.hash | 4 ++--
 package/lua-rotas/lua-rotas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-rotas/lua-rotas.hash b/package/lua-rotas/lua-rotas.hash
index 6f8d0df41e..2633f3b728 100644
--- a/package/lua-rotas/lua-rotas.hash
+++ b/package/lua-rotas/lua-rotas.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 be47e72ec703ffc319fe4fd539b531bbe8a8c0c52e0cc9774273028f1599a0cf  lua-rotas-0.2.0-1.src.rock
-sha256 4a7fdc0e44509d79c9bf18560cfb98368f70bb3832abe07e3cdba5c06466b0bb  lua-Rotas-0.2.0/COPYRIGHT
+sha256 a947026be3552cbf676a0cef36a618111712257d306cbd9d340ed8895a4cbd2b  lua-rotas-0.2.1-1.src.rock
+sha256 ac8bb87b7b5e803ae27510b9c6fd284f1b00e741258bc59fc78d3bc107d96fbb  lua-Rotas-0.2.1/COPYRIGHT
diff --git a/package/lua-rotas/lua-rotas.mk b/package/lua-rotas/lua-rotas.mk
index 6ace963a4b..84d6c9a582 100644
--- a/package/lua-rotas/lua-rotas.mk
+++ b/package/lua-rotas/lua-rotas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ROTAS_VERSION = 0.2.0-1
+LUA_ROTAS_VERSION = 0.2.1-1
 LUA_ROTAS_NAME_UPSTREAM = lua-Rotas
 LUA_ROTAS_LICENSE = MIT
 LUA_ROTAS_LICENSE_FILES = $(LUA_ROTAS_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
