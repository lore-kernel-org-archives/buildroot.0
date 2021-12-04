Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0023C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 10:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C56741295;
	Sat,  4 Dec 2021 10:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GVn9DAEnJuM; Sat,  4 Dec 2021 10:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B42C6410B5;
	Sat,  4 Dec 2021 10:25:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9C81BF5DA
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACA38814AB
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Tq5kGiUVUe9 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 10:23:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EECE481951
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 10:23:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DA9F987EEA; Sat,  4 Dec 2021 10:19:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 11:15:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c3122b85a3bbdac5fa3c5a0b6f6f4d1fe9af1e0
X-Git-Newrev: 7e649e705aba9bc754a18137774ab8e2594d232b
X-Patchwork-Hint: ignore
Message-Id: <20211204101905.DA9F987EEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/guile: add GUILE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e649e705aba9bc754a18137774ab8e2594d232b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:guile is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aguile

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/guile/guile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 44f4d1c85e..b62d06e704 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -13,6 +13,7 @@ GUILE_INSTALL_STAGING = YES
 GUILE_AUTORECONF = YES
 GUILE_LICENSE = LGPL-3.0+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
+GUILE_CPE_ID_VENDOR = gnu
 
 # libtool dependency is needed because guile uses libltdl
 GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf libtool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
