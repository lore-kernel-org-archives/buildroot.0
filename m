Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A81AC46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EC0C408F1;
	Tue, 26 Dec 2023 13:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EC0C408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uayg-4FXzafX; Tue, 26 Dec 2023 13:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B82F40979;
	Tue, 26 Dec 2023 13:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B82F40979
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F5AE1BF489
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46C9D408B4
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C9D408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TXVGJK-WGAm for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72B97408A5
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B97408A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60473835AE; Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 14:13:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27182fcd35d34822026b19d481932f6fb8661b4f
X-Git-Newrev: 55c3fe590f0c2d0207a25d461ae2bf33e5e4c163
X-Patchwork-Hint: ignore
Message-Id: <20231226131330.60473835AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=55c3fe590f0c2d0207a25d461ae2bf33e5e4c163
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:fastapi_project:fastapi is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/E6E33EA5-0404-4037-9B3E-FE718E1593E5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fastapi/python-fastapi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index db86bfce30..dc6d919926 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -10,6 +10,8 @@ PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce30
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
+PYTHON_FASTAPI_CPE_ID_VENDOR = fastapi_project
+PYTHON_FASTAPI_CPE_ID_PRODUCT = fastapi
 PYTHON_FASTAPI_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
