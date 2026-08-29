Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B950C61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 22:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ABE4405EE;
	Sat, 29 Aug 2026 22:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3asmflUZL2Zq; Sat, 29 Aug 2026 22:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788042035;
	bh=pGEMoFrzjQUbw9ELHWnwYE9TwV5cPpOKVyJfThbosME=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kT8um0ZG1N81GzmRxkHn0NjG9mBPjQS+LijfjeI8Lq0NBpTMI3xDbdOxu8s7K8o+q
	 N5IW0jJYvFlGyymRXwX5O+8cGhne1PJcPUNLUJf5mB8/Czm24iUBmuDrRpL7YipNrb
	 St+V48w/aDzbU5QknMAwugfeNUcDtr/KVHpH2ELN4HiOKncJW1prFeA2i56X57UECA
	 3+rqrfW3EVHosdxPkJ87afuNS9f8yj7PuV0yAKXdlp09rt5nKAvPQ4dFQbtkTtp74b
	 NeCqcmK9gl1TUiBlMdjGtI/4w3CuRKg89PPoATLNLksFNyC9hZYBIgFZiOrb43/sOJ
	 VilnqooxO8flA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9167D40695;
	Sat, 29 Aug 2026 22:20:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A66799D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CC9D40097
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPy4eA-o8cxg for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 22:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0709840059
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 22:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 485FE92254; Sat, 29 Aug 2026 22:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:56:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9c18b1668b068e48364fb41c1d62a7903b04d03c
X-Git-Newrev: e9c340a3947b7ae2c415bdbee6f76b568a257424
X-Patchwork-Hint: ignore
Message-Id: <20260829221934.485FE92254@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gensio: add udev
 optional dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9c340a3947b7ae2c415bdbee6f76b568a257424
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Udev is an optional dependency used to directly control cm108 sound
device gpios. It is enabled by default since version 2.6.3:
https://github.com/cminyard/gensio/commit/c1b5c0a214b85026f1d8c97bd79aae038fef733b

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 8fc21fab01..0c3ca5e03b 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -34,6 +34,13 @@ else
 GENSIO_CONF_OPTS += --without-mdns
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+GENSIO_DEPENDENCIES += udev
+GENSIO_CONF_OPTS += --with-udev
+else
+GENSIO_CONF_OPTS += --without-udev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GENSIO_DEPENDENCIES += host-pkgconf libglib2
 GENSIO_CONF_OPTS += --with-glib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
