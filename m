Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17A4C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9021F408F1;
	Tue, 26 Dec 2023 13:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9021F408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fa12n2bx4Fz; Tue, 26 Dec 2023 13:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7374140962;
	Tue, 26 Dec 2023 13:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7374140962
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29B1F1BF966
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03D1580E64
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03D1580E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dgi08o3dMMdg for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6633D80C10
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6633D80C10
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 541D7835AD; Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 14:13:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f7a7c34e5747c122815d407a70be0d1eca512d8
X-Git-Newrev: 27182fcd35d34822026b19d481932f6fb8661b4f
X-Patchwork-Hint: ignore
Message-Id: <20231226131330.541D7835AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=27182fcd35d34822026b19d481932f6fb8661b4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:encode:starlette is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/B4613D5C-E46D-443A-8738-58E4FBC0C127

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-starlette/python-starlette.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 40932929a0..b04b95a797 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -11,5 +11,7 @@ PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
 PYTHON_STARLETTE_DEPENDENCIES = host-python-hatchling
+PYTHON_STARLETTE_CPE_ID_VENDOR = encode
+PYTHON_STARLETTE_CPE_ID_PRODUCT = starlette
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
