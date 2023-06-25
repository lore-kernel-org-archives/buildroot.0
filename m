Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64907EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0895161295;
	Sun, 25 Jun 2023 19:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0895161295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdm3I5jEOe7q; Sun, 25 Jun 2023 19:22:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 418F761289;
	Sun, 25 Jun 2023 19:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 418F761289
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E52B31BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCF1761289
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCF1761289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ou3QBHacKMgC for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:22:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36B3B61244
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B3B61244
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 229C584C02; Sun, 25 Jun 2023 19:22:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 21:19:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf3b6ea551f1116a87d173c447162480052a171a
X-Git-Newrev: d39ca323887c7cf4222e00fa42c2c3cd7bb8e95e
X-Patchwork-Hint: ignore
Message-Id: <20230625192219.229C584C02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dbus-fast: drop
 python-async-timeout dependency
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d39ca323887c7cf4222e00fa42c2c3cd7bb8e95e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

async-timeout dependency was dropped upstream for Python 3.11 (see [1]).

[1] https://github.com/Bluetooth-Devices/dbus-fast/commit/1b5c9e1cb94d19925776d91196cf1b657264c494

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-dbus-fast/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-dbus-fast/Config.in b/package/python-dbus-fast/Config.in
index c9562fecfa..b7168106d7 100644
--- a/package/python-dbus-fast/Config.in
+++ b/package/python-dbus-fast/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_DBUS_FAST
 	bool "python-dbus-fast"
 	select BR2_PACKAGE_HOST_PYTHON_CYTHON
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	help
 	  A faster version of dbus-next, a DBus library for Python with
 	  asyncio support.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
