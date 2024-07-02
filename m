Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666A7C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10A2D81F29;
	Tue,  2 Jul 2024 06:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taSlWMeGr3FF; Tue,  2 Jul 2024 06:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 229C581F57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 229C581F57;
	Tue,  2 Jul 2024 06:51:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC5ED1BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E76D46081B
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHk_jYxpymkX for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A94605C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8A94605C4
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1D2E8389E; Tue,  2 Jul 2024 06:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 08:49:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fae1e7f5f513e360a57c777e341a270fd353c88
X-Git-Newrev: 7d64864ab209bc996470eb0f8f538b404ca946d8
X-Patchwork-Hint: ignore
Message-Id: <20240702065131.D1D2E8389E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup: fix set c_std to gnu99
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d64864ab209bc996470eb0f8f538b404ca946d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, libsoup fails to build with output:

    Applying 0001-meson.build-set-c_std-to-gnu99.patch using patch:
    patching file meson.build
    Hunk #1 FAILED at 2.

This commit fixes the set c_std to gnu99 patch so that it applies.

Fixes:
http://autobuild.buildroot.net/results/4ee/4ee68145143df02c46034b4ca291fea469a6f58a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
index f2e8f7701d..a999f5964e 100644
--- a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
+++ b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
@@ -26,9 +26,9 @@ diff --git a/meson.build b/meson.build
 index 4dfd8c15..a5ebc63a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2,6 +2,6 @@ project('libsoup', 'c',
-         version: '2.74.0',
-         meson_version : '>= 0.50',
+@@ -2,7 +2,7 @@ project('libsoup', 'c',
+         version: '2.74.3',
+         meson_version : '>=0.50',
          license : 'LGPL2',
 -        default_options : 'c_std=c99')
 +        default_options : 'c_std=gnu99')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
