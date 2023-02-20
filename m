Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86967C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39DFD70044;
	Tue, 21 Feb 2023 02:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39DFD70044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZNywSMUAoGZ; Tue, 21 Feb 2023 02:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B630701B8;
	Tue, 21 Feb 2023 02:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B630701B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 337FD1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B6AF81F25
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B6AF81F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6EMn2Lt1rv7 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 21:32:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2986481ED7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 21:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2986481ED7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16B92864AF; Mon, 20 Feb 2023 21:32:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 22:32:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54237eec447abd4bd788b0a8ac5d48293c2c4eb5
X-Git-Newrev: 555f128feb3bc1e3f8f3bd52315abff5cc308aaa
X-Patchwork-Hint: ignore
Message-Id: <20230220213258.16B92864AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow: add CPE
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=555f128feb3bc1e3f8f3bd52315abff5cc308aaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:marshmallow_project:marshmallow is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amarshmallow_project%3Amarshmallow

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-marshmallow/python-marshmallow.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 6427296508..ba6da6b29c 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -10,5 +10,7 @@ PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/5e/59/dd465e5a
 PYTHON_MARSHMALLOW_SETUP_TYPE = setuptools
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE
+PYTHON_MARSHMALLOW_CPE_ID_VENDOR = marshmallow_project
+PYTHON_MARSHMALLOW_CPE_ID_PRODUCT = marshmallow
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
