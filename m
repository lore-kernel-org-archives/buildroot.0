Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D75CDB484
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D98C82251;
	Fri, 13 Oct 2023 06:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D98C82251
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DeZ0wVOCZkvf; Fri, 13 Oct 2023 06:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADAE282376;
	Fri, 13 Oct 2023 06:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADAE282376
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53B361BF3C8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D7A1608B7
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D7A1608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-e_SWdsoVmj for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D3DF60A7A
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D3DF60A7A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F12568468B; Fri, 13 Oct 2023 06:22:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:11:53 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: b370a3bfab44c2343deb56935653de6dee28e702
X-Git-Newrev: 889446cf967547963bfe62576a67f41e2b9aff78
X-Patchwork-Hint: ignore
Message-Id: <20231013062252.F12568468B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/python-mako: add
 optional runtime dependency on python-pygments
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

commit: https://git.buildroot.net/buildroot/commit/?id=889446cf967547963bfe62576a67f41e2b9aff78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Some extensions of python-mako use python-pygments, if they are used,
python-pygments must be added as a runtime dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit adb3f5a3e0d5bd6df60c91c46a03a2ff9c867dbb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-mako/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
index e6a10c9c2e..2e1094189f 100644
--- a/package/python-mako/Config.in
+++ b/package/python-mako/Config.in
@@ -7,3 +7,14 @@ config BR2_PACKAGE_PYTHON_MAKO
 	  for maximum performance.
 
 	  https://pypi.python.org/pypi/Mako
+
+if BR2_PACKAGE_PYTHON_MAKO
+
+config BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN
+	bool "mako extension pygmentplugin"
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	help
+	  Provide python-pygments support for
+	  mako.ext.pygmentplugin
+
+endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
