Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5715AD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC1A815B2;
	Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0ohI6x4qhbj; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39FAB81154
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337933;
	bh=UqNuAhxmb5RPukwlmSqIF+ruoTb7MDS3/MHEknp89vQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HLq89F8hvoWOIsJpFQ9QDO9d8c2wAOk7zh8CDOT6u5M4sQxh6Dbq7ikc4YEE97fWz
	 MLPIiJ/qKxXm/rYZs7LGmMIRZrlI3u89hDUMlJkdZvviJ1iZbEzTL/ZxvHrLRLgOb2
	 DS3mscpsOZUYfbPy4cjHEQ1B8mMS8Zcjo3cTHFHB4kCVkFiYZniS677p8BoaGkC1YK
	 8YGic51mJQx7SK1+mIxW+5LSgT/kqovlVkNiV4apGxfKPt+tEt//ab/TrF7ck+AfEy
	 GdDtFhcbcSWz+q4UGUNJj6aIyKTcyvSHMu8CTtzk5EXih9LWM6xZ19yGmV41ES+dAf
	 dBEIqrouo80Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39FAB81154;
	Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 631D01CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64B7860BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNhOrd-aQv6G for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B65960D72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B65960D72
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48E2E88570; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a03e4637ca08531c3b35b936c9fc143fcb9bffb4
X-Git-Newrev: ccb6eb87e5833b6b2324b8b65997749d1b26f22b
X-Patchwork-Hint: ignore
Message-Id: <20260113205845.48E2E88570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/libxcb: bump version to
 1.17.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccb6eb87e5833b6b2324b8b65997749d1b26f22b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2023-August/003415.html
https://lists.x.org/archives/xorg-announce/2024-March/003464.html
https://lists.x.org/archives/xorg-announce/2024-April/003507.html

Depends on xcb-proto >= 1.17.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: switched _SITE to URL mentioned in latest release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/libxcb/libxcb.hash | 6 +++---
 package/x11r7/libxcb/libxcb.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.hash b/package/x11r7/libxcb/libxcb.hash
index 2e2179e8da..b93b0ba524 100644
--- a/package/x11r7/libxcb/libxcb.hash
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-May/003164.html
-sha256  cc38744f817cf6814c847e2df37fcb8997357d72fa4bcbc228ae0fe47219a059  libxcb-1.15.tar.xz
-sha512  f6c7d766b7cf9cab6abe948ee424cbae6951dbfe2f76fa58a109cdc05b0f0919dcc4e38176a22ff4b95fc1e38596115317e32ba33b24cae0035a4e30dbcbdad9  libxcb-1.15.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003507.html
+sha256  599ebf9996710fea71622e6e184f3a8ad5b43d0e5fa8c4e407123c88a59a6d55  libxcb-1.17.0.tar.xz
+sha512  945b1f28e8b407a4d0ebf88c99ef3cbef763fd75e6eaa8e971946e44ce8dbe9b478c56ae85aaaadab7fdb25987e88570d9d4fb9ad2febd6d6bf21d644a0e10d0  libxcb-1.17.0.tar.xz
 # Locally computed
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 4b293f9801..7a3c28a0f9 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.15
+LIBXCB_VERSION = 1.17.0
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.xz
-LIBXCB_SITE = http://xcb.freedesktop.org/dist
+LIBXCB_SITE = https://xorg.freedesktop.org/archive/individual/lib
 LIBXCB_LICENSE = MIT
 LIBXCB_LICENSE_FILES = COPYING
 LIBXCB_CPE_ID_VENDOR = x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
