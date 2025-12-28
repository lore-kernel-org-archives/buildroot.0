Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38A4E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 788CC4039D;
	Sun, 28 Dec 2025 22:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vn7atvhxK03l; Sun, 28 Dec 2025 22:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7BB640678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960339;
	bh=UbvrkxLwabbdbLQc7Cl0thu2o4iT0z4+uCzICu2z3zg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fUCRZGr+XYoMpz8FBWX0AyARGhKIvJVf2oBFyVGL5Uyvd54nIX/KLzQgXK2LeiKQD
	 7Vr2DaNjJASo/yi/Hv180B8GyDgZV1Nzy2SXKWH9TH3HOV/LrRnMCJbgyk87XapdbV
	 DQXyDTj4Dq6+IerTQR828HnLjkfko6X5I5ojQOmfrOY31eLLLV4XpBUayih5v9brBq
	 dXqzjjRitRonSRo7JfNf7srwZ1fbyKk7UVrbR2MYpcnxXShLRYH0kgIX6OLnjNzFMd
	 ACQmwDjSqVqSULkl4t6yUV0WWZJ0X7hnPO4mGXqc38cqxd8GxyNT63rsu58cr+7us5
	 GnH5bBGLystZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7BB640678;
	Sun, 28 Dec 2025 22:18:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02791B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB83760A5C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dS4RdFvJp_wC for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:18:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A8AC60A59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A8AC60A59
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:18:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BFC9879E1; Sun, 28 Dec 2025 22:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:17:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82094b802877c1128b21b978466641373f283666
X-Git-Newrev: 023c735f428e1836587b9370e4c039a70543a9dc
X-Patchwork-Hint: ignore
Message-Id: <20251228221856.1BFC9879E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Bernd Kuhls for libid3tag
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

commit: https://git.buildroot.net/buildroot/commit/?id=023c735f428e1836587b9370e4c039a70543a9dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 34dee3fc7a..66ef2adf9e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -420,6 +420,7 @@ F:	package/libglew/
 F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libheif/
+F:	package/libid3tag/
 F:	package/libilbc/
 F:	package/libldns/
 F:	package/libmicrohttpd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
