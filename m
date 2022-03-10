Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8892CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 22:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39B9461291;
	Thu, 10 Mar 2022 22:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVkLDzOyXILw; Thu, 10 Mar 2022 22:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5405061292;
	Thu, 10 Mar 2022 22:31:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 418791BF34D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF23761283
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1loBRsBZBeE2 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 22:31:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 346FA61281
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 22:31:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 85C7283C70; Thu, 10 Mar 2022 22:22:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 23:02:40 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 0879a8e26c3455f9c06f83266e2374c271a329fc
X-Git-Newrev: 6f32a2440eb6fa417ba28c0237cd3e2b37126633
X-Patchwork-Hint: ignore
Message-Id: <20220310222247.85C7283C70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-twisted:
 add missing python typing extensions runtime dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f32a2440eb6fa417ba28c0237cd3e2b37126633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

# python sample_python_txtorcon.py
 Traceback (most recent call last):
   File "/root/sample_python_txtorcon.py", line 1, in <module>
     import txtorcon  # noqa
   File "/usr/lib/python3.10/site-packages/txtorcon/__init__.py", line 11, in <module>
   File "/usr/lib/python3.10/site-packages/txtorcon/router.py", line 10, in <module>
   File "/usr/lib/python3.10/site-packages/txtorcon/util.py", line 17, in <module>
   File "/usr/lib/python3.10/site-packages/twisted/internet/defer.py", line 42, in <module>
 ModuleNotFoundError: No module named 'typing_extensions'

python typing_extensions is required since python-twisted 22.1.0 [1]

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202537

[1] https://github.com/twisted/twisted/commit/6e768da0a10c8ab42a57a1c0fa505ebe2d8bfb30

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b43ba475cf3dbf2b3990144758d5b1d4b74862c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-twisted/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 4e24a3f71a..8a8717ff9c 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_PYHAMCREST # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Twisted is an event-driven networking engine written in
 	  Python.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
