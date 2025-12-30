Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628A3EE4999
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C0B060C0F;
	Tue, 30 Dec 2025 18:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCiW_sTGlyCX; Tue, 30 Dec 2025 18:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 457FA60C05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118374;
	bh=SZB2Yx8MN6aigJrj99iqy+xrW6F4QBClMOriahV0dsQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eJ+286ONL6XYu2NQua7F66+1kx2R/WedmfNNfP3BncLv0j/99bECSJC6hivNekRFJ
	 cjW6JhY20C19w7cAhp3sVob7YtF9z5dDS0pYF0duIGTw98t34B9edc2pz3VBBIPbrC
	 2becGJf9XTbZTWDLGEJMccazih7YYEx0oi7Ojvc1QQfu9oB93Wbt92x82hQ9jwd2r9
	 DCCvRZ+HTmNcINUEV9rG4ypGBBwKxKOY9TUOm/4AdKCesj9kiryLK9B1YWUr+krM+v
	 47hXFnOQYrpR8SWWROvszQfyJetM9ML1OnzNZc/wFEXyPc+lzHDgUGacyUWrAybq38
	 lFG1JpB6D2oFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 457FA60C05;
	Tue, 30 Dec 2025 18:12:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 024FF277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B472403F4
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tTXbn6vJbmH for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D63A4043E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D63A4043E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BA6287C3E; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6db6af9ffa7134b1f132dfd07dd53e7138e86b6
X-Git-Newrev: f306a3e82f6dce6bb22b313b8818d9c84beece03
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.4BA6287C3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtkiostream: remove optional
 dependency to opencv3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f306a3e82f6dce6bb22b313b8818d9c84beece03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV3 is unmaintained and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gtkiostream/gtkiostream.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
index c748c7a000..250e47a0a4 100644
--- a/package/gtkiostream/gtkiostream.mk
+++ b/package/gtkiostream/gtkiostream.mk
@@ -47,10 +47,6 @@ ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 GTKIOSTREAM_DEPENDENCIES += libwebsockets
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-GTKIOSTREAM_DEPENDENCIES += opencv3
-endif
-
 ifeq ($(BR2_PACKAGE_SOX),y)
 GTKIOSTREAM_DEPENDENCIES += sox
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
