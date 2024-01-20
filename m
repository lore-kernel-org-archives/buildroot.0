Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA630C47DB7
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71CA140A9A;
	Sat, 20 Jan 2024 23:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71CA140A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvnleuf5iLvp; Sat, 20 Jan 2024 23:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB720400F9;
	Sat, 20 Jan 2024 23:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB720400F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D5CA1BF21A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1ECD83D34
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1ECD83D34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gt6UiA8Rku91 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1180F83E45
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1180F83E45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00C118634A; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 23:59:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d361c3d32eb368e479eb65ac6df625804fa805b
X-Git-Newrev: d00b3f17f663368733c035194874965e52f64ad6
X-Patchwork-Hint: ignore
Message-Id: <20240120230318.00C118634A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hpack: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=d00b3f17f663368733c035194874965e52f64ad6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:python:hpack is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/9DD17147-CB76-4A8F-BE82-4AE1BC7BFCD5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-hpack/python-hpack.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
index 3cf534d055..4b581c1001 100644
--- a/package/python-hpack/python-hpack.mk
+++ b/package/python-hpack/python-hpack.mk
@@ -10,5 +10,7 @@ PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/3e/9b/fda93fb4d957db
 PYTHON_HPACK_SETUP_TYPE = setuptools
 PYTHON_HPACK_LICENSE = MIT
 PYTHON_HPACK_LICENSE_FILES = LICENSE
+PYTHON_HPACK_CPE_ID_VENDOR = python
+PYTHON_HPACK_CPE_ID_PRODUCT = hpack
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
