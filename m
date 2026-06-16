Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE89CD98E4
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 18:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A463661C6D;
	Tue, 16 Jun 2026 18:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3R6iHLCtdVjN; Tue, 16 Jun 2026 18:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 281D461BA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781636180;
	bh=7/uDP1xG8uQ6+AwqlP7/Hj8v3syApyjaq34Z8j6h68c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m0Z3p2O7J+fsPG2PWnrc/yaWUKeIK5pyOlt3uOaXz6CXlMWnBRcWZFGuMmVS03dKz
	 wTD9YS/G+6prXhCl8WOMZYtJ/NqbqHkg4Xp5pUEQTmrnRhGQmP7zsGkuQdWsdKgyLU
	 8JT5NEWfuV1f6tnXk0NblgJv8whPi9mcEKF5I85F7AZoM7gD6uuY5Z8QYy4EMx7XNg
	 oE6X3rTx0apjOrO+Ij6eIYO+gW2O3N1yCqrRHByEQjhbqxQOnkuRp3FWS2jRD4y7wd
	 9DoDjgFkW9LkIw5PxqzGTW7uzghy3XxqrLY36f4xwxlrFU7vZehBDFJwnMHv4Ji/JI
	 vX4QeY7ZHulow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 281D461BA7;
	Tue, 16 Jun 2026 18:56:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DD5C2F3
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 18:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13DAD4008A
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 18:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0kZ6U2DgeX3 for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 18:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E934006E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50E934006E
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 18:56:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A26280DF0; Tue, 16 Jun 2026 18:55:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 20:50:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63dfdedd51cdd65a2444623de8197a39340c1e35
X-Git-Newrev: dc43bd6f0590294e122324e1c4999db1400a446e
X-Patchwork-Hint: ignore
Message-Id: <20260616185557.0A26280DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnvme: bump version to 1.16.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc43bd6f0590294e122324e1c4999db1400a446e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/linux-nvme/libnvme/releases/tag/v1.16.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 29071da1bf..aa316fbf72 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  ce1d9d393feb84c4e82ca096db2bdb7dd4a5fd1997d711cc1904796944f2c579  libnvme-1.16.1.tar.gz
+sha256  1d850d5a871559abf641d6e6b63bb86047e4cb26f3ad144597c2c64b3cff7231  libnvme-1.16.2.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index f9bc0be371..55108cfc49 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.16.1
+LIBNVME_VERSION = 1.16.2
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
