Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D46C77B7E
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 14:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A801640BAF;
	Mon, 29 May 2023 14:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A801640BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zftf1qAFTAMP; Mon, 29 May 2023 14:57:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD76C4010C;
	Mon, 29 May 2023 14:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD76C4010C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C98411BF3C0
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 14:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A32B540471
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 14:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A32B540471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hkpw8vAoe9f1 for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 14:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B35CA40396
 for <buildroot@buildroot.org>; Mon, 29 May 2023 14:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B35CA40396
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D36186A28; Mon, 29 May 2023 14:57:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 May 2023 16:57:23 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e453fbe0e688d328a05bb0787560a6b4258fa5e7
X-Git-Newrev: e69bd1179cae7e2008ca7bd63570e42ea1a35fd7
X-Patchwork-Hint: ignore
Message-Id: <20230529145749.9D36186A28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-django:
 add missing python-zlib runtime dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e69bd1179cae7e2008ca7bd63570e42ea1a35fd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Tree django core files are using "import zlib" and requires
BR2_PACKAGE_PYTHON3_ZLIB to be enabled.

django/core/cache/backends/filebased.py:import zlib
django/core/files/images.py:import zlib
django/core/signing.py:import zlib

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819300

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aecf8a96e1768a20f2f12258a6c755e5aa316ff9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-django/Config.in b/package/python-django/Config.in
index 5830cadc93..c236a6dc0b 100644
--- a/package/python-django/Config.in
+++ b/package/python-django/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_DJANGO
 	bool "python-django"
 	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_SQLPARSE # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
