Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA73CD5BB1
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 11:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCEA2411E2;
	Sun, 24 May 2026 11:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0n7j2gYBJce; Sun, 24 May 2026 11:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5148411E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779622891;
	bh=farcW0JJCPEUoriAROe9LhnP0AWAWMHy2WqxvUgvVhw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m+b0EXranboC2ABHy+4mlmkUzeKukrEniT3DIijq3MMk+piYrLQGfXZIUxlqZ1JDY
	 MxfDXJUcwtimriWSl72n7qa/4h5RUZPURu6qhlJv1IcgJ6YhI2wZqpwGc+WNpHp/e8
	 PrDTsjB/V9iKRkK66KGsua3l/XIyN0fljeDh1cbkb0zQnttPGpX3eIbI+Tj6u53hTh
	 F1fobq6lriK+RG2kbxe682/N/Bn91jqle6dgnGTHaYgISGxm7UWxXBpvE76XWp7eHH
	 Nat4aq/a7BnEheb+wb5By+32YxfvQdpfLoWLc6D07mPu8G3tezSrSZzSs29I/D2YFA
	 SgfzU6d7VJjzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5148411E4;
	Sun, 24 May 2026 11:41:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53EF3265
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A2F960E61
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRjETSid0hCW for <buildroot@buildroot.org>;
 Sun, 24 May 2026 11:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B4F60E4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85B4F60E4C
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:41:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C2AC86D7A; Sun, 24 May 2026 11:41:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 13:35:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1140401f6832f42d0c0c92f1e03c53c778576a1e
X-Git-Newrev: a630ba2e32c324f08cefb3a810215450f6e4167a
X-Patchwork-Hint: ignore
Message-Id: <20260524114118.6C2AC86D7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libpqxx: bump version
 to 7.10.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a630ba2e32c324f08cefb3a810215450f6e4167a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/jtv/libpqxx/blob/7.10.7/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpqxx/libpqxx.hash | 2 +-
 package/libpqxx/libpqxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 067a2c8d2a..42c7941795 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e578677d0c1b0f7ad37ac2d9ac373bc9738a3732083c70672da5f2c3028e6b03  libpqxx-7.10.4.tar.gz
+sha256  8c09cf20d57695621376f34d6da24c2c40c28408ab3b7ca92dc661ff9ad4b906  libpqxx-7.10.7.tar.gz
 sha256  2ccd31347a87796860a6600f57bf97ff4d54c203ecce4ea040425ba79774cf5f  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 492370f7f5..3781128c5c 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 7.10.4
+LIBPQXX_VERSION = 7.10.7
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
