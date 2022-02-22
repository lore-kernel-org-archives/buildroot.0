Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD0FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 813FF4011D;
	Tue, 22 Feb 2022 10:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCuxaYmzSNdH; Tue, 22 Feb 2022 10:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0221F400FC;
	Tue, 22 Feb 2022 10:12:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 952DE1BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 913D8814A0
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNtYjLgnv2zK for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:12:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB74E813E6
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:12:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7CC428379E; Tue, 22 Feb 2022 10:05:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:10:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a83177aac627764fb7ab5dc6bd87646586598934
X-Git-Newrev: b43ba475cf3dbf2b3990144758d5b1d4b74862c0
X-Patchwork-Hint: ignore
Message-Id: <20220222100500.7CC428379E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-twisted: add missing python
 typing extensions runtime dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b43ba475cf3dbf2b3990144758d5b1d4b74862c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/python-twisted/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 49a21c4204..8596025e9c 100644
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
