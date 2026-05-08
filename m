Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7ACCD3447
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 10:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D89DD615CE;
	Fri,  8 May 2026 10:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5QekrTdIRoi; Fri,  8 May 2026 10:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE0F615BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778236697;
	bh=4LPxz1gIihMnDJa9p88AyAAtI1Yt/xoxlNSXH7d1y2c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MddmbiG1VvheTpWL0C86RXHIBVjMZkmCLWBRdJHCJui4qPyT1fkYdLDDPCJIjhqKG
	 t3v7llPjlGX9Pkl/DKZ1rkN2Z+J6EiNMstmDl8vtaLf1JJctbVmOLZRX+748VOmegZ
	 gc2/KeN5jXwaYgDlWQssdZtKVeGUopyW4vrCH7Szjbb0NJwXgs0YO13PiMRShvVQxp
	 /rfDo86J90bb0KpUzbkOueHl9gl4NcQru48jY+aT+bW0grxVyPLYEgcNjLAZ1i/kda
	 lr6GSL/VU+JwBFQyEdbYtLcUvAW33b5iwCE1ZdxuY9evVGoVgTW5V7VFLsrTp489Ka
	 wts9en4xtByWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE0F615BC;
	Fri,  8 May 2026 10:38:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33EDE317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 314C0615BC
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46IlNritiSBo for <buildroot@buildroot.org>;
 Fri,  8 May 2026 10:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CC2F61334
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CC2F61334
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:38:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 596A685584; Fri,  8 May 2026 10:38:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 May 2026 12:34:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cca743c4d1b964a901458818d9eb6188e022594
X-Git-Newrev: 1b57e09eb2ff0192af6158c0bce5ee28d3e4c4e2
X-Patchwork-Hint: ignore
Message-Id: <20260508103813.596A685584@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/znc: bump version to 1.10.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b57e09eb2ff0192af6158c0bce5ee28d3e4c4e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/znc/znc/blob/znc-1.10.2/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 6ffb5a3917..128c84850c 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4e6e76851dbf2606185972b53ec5decad68fe53b63a56e4df8b8b3c0a6c46800  znc-1.10.1.tar.gz
+sha256  5b7561f3b100234d58ae4946eac0262ab305d275c094e64ae723e45d07be08ab  znc-1.10.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 3a0b983b09..7ddfd64715 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.10.1
+ZNC_VERSION = 1.10.2
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
