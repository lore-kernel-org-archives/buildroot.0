Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8455EEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A6C5612D3;
	Thu, 14 Sep 2023 21:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A6C5612D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OmEPO3ek11fw; Thu, 14 Sep 2023 21:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F97D612C2;
	Thu, 14 Sep 2023 21:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F97D612C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4AB1BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32AE183A3F
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32AE183A3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h5qcIKcLUhK8 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 356C783A0A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 356C783A0A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23BBC86FF5; Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 22:56:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7e57785d0ec8827012b122db1651c58192ccf19
X-Git-Newrev: 270b7c017def05a4b66a892f5a49e3e40dcbef8c
X-Patchwork-Hint: ignore
Message-Id: <20230914210236.23BBC86FF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: add LIBHEIF_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=270b7c017def05a4b66a892f5a49e3e40dcbef8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:struktur:libheif is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Astruktur%3Alibheif

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libheif/libheif.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 9c6c2829cf..65e64a02f7 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -8,6 +8,7 @@ LIBHEIF_VERSION = 1.16.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
+LIBHEIF_CPE_ID_VENDOR = struktur
 LIBHEIF_INSTALL_STAGING = YES
 LIBHEIF_CONF_OPTS = \
 	-DCMAKE_CXX_FLAGS="-std=c++11" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
