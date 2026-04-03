Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3249E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFE1141181;
	Fri,  3 Apr 2026 17:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DBJZqMs1-Eq; Fri,  3 Apr 2026 17:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE4D441195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775238436;
	bh=oHKzX1UwmUUoe4F9bqwXOdIrpL60Csa7AA76r6pn9cA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YEorWQuv9c68BDbMLilYJ1M3DcFsbON2Ufnjzzc1IUdmlupdVxNoueDOOi9OzknY4
	 T7gS3TCjHhUTwD3fiKnHUgV3YibMcKDwemMsL4v3sU0iYaAp1kGmqcVFD8ekoJM77O
	 PvlZO6Dc188YJPYlinP8z48Oqrv7BhfioKG7Um4K8xCVh/l33VLqYa8oWDWbIsGSt4
	 QN44YbdyJZDXcxJy8FCeVB9TxySrOLGxOs+8LosRqMgitHIHWaofIVFp6Wbukb0NIv
	 OCdxWTXJrIxEryiBmcQl9ADeGX/a/KChPkTG2g0KQxfRsDpZh5H6yQr7ibFXdpDKr4
	 czq/cx/5GPOpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE4D441195;
	Fri,  3 Apr 2026 17:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 748351A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 664F040226
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zjq79VF066pN for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8846940202
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8846940202
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:47:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A5AB80195; Fri,  3 Apr 2026 17:47:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:44:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16c02a4ec43d8fe3cdd579f928acf320cbc41219
X-Git-Newrev: d2bd0c9b25910c1f9cca1ada593be10642d8375a
X-Patchwork-Hint: ignore
Message-Id: <20260403174712.4A5AB80195@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2bd0c9b25910c1f9cca1ada593be10642d8375a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://cmake.org/cmake/help/latest/release/4.3.html#id2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 605bed2a40..5367ae2cd5 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.3/cmake-4.3.0-SHA-256.txt
-sha256  f51b3c729f85d8dde46a92c071d2826ea6afb77d850f46894125de7cc51baa77  cmake-4.3.0.tar.gz
+# From https://cmake.org/files/v4.3/cmake-4.3.1-SHA-256.txt
+sha256  0798f4be7a1a406a419ac32db90c2956936fecbf50db3057d7af47d69a2d7edb  cmake-4.3.1.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 952e8174f4..4fdd294f5a 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
