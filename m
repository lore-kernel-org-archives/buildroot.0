Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0211ED6E2AF
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A0B76115F;
	Thu, 18 Dec 2025 16:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2f6w1NNdO5S7; Thu, 18 Dec 2025 16:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693F860D6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075710;
	bh=DlHFya7Rr8hjnyNiWziEqocpqSJqeZ2deZYzu+v9bYU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F1x2wYdsafkaslQsRsRqvcHaaxRl5g1F+1hUY4+c/qJVVELNvUMzaQnGtQX5fSwn6
	 tYh/eDbdndLc/X5P/l9ePgjdPhBtjuK8xed+kthTGsxbHomYx89bOoH7MPWScrYmUy
	 I+Mr59aIm9kViwTANBJPi7bI/Bz32ExIi4kM9HLVarrXUGwIXIKeXUdDNrSnz3cU5k
	 O62JQuOuhTWOhAwfFUWeVvOG0jr3jfnelJwGIbnljw5LgmClapymZYxnN0NAtMgOj/
	 PQzxbJq5fu7PH5XsiQpgDBOeQwA/EOM73nc9/jP+xD89vFO1cjvWnBq+LAjfcP8JiT
	 /Z6sc1bRqz0RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 693F860D6E;
	Thu, 18 Dec 2025 16:35:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4E261A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A68FB83DE5
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jg_h6Xrfhip9 for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A2C783DB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A2C783DB4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66F3E8730F; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:52:38 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 42b17eaa92e1ae309c8d9d3c774406979a98f5bc
X-Git-Newrev: 8782b81bf3dee288916ef1f660f97fcb0108fb6b
X-Patchwork-Hint: ignore
Message-Id: <20251218163507.66F3E8730F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libxslt: security
 bump version to 1.1.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=8782b81bf3dee288916ef1f660f97fcb0108fb6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.news

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-7424
https://www.cve.org/CVERecord?id=CVE-2025-9714
https://www.cve.org/CVERecord?id=CVE-2025-11731

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bd57bf71295d2bf860b341fbda19f430388324ee)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libxslt/libxslt.hash | 4 ++--
 package/libxslt/libxslt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 98c68eded1..0523c51362 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.sha256sum
-sha256  5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a  libxslt-1.1.43.tar.xz
+# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.sha256sum
+sha256  9acfe68419c4d06a45c550321b3212762d92f41465062ca4ea19e632ee5d216e  libxslt-1.1.45.tar.xz
 
 # Hash for license file:
 sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  Copyright
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index e92b383b89..229f3de2f6 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.43
+LIBXSLT_VERSION = 1.1.45
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
