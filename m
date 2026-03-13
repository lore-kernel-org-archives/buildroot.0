Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41046105F7B0
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CCFB60F4A;
	Sat, 14 Mar 2026 07:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmURChG5EIAF; Sat, 14 Mar 2026 07:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E93D60F41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474595;
	bh=vxldj9UGHMNbQwn8rRsVZlWsR6VN/SYFEZU5JmkPrc0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mJRysFzKm1aZUgWI8CYemaU1ECl8mcrgBCYf6D3GyF4DNMGCEkRN7O62vhn8HwDIg
	 YNIoKrBP7CovvojSY/AhWgUH1HsM5ziBzZlQ2TCX5kWaJQx5RpLSJrCCHNwW5gkp9X
	 rnGlqfOI8CbPPJmvT5uSPsmjCRTKdk59BpfvOO8NFYEG1LKbGnhRG1bksmATBCF6ka
	 0NeGHL+DvGd6MU4D3CB3gGLGjeXVO/9a3k+UwT6E+EqYbG4x8JVKFXea9dKpbn++GI
	 J+UCYVi9X+aFbO6Olebx0Q+gvhYrf4E3blzoC5zU5q8m7eJenbymZT092b2ywOqtpZ
	 Gp2z1jJCPGeuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E93D60F41;
	Sat, 14 Mar 2026 07:49:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BA36201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0494360ED9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtqDizTmWVll for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA64260EEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA64260EEF
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C33486102; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:09:57 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4e594d0eda67aeb5af0bbac803ee26967e6b7372
X-Git-Newrev: bbbad699ae7d4a3409efaf97c47dd491d4eeca7a
X-Patchwork-Hint: ignore
Message-Id: <20260314074936.0C33486102@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: remove Bernd
 Kuhls from libldns
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbbad699ae7d4a3409efaf97c47dd491d4eeca7a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 156e2be96cedf904d973748b8ac5d4423a0f74e6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..491f02ab73 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -430,7 +430,6 @@ F:	package/libhdhomerun/
 F:	package/libheif/
 F:	package/libid3tag/
 F:	package/libilbc/
-F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
 F:	package/libmspack/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
