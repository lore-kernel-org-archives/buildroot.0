Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7559EC61DD9
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 20:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2A53605E7;
	Sun, 30 Aug 2026 20:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyxEPZTjMNPb; Sun, 30 Aug 2026 20:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788122775;
	bh=v2qYIE0C9Y06mf8XPBZlyDa5B6Cy67uypEd42sHe5QE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N3aXH6MdbYk/JHTss5EE/09qJIHtHNSHCmg8OLYMtT96qI8DVm6uNB6GXfbRXcZPi
	 brFXS7/jFcMhfQsRYkH5xKsMIRg4vtOtmtBnZgLAkcjpAKXFDgjTACyTzJZDuG57a2
	 3Beb1gff/SwDcBnjCecWfTrr5ZJ0LrG6p3L7Fxgk/asljMnqU9CUTyHYZe4CjBMB0k
	 ie+Z67p7oAUXq2LVgurOQmqSzJRWrDdrW7r9UJG/XM4XwjT/Gae1hR51BosbxpZCXH
	 IakXRbfKgZAarGny3qDSKX77bX5u+jWKkgeW1V59JtBXsKGC6/soGtrWYS2YnuW8FP
	 TEI7jjJLdkJ/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6787605D9;
	Sun, 30 Aug 2026 20:46:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16CC72AA
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 20:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0F88809B4
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 20:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJwjVpm86PRE for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 20:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CC77809B1
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 20:46:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9BA6924E9; Sun, 30 Aug 2026 20:45:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Aug 2026 22:38:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bd5918183ee656448252e0a3eec978c184ee36b
X-Git-Newrev: 911dc3a5d28ca33a1e44358a5c4760a6eba1f9ae
X-Patchwork-Hint: ignore
Message-Id: <20260830204514.C9BA6924E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libldns: security bump version to
 1.9.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/911dc3a5d28ca33a1e44358a5c4760a6eba1f9ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://community.nlnetlabs.nl/t/ldns-1-9-1-released/3403
https://community.nlnetlabs.nl/t/ldns-1-9-2-released/3404
"Please do not install ldns version 1.9.1 as it has a wrong .so version.
 Install ldns version 1.9.2 instead."

Fixes CVE-2026-10846.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libldns/libldns.hash | 8 ++++----
 package/libldns/libldns.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index b8bb3f55a5..c346fdf154 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -1,7 +1,7 @@
-# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.0.tar.gz.sha1
-sha1  9cfe5623dcd40cee0e480b438318c3c4a26c1ecf  ldns-1.9.0.tar.gz
-# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.0.tar.gz.sha256
-sha256  abaeed2858fbea84a4eb9833e19e7d23380cc0f3d9b6548b962be42276ffdcb3  ldns-1.9.0.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.2.tar.gz.sha1
+sha1  d197d9fb46e1802a7160368b38bf063b493f1be1  ldns-1.9.2.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.2.tar.gz.sha256
+sha256  b524fa21994b6e834200ceb8c27f1b84bda5982fe35706f058196c079db94d5d  ldns-1.9.2.tar.gz
 
 # Hash for license file:
 sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 92c379f37b..13fe854460 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLDNS_VERSION = 1.9.0
+LIBLDNS_VERSION = 1.9.2
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = https://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
