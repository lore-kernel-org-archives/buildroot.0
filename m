Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08CEC77B7A
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 07:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5913C40158;
	Wed, 31 May 2023 07:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5913C40158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCQoBwX7YjcC; Wed, 31 May 2023 07:45:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 873A641CC0;
	Wed, 31 May 2023 07:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 873A641CC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2A481BF853
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 07:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC8E760BE7
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 07:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC8E760BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2w9Dc4P31yB for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 07:44:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE16E60B46
 for <buildroot@buildroot.org>; Wed, 31 May 2023 07:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE16E60B46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD28E86AC8; Wed, 31 May 2023 07:44:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 May 2023 09:43:42 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b713be49dba221591656977b152ea532a8740a2e
X-Git-Newrev: 791ad4cc89d489ed6d9b70834a4cc679398c853d
X-Patchwork-Hint: ignore
Message-Id: <20230531074450.BD28E86AC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/freeswitch:
 ffmpeg's libavresample is an optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=791ad4cc89d489ed6d9b70834a4cc679398c853d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

See upstream commit from 2019:
https://github.com/signalwire/freeswitch/commit/e9c58084db249845af88011a1e3c5d7b9ec05a76#diff-2cd3a5516ad0fc3cba6d14d0ea3e72da43a2c2fc3c21eb7ade6c49d52136bbd2R43

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7e6e2bde8bc1ae0069c534b95f66b8fbb3117c2e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeswitch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index bad101486c..1ab624c33c 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_FREESWITCH
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr, included in freeswitch source
 	depends on BR2_USE_WCHAR # uses wchar_t
-	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_JPEG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
