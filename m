Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4EAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1050B41C67;
	Sun, 12 Dec 2021 17:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ArBw6t-FCtBQ; Sun, 12 Dec 2021 17:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C0B741C08;
	Sun, 12 Dec 2021 17:37:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDE3F1BF31D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92CF560EB5
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2AmHOWpdoHEM for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:35:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6C7C60ED1
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 974AC835F5; Sun, 12 Dec 2021 17:30:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:34:04 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 12f767975f589cd89f25920a1153bb3501e106e0
X-Git-Newrev: 64dcd86ccf818b11e39866dd81efaf561e575251
X-Patchwork-Hint: ignore
Message-Id: <20211212173017.974AC835F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Revert
 "package/coreutils: ignore CVE-2013-0221, CVE-2013-0222, CVE-2013-0223"
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

commit: https://git.buildroot.net/buildroot/commit/?id=64dcd86ccf818b11e39866dd81efaf561e575251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This reverts commit 8ae9156d8b730689484927fba2ec2fa6c1dc0433 as those
CVEs are not tagged as affecting gnu:coreutils in NVD NIST database but
opensuse:opensuse and redhat:entreprise_linux:
- https://nvd.nist.gov/vuln/detail/CVE-2013-0221
- https://nvd.nist.gov/vuln/detail/CVE-2013-0222
- https://nvd.nist.gov/vuln/detail/CVE-2013-0223

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d569f51914c22457e35bba6f7658c4b3d8af086)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 3ec3c847c2..57b77b8c6a 100644
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
 # We're patching m4/pthread-cond.m4
 COREUTILS_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
