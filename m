Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D60C5DF6D
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 09:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBF346061C;
	Wed, 19 Aug 2026 09:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5EVZNxbc51HP; Wed, 19 Aug 2026 09:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787133282;
	bh=22HzbdV2VQVrUuniOKfGWeYXeqPTUSNTAVImx6Vae94=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o2D5tEwveO04BtVlP0fR1iv2H1NEHLKD+9racS91kXO8ovB27ZPXvBU9b7dW7xTGh
	 XVoiK4Ge6SmtUKYgHUy8NEgtq8Z6IXVQSsRkui7iSaxXt5Dq1lnhuXaFbvAc1Vk+bO
	 QSCTKfUSEd6yVd6YPkZmyiKEYOgDKiD5slVYNTOtXMa00wZKKJ+oMgRG3Vo41lv5ko
	 NUvMokKce08ryeSyYKARW+W8aLXEoY1EIsJjL+dw5TzYE147vdQdYCzwL26axGOLgV
	 ynvEPMGJ2KwVb4vskQJqvpa4crD+rL2LUnpo/5Wi4Yr+6z3+hy66Bu1zJb4I+eIa+x
	 11fP1y6dVaNfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D36D86060C;
	Wed, 19 Aug 2026 09:54:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93C5A1EA4
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A1AD40077
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxhm-QVyBN4K for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 09:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC84A40042
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:54:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 573178DC42; Wed, 19 Aug 2026 09:53:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 19 Aug 2026 11:42:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7aba8ecc6aa74cc9c2604ac3bf5548d0d6c2687e
X-Git-Newrev: 93049b2559b4e87a6d03cf8c1b0125ffeab86477
X-Patchwork-Hint: ignore
Message-Id: <20260819095347.573178DC42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udisks: security bump to version
 2.11.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93049b2559b4e87a6d03cf8c1b0125ffeab86477
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This fixes this CVE:
CVE-2026-7867:
https://github.com/storaged-project/udisks/security/advisories/GHSA-j42g-v9jw-6ph3

Release notes:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 8a70b90a67..f9ed24c823 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e88c52bae02fa13414604bbef42c6bb91c2e24177ee0057ed55c6bd7451bcb6d  udisks-2.11.1.tar.bz2
+sha256  18630a8aad806bea0bc626ce97e71e50ec82c742956ac1c834a4275f8f22207b  udisks-2.11.2.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 43d066c9e1..0203d037cf 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.11.1
+UDISKS_VERSION = 2.11.2
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
