Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58068C5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 09:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76F9760DE6;
	Sat, 15 Aug 2026 09:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5b2xO_YbDdw7; Sat, 15 Aug 2026 09:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 645FC60E19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786785670;
	bh=2PTHCx3aNRmTCLleSe6kNYT2IvY16oczAw5jXyBwKEs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HJRgkyBIA9/613SpaqnO8hORE7RBt291yLWmS6szc1k06o77c93S6+2kX9VQ0ZvaJ
	 2LZjG7C6JIjCEtmLmElWtxAOkpmWNmrITmVe488bKT+M690ttVTzkAooOeFn0tVZid
	 P4R5YwWWz6LmQeyxg2EYnmaxQfwev2CFC4mmBaZQY1a489YOHLhpetStK94ndCgPQp
	 HV1mmT3WCj9dO18UzXDcf2lmdjJR1fORI+kDn6ZA7H0/UYl9T/nCn20zLa3f/5wzm5
	 /IriG6+G9OVTuF1wjP291uIVr5min1uPM5D4Guyz05QlEVxpuC63XUkLfqE7Um/1H/
	 Fk568uiGu8XFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 645FC60E19;
	Sat, 15 Aug 2026 09:21:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9029B1393
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8194C409A0
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQrRF_3VMOFm for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B192D409C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B192D409C3
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41396884C5; Sat, 15 Aug 2026 09:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 11:16:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7f835a4cb96c8e1f084ad0950e28df6bf11bce5
X-Git-Newrev: 55cb1e8eeab72d9c4bd17c24de3c13aa97c43e97
X-Patchwork-Hint: ignore
Message-Id: <20260815092010.41396884C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpeas: update project URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55cb1e8eeab72d9c4bd17c24de3c13aa97c43e97
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpeas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpeas/Config.in b/package/libpeas/Config.in
index 33fae14d4c..a9ab94369b 100644
--- a/package/libpeas/Config.in
+++ b/package/libpeas/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBPEAS
 	      Python and Lua
 	    - Simplicity of the API
 
-	  https://wiki.gnome.org/Projects/Libpeas
+	  https://gitlab.gnome.org/GNOME/libpeas
 
 if BR2_PACKAGE_LIBPEAS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
