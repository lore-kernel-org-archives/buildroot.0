Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB92CD5BB1
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 13:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F5F860F84;
	Mon, 25 May 2026 13:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6W8GL_6v_AEn; Mon, 25 May 2026 13:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29CE360F89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779714193;
	bh=Puc/nzpZwlcNXOClXZm/hWTNlvGMtF8U7oj9SrOuvu4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RXQYg0vZofz4jeZjPXpvZugjgouFz6xlzU5/CEni65ZkmMY8xcjIZ3lOxvRFv1e+Q
	 u9rQBtT04bE2yIjbjfOvhM8HMVcwGQdAwEISvyUCWUJopeTN7V1UQR5A1eYu/P6pQy
	 z0Bzd+wa04YAFJK6BYGSfOGw/k48S3N0p/HFguQc+XnUYub31anw1jTGxaU6orpehX
	 UmIr6OHcAeF1pCVA2RfCapIDOMONxSj4ifYqSPBPvxCSvrdgIhSZu3tSFLWCmKvRSR
	 Fsu968IsG1G5tSedLP5pDU+HWJIvcdq2ulKVmc+ulOU0FZ0gu3ZFVVMj6KI3SOdGM/
	 onLi3QNEt8i4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29CE360F89;
	Mon, 25 May 2026 13:03:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4F5E21F
 for <buildroot@buildroot.org>; Mon, 25 May 2026 13:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C635A41175
 for <buildroot@buildroot.org>; Mon, 25 May 2026 13:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-IatUHRBwly for <buildroot@buildroot.org>;
 Mon, 25 May 2026 13:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE80E4115C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE80E4115C
 for <buildroot@buildroot.org>; Mon, 25 May 2026 13:03:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A64086ED3; Mon, 25 May 2026 13:03:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 May 2026 14:38:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d4d79f9aebd7974ecab60c9c335190ef974aece
X-Git-Newrev: 3ddacc46e4bf6934e33c993963a3782022d16ca1
X-Patchwork-Hint: ignore
Message-Id: <20260525130300.5A64086ED3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: security bump version to
 10.11.17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ddacc46e4bf6934e33c993963a3782022d16ca1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://mariadb.com/docs/release-notes/community-server/10.11/10.11.17
https://mariadb.com/docs/release-notes/community-server/changelogs/10.11/10.11.17

Fixes CVE-2026-44168, CVE-2026-44169, CVE-2026-44170, CVE-2026-44171,
CVE-2026-44172 & CVE-2026-44173.

https://mariadb.com/docs/release-notes/community-server/10.11/10.11.16
https://mariadb.com/docs/release-notes/community-server/changelogs/10.11/10.11.16

Fixes CVE-2026-3494 & CVE-2026-34303.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 216b3be7e3..ca23b36a38 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.11.15
-sha512  98d1e54954b69cf87a96be7d76f80333f27832a29279e6b0a9615b830e171713222abcb9ec9b9a545c0fc4a0f9f8e3d4774babcabf534a6fa3cb3dfdaed0dedc  mariadb-10.11.15.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.11.17
+sha512  788803b15afbb6193111774a233d0db0604f27ebae3b4b439368e2d7caeffb662846e530fa65f453a6d77541cedb99112ea319c7c0c2ce5074c32aefb06a51aa  mariadb-10.11.17.tar.gz
 
 # Hash for license files
 sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index e2c0cee3d5..c718c1ce7b 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.11.15
+MARIADB_VERSION = 10.11.17
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
