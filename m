Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2E6D3B98A
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 158A960842;
	Tue,  9 Dec 2025 18:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8riMo-Sfu8Z; Tue,  9 Dec 2025 18:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D8AD60DA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765305933;
	bh=3VRWk/uvl02kbK7zkgn/47N3ttpYVYdKovPKMIVkKmY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WOTtpSCIjfFGoYsyW0Nju35Uw/7zhE/8tO3XHSpwhw4rX2NCar9H7Povc8dK2wzV4
	 A/i3bvmChHG6HnN8k9Kned8ejCYOsNYaRyPW3xhOistoUIeVUXrq6/H1Ega5JgjexK
	 E1o7gpIU/VntNQE5/M8YTuK7Oc3Pn4QGG5xCBAaanIB2TImTF7uwGoflGOXQ19q+cC
	 1rCRPgpfsjyDy5CLJ/r4SRp4AgunPzmnfqpUjogts2B6TdonMSk6G3y+20ZuTocRj5
	 AMKkaFnXBYLcV74oQyhVElacHuf0UBZ9qPkIbF16giOGLx9e9YkzfJsCnGubkffldv
	 wN7KQEs2XNAQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D8AD60DA6;
	Tue,  9 Dec 2025 18:45:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5449C2C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41029401A0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9sV3V-Takbi for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8CE4008D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B8CE4008D
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:45:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 750858696F; Tue,  9 Dec 2025 18:45:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:38:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f3d6e43de9b4aac7df8545fd811171256f878d3
X-Git-Newrev: 55a3abfcca75d084153b31ee84a3936aa12fbcc6
X-Patchwork-Hint: ignore
Message-Id: <20251209184530.750858696F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.51.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=55a3abfcca75d084153b31ee84a3936aa12fbcc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes of this bugfix release:
https://sqlite.org/releaselog/3_51_1.html

"Changes in this specific patch release, version 3.51.1 (2025-11-28):

    Fix incorrect results from nested EXISTS queries caused by the
    optimization in item 6b in the 3.51.0 release.
    Fix a latent bug in fts5vocab virtual table, exposed by new
    optimizations in the 3.51.0 release"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index e33c87f34e..19d5584625 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  42e26dfdd96aa2e6b1b1be5c88b0887f9959093f650d693cb02eb9c36d146ca5  sqlite-autoconf-3510000.tar.gz
+sha256  4f2445cd70479724d32ad015ec7fd37fbb6f6130013bd4bfbc80c32beb42b7e0  sqlite-autoconf-3510100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 13ae9d9281..ca8071c78e 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.51.0
-SQLITE_TAR_VERSION = 3510000
+SQLITE_VERSION = 3.51.1
+SQLITE_TAR_VERSION = 3510100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
