Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944E7EA7197
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5892C60FF5;
	Sun, 19 Apr 2026 19:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MowVDgX-PnXe; Sun, 19 Apr 2026 19:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AA4C60FFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776627226;
	bh=YkOTW6HpldHb9a71D17vzYomUfTR+5tbJCRYAZT74qE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r2kwXC59g9gry+TpUlwj3FXsPYTKsb4bAHF1UPwpNbQwDqAekUSqrn11yfbP6aUP6
	 OqRqmaBFYYD+6TD1pilrnCEZUBbPT0gYFkVnGgRKkiSAcVZrk0UqiAmddUUMX1wCwM
	 ui9e5Y5T2H3PaHYl4nBO/sHjmBrhKEM0TQOFl1i73VqwyerewwH3+7mA8z2K9YOtiv
	 XJ3G8yzr5+v0PHE0Y0CaQjx+vnPijCAYupyRz3wS/xZRkM5KodchdLTtGI81AVNmnf
	 JD+BYVNwAa0mkoGC6AesnL0bh1a9OALLtI8yNK+szLBxFIhju98svgecvyKMLe21yk
	 g1MXtE/Dpuqzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AA4C60FFE;
	Sun, 19 Apr 2026 19:33:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81D8324D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72D5360FF9
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7Md4S8PE-kP for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 915C760FFF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 915C760FFF
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:33:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4704581F7F; Sun, 19 Apr 2026 19:33:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 21:31:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f78b5661f6d44daead89f28346c2c573b33954d
X-Git-Newrev: a09a9c08f04bab8f0265852003ed12cdd3527411
X-Patchwork-Hint: ignore
Message-Id: <20260419193344.4704581F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkcs11-helper: bump version to
 1.31.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a09a9c08f04bab8f0265852003ed12cdd3527411
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenSC/pkcs11-helper/blob/pkcs11-helper-1.31.0/ChangeLog

Switched to sha256 tarball hash provided by upstream.

Updated license hash due to upstream commit:
https://github.com/OpenSC/pkcs11-helper/commit/909ab8babcab354ee3d3ceff2c900b21722b9066

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pkcs11-helper/pkcs11-helper.hash | 5 +++--
 package/pkcs11-helper/pkcs11-helper.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index bc9cf3478b..3732499a25 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,6 @@
+# From https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.31.0
+sha256  46f0067bccd7be2c28f88b8bca775172b9e52fb6fc1280b44ca8bb831433fef9  pkcs11-helper-1.31.0.tar.bz2
 # Locally computed
-sha256  4c5815ba910cabf26df08d449ca2909daf4538c9899aa7f7fadc61229d3488a9  pkcs11-helper-1.30.0.tar.bz2
-sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
+sha256  e05d3ce5570debefd9763c8529fb9a4329cb4713618354216e3cca59ee9902e0  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index de192493ea..0fa2a7b162 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.30.0
+PKCS11_HELPER_VERSION = 1.31.0
 PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).tar.bz2
 PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-$(PKCS11_HELPER_VERSION)
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
