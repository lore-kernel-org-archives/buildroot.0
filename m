Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AC7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBB63405F4;
	Tue, 14 Dec 2021 19:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6EG8Sv4NYg7; Tue, 14 Dec 2021 19:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3A6140610;
	Tue, 14 Dec 2021 19:54:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6D781BF9B9
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A19F440602
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UEF5whIRGh7Y for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC934405F4
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DD29281E71; Tue, 14 Dec 2021 19:48:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:21:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b5a30f7aab6bc0b0554b3bc1c2dd8cf09132155
X-Git-Newrev: d0b1250f188e0bd2763279050a740bfc2c071d0c
X-Patchwork-Hint: ignore
Message-Id: <20211214194841.DD29281E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0b1250f188e0bd2763279050a740bfc2c071d0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for gnupg2 is added by the apps/gpg module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnupg2/gnupg2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 32c22b8257..906b79e0ab 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -11,6 +11,7 @@ GNUPG2_LICENSE = GPL-3.0+
 GNUPG2_LICENSE_FILES = COPYING
 GNUPG2_CPE_ID_VENDOR = gnupg
 GNUPG2_CPE_ID_PRODUCT = gnupg
+GNUPG2_SELINUX_MODULES = gpg
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
