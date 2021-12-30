Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939ACC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF08940530;
	Thu, 30 Dec 2021 12:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhi7gd9vOkjV; Thu, 30 Dec 2021 12:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F179040523;
	Thu, 30 Dec 2021 12:26:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B39FA1C1135
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2CCA60BE9
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6zekizbRx3X for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:26:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECD0460BE0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:26:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2B31B82DAD; Thu, 30 Dec 2021 12:20:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 13:21:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8efb7beaa8bf536443e8de98773c6642c73cabef
X-Git-Newrev: c709ecd36bb62626f851a15f708598a7ac7baeae
X-Patchwork-Hint: ignore
Message-Id: <20211230122038.2B31B82DAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django-enumfields: needs
 python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c709ecd36bb62626f851a15f708598a7ac7baeae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python2 support has been dropped since version 2.0.0 and
https://github.com/hzdg/django-enumfields/commit/3a9f92d67b15d1ae57ef7fb087858b5597413f30
resulting in the following build failure since bump to version 2.1.1 in
commit bcb85b2e59902c1f570fb0545b38a677d088841f:

error:   File "/usr/lib/python2.7/site-packages/enumfields/fields.py", line 134
    *super().check(**kwargs),
    ^
SyntaxError: invalid syntax

Fixes:
 - http://autobuild.buildroot.org/results/3fd79ed7bbcad202fc7ac07252cdf57c599dac30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django-enumfields/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-django-enumfields/Config.in b/package/python-django-enumfields/Config.in
index 58dea365ee..51efbcbf53 100644
--- a/package/python-django-enumfields/Config.in
+++ b/package/python-django-enumfields/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_DJANGO_ENUMFIELDS
 	bool "python-django-enumfields"
-	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Real Python Enums for Django.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
