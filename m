Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ADCC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 10:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 838A960840;
	Sat,  4 Dec 2021 10:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKclI5rR-Zsn; Sat,  4 Dec 2021 10:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0359607B0;
	Sat,  4 Dec 2021 10:44:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4C91BF5DA
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 778EE403E8
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ieYHFFzOgQlC for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 10:44:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78E7F400D6
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 10:44:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 58BB885D5A; Sat,  4 Dec 2021 10:39:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 11:33:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 349159c43932c68430e82e5de7680f70dc6e8f5a
X-Git-Newrev: 7d569f51914c22457e35bba6f7658c4b3d8af086
X-Patchwork-Hint: ignore
Message-Id: <20211204103910.58BB885D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/coreutils: ignore
 CVE-2013-0221, CVE-2013-0222, CVE-2013-0223"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d569f51914c22457e35bba6f7658c4b3d8af086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 8ae9156d8b730689484927fba2ec2fa6c1dc0433 as those
CVEs are not tagged as affecting gnu:coreutils in NVD NIST database but
opensuse:opensuse and redhat:entreprise_linux:
- https://nvd.nist.gov/vuln/detail/CVE-2013-0221
- https://nvd.nist.gov/vuln/detail/CVE-2013-0222
- https://nvd.nist.gov/vuln/detail/CVE-2013-0223

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/coreutils/coreutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 6822c58a32..9c0f46cb29 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -10,10 +10,6 @@ COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
 COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_CPE_ID_VENDOR = gnu
-# Only when including SUSE coreutils-i18n.patch
-COREUTILS_IGNORE_CVES = CVE-2013-0221
-COREUTILS_IGNORE_CVES += CVE-2013-0222
-COREUTILS_IGNORE_CVES += CVE-2013-0223
 
 COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
