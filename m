Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8DFE9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 901B161295;
	Wed,  4 Feb 2026 17:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGmmfXjxcsZ8; Wed,  4 Feb 2026 17:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 714A96126B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224948;
	bh=1e/7A9Ue3qkpLY7xfk2CJNNKCjMyV3Fur4/AgMpcWMs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HiIV9pCvaydyyDLtgYiJwTWA3XfplaNm/6sKwtp8jCy+KgEmYdXeAbDlakdmw4xA/
	 rAgir/kVTFZmm0nDavCpvvlVYgFFM48TZRWGNtbx6qfKa/iTmQZWEX1+0xuPF3hCbr
	 Y1sEANIs5zcm5uhYuZL8Vo70OF1vY0IUzORfhHvsqe4yIdU/U05srfoqzTYwrT0kKJ
	 2aOa80dd0SehD7PgaAMJQNiYNnxrUtzB43WA8wnlhGBofdNOUdzoam9fFHUpp9H8sq
	 SHe+9l97XkE8JTPWBRPAFxhSv+SLR1qTnhEcV5Eh3JsepQLI018yrndLEAC5hsB5ij
	 ghy87pSiToE9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 714A96126B;
	Wed,  4 Feb 2026 17:09:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 444E1173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 532B74056B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIRlXTzIRCr5 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4D7340563
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4D7340563
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0CDA8697E; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:31:54 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 019e1e062a2cbd86c82068d2188193a6bc5e02a6
X-Git-Newrev: 5c36e119491db230aa04d919514403b1a346fe18
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.C0CDA8697E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/samba4: bump
 version to 4.23.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c36e119491db230aa04d919514403b1a346fe18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

https://www.samba.org/samba/history/samba-4.23.5.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 612c27c1918d1a199c0eb4df0a60ad9c72eb1dc6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 363c6c26eb..cc07b2527b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.4.tar.asc
-sha256  af429d078a86f1ce16d0d1ecee35c42a3610790b47b84468f31284a8c4060140  samba-4.23.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.5.tar.asc
+sha256  593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f  samba-4.23.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7976e9ae05..5d9eacef90 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.4
+SAMBA4_VERSION = 4.23.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
