Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE58C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00E560F70
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A00E560F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 721F24049B;
	Thu, 23 Sep 2021 21:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fktZkptdPhJg; Thu, 23 Sep 2021 21:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A11C404FA;
	Thu, 23 Sep 2021 21:09:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EB061BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C7CB4049B
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVOjrftgCFRj for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E142640530
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 50E0C8D210; Thu, 23 Sep 2021 21:04:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 22:30:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83a0e8dea203dc37c6c207a36b3f46160578dcc2
X-Git-Newrev: c3712a86adca8f512b0e7c45c9196732841af10c
X-Patchwork-Hint: ignore
Message-Id: <20210923210442.50E0C8D210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wavemon: add libcap optional
 dependency
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c3712a86adca8f512b0e7c45c9196732841af10c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap is an optional dependency which is enabled by default since
version 0.7.1 and
https://github.com/uoaerg/wavemon/commit/669c53e3359af5f6d4044126e22ab95f40a968f4
and can be explicitly enabled or disabled since version 0.9.0 and
https://github.com/uoaerg/wavemon/commit/af36fbe75649f745e205cd961302b656b8461e06

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wavemon/wavemon.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 3ae1141ec4..d2af6c2bc0 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -13,4 +13,11 @@ WAVEMON_DEPENDENCIES = host-pkgconf libnl ncurses
 # Handwritten Makefile.in, automake isn't used
 WAVEMON_MAKE_OPTS = CC="$(TARGET_CC)"
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+WAVEMON_CONF_OPTS += --with-libcap
+WAVEMON_DEPENDENCIES += libcap
+else
+WAVEMON_CONF_OPTS += --without-libcap
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
