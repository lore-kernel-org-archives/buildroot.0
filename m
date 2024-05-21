Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9571DC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 12:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7E440637;
	Tue, 21 May 2024 12:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lt66Dn-CJA0; Tue, 21 May 2024 12:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5C0D40657
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5C0D40657;
	Tue, 21 May 2024 12:16:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 273AA1C525D
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 12:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DA5B401F6
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 12:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcOxRHNoKmmW for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 12:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B0FD40257
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B0FD40257
 for <buildroot@buildroot.org>; Tue, 21 May 2024 12:15:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 888B5874B7; Tue, 21 May 2024 12:15:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 14:02:18 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 00d911b9c6398acf71de189ee2ca39c03706e875
X-Git-Newrev: de61d8390a8374366cd6692a6057636040cb07b6
X-Patchwork-Hint: ignore
Message-Id: <20240521121557.888B5874B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/cmake: add
 BR2_HOST_CMAKE_AT_LEAST_3_28
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

commit: https://git.buildroot.net/buildroot/commit/?id=de61d8390a8374366cd6692a6057636040cb07b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Buildroot commit 38d07349daece6393800619ecb3ef98299711819 forgot to
add the corresponding BR2_HOST_CMAKE_AT_LEAST_X_Y option.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 81d7103a10b6837bfb22c314c90b46adda78bf7d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/Config.in.host | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index 0935e9a564..c38bb9daaa 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -47,10 +47,15 @@ config BR2_HOST_CMAKE_AT_LEAST_3_27
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_26
 
+config BR2_HOST_CMAKE_AT_LEAST_3_28
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_27
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "3.28"	if BR2_HOST_CMAKE_AT_LEAST_3_28
 	default "3.27"	if BR2_HOST_CMAKE_AT_LEAST_3_27
 	default "3.26"	if BR2_HOST_CMAKE_AT_LEAST_3_26
 	default "3.25"	if BR2_HOST_CMAKE_AT_LEAST_3_25
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
