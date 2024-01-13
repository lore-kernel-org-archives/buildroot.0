Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DECC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A9AD60701;
	Sat, 13 Jan 2024 21:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A9AD60701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ua0DO37HuBz2; Sat, 13 Jan 2024 21:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A16F606FF;
	Sat, 13 Jan 2024 21:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A16F606FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BD431BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4141660701
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4141660701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pELXLdydK6wt for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FC15606E6
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FC15606E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DF677FFF8; Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 22:18:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17c386fca2c529e1adf087a96b391a3619bd02c0
X-Git-Newrev: e8edf25ac86615b701378eef1d937cd1f3df9a47
X-Patchwork-Hint: ignore
Message-Id: <20240113213034.5DF677FFF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/duktape: add DUKTAPE_CPE_ID_VENDOR
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e8edf25ac86615b701378eef1d937cd1f3df9a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:duktape_project:duktape:2.7.0:*:*:*:*:*:*:* is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/DEAF95D7-0DAB-4025-8C5A-9CCF80D75CF2

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/duktape/duktape.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index 674c5e9323..9b5fb65f06 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -11,6 +11,7 @@ DUKTAPE_SITE = \
 DUKTAPE_LICENSE = MIT
 DUKTAPE_LICENSE_FILES = LICENSE.txt
 DUKTAPE_INSTALL_STAGING = YES
+DUKTAPE_CPE_ID_VENDOR = duktape_project
 
 define DUKTAPE_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f Makefile.sharedlibrary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
