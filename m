Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97755C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B4A8409D4;
	Fri, 10 Jul 2026 16:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fok3KgymbDGy; Fri, 10 Jul 2026 16:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16270409DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701852;
	bh=X3KLhAxU0FzzBqwA8krTc513iK56jlVRO8m6QFd4X4A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sqdMJ4v4E2lKwSiICMV9rKYygK4T0hSjZKAssJDj5VLzARxLkNwsNFzKlTWmLq3nm
	 IzOZIb/DkGMFzMLE0lpJjfkyVK7l9gJcN4OWlWTBbzNeuYTfUaS5i5dAPkvX09ReWJ
	 ebdXN4+2lALSSf11aANXj2hehuMF7PskDWwDtHOu3Sjsjy7lAjM/Knti7Ie4cgYsjG
	 MNLshbhcZRkBl9mzcWoUmDfSrz0lgCb3iwkRpXvA21wY2GOpH/xW1uKrnwCqQwwabk
	 SXXG12a/JsHVec1NrCzUgAuWgkqk8wrF7LMObOBRTBmZVAvZosLHyfWvKv+SOyzUzz
	 Lv9f55DGxdWWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16270409DB;
	Fri, 10 Jul 2026 16:44:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FC94320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82939810FA
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lgj4EB6Gk8Wn for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B22FA810F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B22FA810F8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D662C886A4; Fri, 10 Jul 2026 16:43:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:42:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2612bf23e5ce52c5e877351c13121cc6e6c2275f
X-Git-Newrev: 9f469f24cbd947e1094483dde9038b82c9549d9c
X-Patchwork-Hint: ignore
Message-Id: <20260710164336.D662C886A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvpl: bump version to 2.17.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f469f24cbd947e1094483dde9038b82c9549d9c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/libvpl/releases/tag/v2.17.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index 08b2de31fc..684de90837 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d60931937426130ddad9f1975c010543f0da99e67edb1c6070656b7947f633b6  libvpl-2.16.0.tar.gz
+sha256  4de3e2faf1e8307fb282e4a43f443191810f6a6b0a484fffa7995ba1c814c6ec  libvpl-2.17.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 4e3c4807cd..e5ab9ac8ee 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2.16.0
+LIBVPL_VERSION = 2.17.0
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
