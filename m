Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B05CD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 20:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737144103C;
	Tue, 12 May 2026 20:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVjOs_DCPc1Y; Tue, 12 May 2026 20:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F74041029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778616192;
	bh=sa7NJt+OQnqZn3/XS8PjXOkvDrVmT5aMHYG50YJ/Jz0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hZUTzYcvodJoVJ9V24JynQUeGIpuOjohMu5JxS6zi/HQn9KS0UHuHfW6J5I3j2DMu
	 7rSrQ0rB6+TA2VB6hDfRT2txvU4yB8j+pf4dACLMaD0TwpcRoG5c4BlOztz4Vagwpj
	 RqzlvSCinIsGuvd+bu0EBOjax/esWXySHQ/ttl/suG35N0xV27wgpeAI6NF0zQq+7Q
	 4NSlbVVBKtK33Tobn4QVf4QyDa0W+WB9c9tJfwFrk0sptclQoquYkPiSMCyflC6oDK
	 P6V2U6aKWvHIDHyd5epU5GqwfH5Wccx9z9LuF6w4wqTOyBe8p+fjqOj/C1Zae6fLL2
	 qNYxQPrRqctWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F74041029;
	Tue, 12 May 2026 20:03:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29441219
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F3D9406DF
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjr5sg0e_34N for <buildroot@buildroot.org>;
 Tue, 12 May 2026 20:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4037E406DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4037E406DE
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:03:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1E0985FC1; Tue, 12 May 2026 20:03:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 21:45:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e00d34dcc95eb8f0f8a35a81483cbe18d3eccfc6
X-Git-Newrev: 7bebe8f567a15015d53557f79e609ad63265f5e4
X-Patchwork-Hint: ignore
Message-Id: <20260512200306.C1E0985FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: security bump version to
 4.24.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7bebe8f567a15015d53557f79e609ad63265f5e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.samba.org/samba/history/samba-4.24.2.html

Fixes CVE-2026-40170.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index a8edb75297..765ccdad55 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.1.tar.asc
-sha256  217151ca318a5576f8e0de72ba0acdf08157ecf12adac42d1af86db0b09a5f5a  samba-4.24.1.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.2.tar.asc
+sha256  ac24583f271a82ac324f7c6fad7327f65b591ad3492e1dccfee988e2c1c81dd1  samba-4.24.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 295571ccf2..2a151f4f61 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.1
+SAMBA4_VERSION = 4.24.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
