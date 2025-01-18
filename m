Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F008C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 11:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CBB984CA7;
	Sat, 18 Jan 2025 11:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQLp9Ve6U3Z9; Sat, 18 Jan 2025 11:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E14284C72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E14284C72;
	Sat, 18 Jan 2025 11:54:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB4972F96
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B66F40386
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjXeClf3qjrl for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 11:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96A9040128
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96A9040128
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:53:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F62485D17; Sat, 18 Jan 2025 11:53:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 12:48:20 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: fcbe9c41de39fa77316f6254e15b9800f2b62e67
X-Git-Newrev: 32a5fc983084282d8e7275aec80ddcee192f35fb
X-Patchwork-Hint: ignore
Message-Id: <20250118115358.7F62485D17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/bind: update to
 9.18.32
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

commit: https://git.buildroot.net/buildroot/commit/?id=32a5fc983084282d8e7275aec80ddcee192f35fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

See here for a ChangeLog:
https://downloads.isc.org/isc/bind9/9.18.32/doc/arm/html/notes.html#notes-for-bind-9-18-32

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d92b592ce145761b8b73a88c9f00fa5928b62a18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 6 +++---
 package/bind/bind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index abcbf0a938..fd83196e5a 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.31/bind-9.18.31.tar.xz.asc
-# with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  51b258969275c5206ef745a5aac03dbe98f1c8031fefed378d53597e7987b1b3  bind-9.18.31.tar.xz
+# Verified from https://ftp.isc.org/isc/bind9/9.18.32/bind-9.18.32.tar.xz.asc
+# with key D99CCEAF879747014F038D63182E23579462EFAA
+sha256  dc840cdf9d54578d98400f2edf7008b1b33a1721be6e490eb1e42d0d11d9cff4  bind-9.18.32.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 52b1e56c40..aa3c3222f5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.31
+BIND_VERSION = 9.18.32
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
