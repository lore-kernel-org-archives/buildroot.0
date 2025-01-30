Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6633C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 353CF4F24B;
	Fri, 28 Feb 2025 17:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz9MFKiUDxby; Fri, 28 Feb 2025 17:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F1D64F007
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F1D64F007;
	Fri, 28 Feb 2025 17:06:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F36F68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA1E044969
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yH0ED2yFRr3i for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 245044199C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 245044199C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FBDF87A0C; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 30 Jan 2025 21:46:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6299f479d124ebe01f12f4044e2b978463cbc3b6
X-Git-Newrev: bec79ce8bbf0165463869dff5769eeddb6d7196a
X-Patchwork-Hint: ignore
Message-Id: <20250228163023.1FBDF87A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bind: security update
 to 9.18.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=bec79ce8bbf0165463869dff5769eeddb6d7196a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See here for a changelog:
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-33

Fixes:
https://kb.isc.org/docs/cve-2024-11187
https://kb.isc.org/docs/cve-2024-12705

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien: add direct links to CVEs]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index fd83196e5a..50247bcf37 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.32/bind-9.18.32.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.33/bind-9.18.33.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  dc840cdf9d54578d98400f2edf7008b1b33a1721be6e490eb1e42d0d11d9cff4  bind-9.18.32.tar.xz
+sha256  fb373fac5ebbc41c645160afd5a9fb451918f6c0e69ab1d9474154e2b515de40  bind-9.18.33.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index aa3c3222f5..350f6c6fbe 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.32
+BIND_VERSION = 9.18.33
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
