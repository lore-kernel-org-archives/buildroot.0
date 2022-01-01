Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A1FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 09:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 322F4401ED;
	Sat,  1 Jan 2022 09:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GuGZCSsleMkf; Sat,  1 Jan 2022 09:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 923BF40871;
	Sat,  1 Jan 2022 09:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE4421BF5A8
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC85160E26
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ron0v0F23Zx5 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AB7660DE5
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 25061813B7; Sat,  1 Jan 2022 09:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 10:49:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee21467863d30e20df80fcc1384ac9e573ec8f43
X-Git-Newrev: 393614da509c0ce5984b75b943bb7284454fb96c
X-Patchwork-Hint: ignore
Message-Id: <20220101094828.25061813B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp: add aiosignal
 runtime dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=393614da509c0ce5984b75b943bb7284454fb96c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  File "/usr/lib/python3.10/site-packages/aiohttp/__init__.py", line 6, in <module>
  File "/usr/lib/python3.10/site-packages/aiohttp/client.py", line 88, in <module>
  File "/usr/lib/python3.10/site-packages/aiohttp/tracing.py", line 5, in <module>
ModuleNotFoundError: No module named 'aiosignal'

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-aiohttp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
index 9ffea088e4..85a6862141 100644
--- a/package/python-aiohttp/Config.in
+++ b/package/python-aiohttp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_AIOHTTP
 	bool "python-aiohttp"
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_AIODNS # runtime
+	select BR2_PACKAGE_PYTHON_AIOSIGNAL # runtime
 	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_CCHARDET if BR2_INSTALL_LIBSTDCPP # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
