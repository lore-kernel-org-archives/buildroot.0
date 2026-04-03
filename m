Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16888E85388
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3C14123D;
	Fri,  3 Apr 2026 17:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKfgCeIrkekN; Fri,  3 Apr 2026 17:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DECBD410E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237308;
	bh=fqSAUAWNTxwlyV7DbdRiPmu50Swr+I1uxf383HWCKkk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E1+exjH16LEULpWpXowduYefXgAzWrgHqHk1BNSjC0bPkDyfzmXMhyqoX7J3hdb7y
	 yyLJfk1urdH4Z87oCJxDARdGXzxRaDZl/8Y9G5+grEDSkEoVILymi4i27cCopamKO2
	 yLV6Kke7G09d5flfSuykctkAlLWL+Xinl31F6Pg6hHo9KoK8SW6TmkFVQrUk+TZOT8
	 rkfeHFxbg8GNs4498P5yV3VfiI4oHk6r/G9p0nFgsDVQu9qk2BzhXb3pVSRNZHCmTe
	 +IJ2Cz/qP88BXsF4pO42biQOHApBJQt68tGGYfslsECZsiVzgzM4DMxXIyawAqMMdO
	 p2zYgTTk7pN0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DECBD410E7;
	Fri,  3 Apr 2026 17:28:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 381EA2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 242D760E9C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNi6wIKOyh-t for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43E2460E69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43E2460E69
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68592800C3; Fri,  3 Apr 2026 17:28:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:26:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ba7970b83f27cac5b8ebe743530b8f70a4cd6e4
X-Git-Newrev: 545de5af036737a5515b3f17259ee2a12f889db3
X-Patchwork-Hint: ignore
Message-Id: <20260403172826.68592800C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.6.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/545de5af036737a5515b3f17259ee2a12f889db3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceforge.net/p/fetchmail/mailman/message/59316921/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 3a762971f3..0dfe404f93 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59270832/
-sha256  a5109295ec3319e0e45edd009d2d977042a8326ab52c6a817a82fa987103e4f3  fetchmail-6.6.2.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59316921/
+sha256  246e5fc0e35c93dde1a3fb66778e3ab700e16809232e4959c508b91214374bb2  fetchmail-6.6.3.tar.xz
 # Locally computed:
 sha256  a502ffd59034feee7e924b29500451b984992ae361bd8084736afc470f32135a  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 6a63752d48..00c816cdce 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).2
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).3
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
