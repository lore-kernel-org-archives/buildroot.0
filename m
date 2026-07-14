Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D3EC44507
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9C5E60756;
	Tue, 14 Jul 2026 09:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vO0WgxIknJf1; Tue, 14 Jul 2026 09:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0436607DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784021090;
	bh=snWyqK134JkifQ29kvLtALLV4nfs3KUQkLg+WpElXZo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UYkHh1FnIVf9l55ilVf8RdlvALdEdoQpE73b3tnbkJGpKxtnp8trE6gLJFEpIYXoy
	 4gFcCVmJlR8zcTGVSf2/ifmJksPsytzK56dLWpthm3eFD9mPE4l6tir084HwSL6/FD
	 +n+mxDKd29nadsnldqF5Hfe4CKsngEM7E6h75cnnOysRGxHHJf7UYhVaLxs4MzPNON
	 YVb/hasrOPdb0j8CFUDUREg0WQJzZgrepjNLN3JcSHDMeX3f6R1kiKw8+QlmBLmKGy
	 /kNbXCG7mPxZcDkUI4co6UC51emnwuTj+ISVsJT7mEFJd+EmEutfsjgRIhG3ibo9GV
	 nF1OPzs+cKBDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0436607DA;
	Tue, 14 Jul 2026 09:24:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8C149CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B112D810CE
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9A6GhpEDTs8h for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B48880EDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B48880EDC
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:24:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74B1B88857; Tue, 14 Jul 2026 09:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 11:12:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f543cfcda61d54e5007a885ee630cd218f1591c
X-Git-Newrev: 0a86946befc18241d83eeee026571dd15c900d22
X-Patchwork-Hint: ignore
Message-Id: <20260714092414.74B1B88857@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnpupnp: bump version to 6.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a86946befc18241d83eeee026571dd15c900d22
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html#LIBNPUPNP-6.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 9e4f211ecc..74d8fb685b 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# From https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-6.2.3.tar.gz.sha256
-sha256  563d2a9e4afe603717343dc4667c0b89c6a017008ac6b52262da17a1e4f6bb96  libnpupnp-6.2.3.tar.gz
+# From https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-6.3.0.tar.gz.sha256
+sha256  082d999178291ed45ae24c3fd9e781120d3ec94d61d11121e5bac90c69365cda  libnpupnp-6.3.0.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index 38b631fe58..97fdb6a5b0 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 6.2.3
+LIBNPUPNP_VERSION = 6.3.0
 LIBNPUPNP_SITE = https://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
