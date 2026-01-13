Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F7CD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C17F660F45;
	Tue, 13 Jan 2026 20:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtNxgR3dhFUY; Tue, 13 Jan 2026 20:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2D5660F48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337985;
	bh=qcnj29N3sj96xohHSKPOrM9Om5hfeOLbiHxZrqtUfDA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TkvvAJ8LfThlNcu7xueD4mOsu505UD+yCwLdoMAJPC8P+XQasNtIK+3al3n2KXDgg
	 1FdGdk5mcX3UTO8yNLeqzl/85OjVUTtrWkBzsiK0N1tY6Yz46WSXf1raTtSeiZ6/Ir
	 IkKCvhPgVhnO1ELo2DDlvs4VWFOpB+UpBQVXWXJVZlWOHPXMEX3uMJab9/kwmpHFu3
	 XQ/FOX8lyj4nNhaSzukLaLpiHVSYAUPs6lkVGOPlXYQH0WWX0B2opX17mkVyZpIszm
	 gIehqqKGcMmYe0fNZtHrBpvtvJkvB9TtdiPSc+qbKcDx58sv/mqBI3Wcft0tVfDwNp
	 W1ncZhkE50rjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2D5660F48;
	Tue, 13 Jan 2026 20:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8438231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A8DC40757
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1zRnZchN_e7 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E824407A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E824407A8
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CE1181382; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 765fb71dfdc84be745ec25e6550e6d825604007c
X-Git-Newrev: e5fe3770c8ec7a7ce6b0e863cfa804ad68e2f4fd
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.2CE1181382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-mach64:
 bump version to 6.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5fe3770c8ec7a7ce6b0e863cfa804ad68e2f4fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-October/003538.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash  | 6 +++---
 .../x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
index e33036f4c9..f20c6b754d 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003183.html
-sha256  50d78abffa7c8227e6f187976f23a244ae2095e97f08de275529b70fba9481ba  xf86-video-mach64-6.9.7.tar.xz
-sha512  a511525ceb8eab95d28e815f462897ead8b99ac455c548598cc061907636e1acff8cad66621feeb33558dbfdbf59ca0648422aae8edaab7d1dcd7e386348177b  xf86-video-mach64-6.9.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003538.html
+sha256  d6b96b47a27cd2dc6dea612f5dc51fcc1a8561d5ad1d48d04ec2d47751222724  xf86-video-mach64-6.10.0.tar.xz
+sha512  1f40114062e320aedaeba5e68e08fd747afc45c03cb0cc4445cdc5ba94aa65b71dd63a19741d0e3dab34cc3cd914d991fad4350fadf39192d753817ec2011cdc  xf86-video-mach64-6.10.0.tar.xz
 # Locally computed
 sha256  a7d68021893bced0d709338a59a137c74b11e624880e110e4a2f14ccef475120  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 2e41208ab4..f9ec3e66ff 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.7
+XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.10.0
 XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.xz
-XDRIVER_XF86_VIDEO_MACH64_SITE = https://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_MACH64_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_MACH64_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
