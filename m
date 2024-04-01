Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E44CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 12:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D50981ECB;
	Mon,  1 Apr 2024 12:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8T21XeoTjWLx; Mon,  1 Apr 2024 12:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EB6481EDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB6481EDE;
	Mon,  1 Apr 2024 12:51:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7451BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BBB081EDE
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5P0dnXxSDB9T for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 12:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 730B781ECB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 730B781ECB
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 12:51:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 667FA844F5; Mon,  1 Apr 2024 12:51:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 14:50:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6453835d69f6a5bc9c2794464c3e4599f6c9fa0
X-Git-Newrev: ef07e8da6fb3d294a23b7536365e293d6332c3a1
X-Patchwork-Hint: ignore
Message-Id: <20240401125140.667FA844F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igt-gpu-tools: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef07e8da6fb3d294a23b7536365e293d6332c3a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tests to avoid the following build failure raised since the
addition of the package in commit
d8a729d1731339da141612be33c5e59bc9928748:

../tests/intel/kms_pm_backlight.c: In function '__igt_unique____real_main257':
../tests/intel/kms_pm_backlight.c:320:32: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Werror=implicit-function-declaration]
  320 |                         name = basename(full_name);
      |                                ^~~~~~~~
      |                                rename

Fixes: d8a729d1731339da141612be33c5e59bc9928748
 - http://autobuild.buildroot.org/results/ff5de58ca9408f3a4fc6b6d5bd8c62093c1021ad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/igt-gpu-tools/igt-gpu-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index 927a1225a5..d4997c9c28 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -23,6 +23,8 @@ IGT_GPU_TOOLS_DEPENDENCIES = \
 	udev \
 	zlib
 
+IGT_GPU_TOOLS_CONF_OPTS = -Dtests=disabled
+
 # On x86 systems, libigt resolves igt_half_to_float and igt_float_to_half as
 # indirect functions at runtime by checking CPU features with igt_x86_features.
 # The igt_x86_features function is implemented is a different object and the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
