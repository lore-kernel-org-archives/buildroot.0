Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66DCC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:39:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F8E761159
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F8E761159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BC24076A;
	Fri,  5 Nov 2021 21:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iIl4WMvBjUoq; Fri,  5 Nov 2021 21:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F994071C;
	Fri,  5 Nov 2021 21:39:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A19A51BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F2E940217
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wSWOOJgSIVp6 for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:39:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8607040130
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 31B678B380; Fri,  5 Nov 2021 21:36:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 22:37:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d51189ffe50fab00d36778a53d28c9d5cb34ae42
X-Git-Newrev: bd2318df7b92cfe3a87273cc38f8ad1767419b9b
X-Patchwork-Hint: ignore
Message-Id: <20211105213608.31B678B380@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libteam: drop LIBTEAM_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd2318df7b92cfe3a87273cc38f8ad1767419b9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBTEAM_CPE_ID_VENDOR was wrongly set since the addition of the package
in commit 7485f5be0c460649e7406699cde82bb492aa23f1 as
cpe:2.3:a:libteam:libteam is not a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibteam%3Alibteam

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libteam/libteam.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libteam/libteam.mk b/package/libteam/libteam.mk
index 99454a03e5..8bd83aa20d 100644
--- a/package/libteam/libteam.mk
+++ b/package/libteam/libteam.mk
@@ -6,7 +6,6 @@
 
 LIBTEAM_VERSION = 1.31
 LIBTEAM_SITE = $(call github,jpirko,libteam,v$(LIBTEAM_VERSION))
-LIBTEAM_CPE_ID_VENDOR = libteam
 LIBTEAM_LICENSE = LGPL-2.1+
 LIBTEAM_LICENSE_FILES = COPYING
 LIBTEAM_DEPENDENCIES = host-pkgconf jansson libdaemon libnl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
