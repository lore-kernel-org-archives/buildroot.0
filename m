Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7783C54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 22:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2EDC81492;
	Sun, 10 Mar 2024 22:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a7wil6-7h28h; Sun, 10 Mar 2024 22:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2651814A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2651814A9;
	Sun, 10 Mar 2024 22:17:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9CC01BF28B
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C64A360841
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rLIzw2jnOZu for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 22:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B393605C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B393605C2
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 22:17:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06E8B8758E; Sun, 10 Mar 2024 22:17:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 22:58:28 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b28d522e4e09f2d3f8dc98b7a78e8882296af0ac
X-Git-Newrev: ff1371f64318e4d265154ed69b9cfd23e90111fd
X-Patchwork-Hint: ignore
Message-Id: <20240310221721.06E8B8758E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/clamav: fix build
 on mips64el
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff1371f64318e4d265154ed69b9cfd23e90111fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
http://autobuild.buildroot.net/results/b64/b640937f35b11ddb9f1e29f0e44040eda8850f26/
'Could not find specification for target "mips64el-unknown-linux-gnu".'

This patch changes
    -DRUST_COMPILER_TARGET=mips64el-unknown-linux-gnu
to
    -DRUST_COMPILER_TARGET=mips64el-unknown-linux-gnuabi64

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9a560d6affaff0923e829ec0c608e7d1fdacaf70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 977b6010b3..68a1799bfc 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -54,7 +54,7 @@ CLAMAV_CONF_OPTS = \
 	-DENABLE_MILTER=OFF \
 	-DENABLE_TESTS=OFF \
 	-DHAVE_SYSTEM_LFS_FTS=ON \
-	-DRUST_COMPILER_TARGET=$(ARCH)-unknown-$(TARGET_OS)-$(LIBC)$(ABI) \
+	-DRUST_COMPILER_TARGET=$(RUSTC_TARGET_NAME) \
 	-Dtest_run_result=ON \
 	-Dtest_run_result__TRYRUN_OUTPUT=ON
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
