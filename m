Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78CBEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 529B881C40;
	Sun, 16 Jul 2023 06:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 529B881C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9U92WGBvkbHG; Sun, 16 Jul 2023 06:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 918D981E1E;
	Sun, 16 Jul 2023 06:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 918D981E1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8ABE71BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64F7340489
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64F7340489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d66THGSvmY69 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:22:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6BAF40354
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6BAF40354
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A64F2870E1; Sun, 16 Jul 2023 06:22:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:00:48 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d2ebcac1075acc478f5f0b338a8dcff3739181e5
X-Git-Newrev: 474354c08df492c94ca9b607f0355d89e4d2466b
X-Patchwork-Hint: ignore
Message-Id: <20230716062213.A64F2870E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-dbus-fast:
 drop python-async-timeout dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=474354c08df492c94ca9b607f0355d89e4d2466b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

async-timeout dependency was dropped upstream for Python 3.11 (see [1]).

[1] https://github.com/Bluetooth-Devices/dbus-fast/commit/1b5c9e1cb94d19925776d91196cf1b657264c494

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit d39ca323887c7cf4222e00fa42c2c3cd7bb8e95e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
