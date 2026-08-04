Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DBCC55838
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 12:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5564760773;
	Tue,  4 Aug 2026 12:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnre987huQ3o; Tue,  4 Aug 2026 12:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2BDB605FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785847725;
	bh=AnSmzb4bJGVapChgmqPbXgRJ1b4cpbOAtTAc6zIaSXE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GJ+582uSVsL6vDhlNDv1rChq9Ndb9Nk2pjDw5NG3M3OGbn8yrR9CUZh0uNOH2bvva
	 EMkDjyxI5lXw+eTBWD4FwLbUzTky/hr5yGqFpBlY40qBPBay4iOeqAQnN2gtfWYFhI
	 L68OUh3J2MIyANtqICEASZJ/aKOP/miKLy9AVms+D0+iLdlZzhEhuIOjid+jCGAiLd
	 2SBj+SC0TOYMJ1ZCsD9IUV9Ny4IX0dNZGnT+V6FMcGEdeO6O7Tvo8a9DH31cIgxvft
	 HNMIPfm1BTz11Q4uT57YNUdX9M3UMP+tcpmfmAHAi8qyR47BVFyU7NRF1C5qLrlgeP
	 B2uhv5pqwLP5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2BDB605FA;
	Tue,  4 Aug 2026 12:48:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 571F52AA
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 492BC605FA
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUJMp4G_iP3H for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 12:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F275605E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F275605E3
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:48:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54FFC8B905; Tue,  4 Aug 2026 12:47:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 13:42:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20d816651cc8b15f43bd4c95fbe8d8babe9e8dc9
X-Git-Newrev: c92dc611e51b9fea493998676f99c0d55e39967e
X-Patchwork-Hint: ignore
Message-Id: <20260804124756.54FFC8B905@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: disable sysprof for the
 host build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c92dc611e51b9fea493998676f99c0d55e39967e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Whether the host libglib2 picks up sysprof support depends on whether
libsysprof-capture happens to be installed on the build machine, which
makes the host build depend on the host environment. Disable sysprof
explicitly for the host build so the result is deterministic.

Keep sysprof enabled for the target build: it is useful to profile and
measure the performance of applications running on the target.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
[Fiona: also apply to package/libglib2/libglib2-bootstrap]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk | 3 ++-
 package/libglib2/libglib2.mk                              | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
index 665f320684..1e512fd7ed 100644
--- a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
+++ b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
@@ -72,7 +72,8 @@ HOST_LIBGLIB2_BOOTSTRAP_CONF_OPTS = \
 	-Dsystemtap=false \
 	-Dxattr=false \
 	-Dtests=false \
-	-Doss_fuzz=disabled
+	-Doss_fuzz=disabled \
+	-Dsysprof=disabled
 
 $(eval $(meson-package))
 $(eval $(host-meson-package))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index cae8a85a28..ae4b653a15 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -30,7 +30,8 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	-Dsystemtap=false \
 	-Dxattr=false \
 	-Dtests=false \
-	-Doss_fuzz=disabled
+	-Doss_fuzz=disabled \
+	-Dsysprof=disabled
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
