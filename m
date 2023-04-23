Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1848FC77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 11:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925E682073;
	Sun, 23 Apr 2023 11:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925E682073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1akX3UjO7u_v; Sun, 23 Apr 2023 11:02:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB8B8817A4;
	Sun, 23 Apr 2023 11:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB8B8817A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CFB01C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3333A40B5B
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3333A40B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSIFWihpb9mq for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65A214059F
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65A214059F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DC0C84488; Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 13:01:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 548e30d140066d5464eef1c3be57284a1a3dcf5e
X-Git-Newrev: 1f9332229e52f1792c1296dfacc910a330b3d850
X-Patchwork-Hint: ignore
Message-Id: <20230423110248.4DC0C84488@busybox.osuosl.org>
Subject: [Buildroot] [git commit] checkpackageignore: regenerate
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f9332229e52f1792c1296dfacc910a330b3d850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5e1c238b7202 (package/ltp-testsuite: require 5.11 headers for
musl) dropped a patch, which had no "upstream" status, and thus had an
ignore entry, which itself was ignored when the patch got removed.

Regenerate .checkpackage ignore now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 02c892c1b3..e11b5b6bb8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -979,7 +979,6 @@ package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
 package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch Upstream
 package/lockfile-progs/0001-sus3v-legacy.patch Sob Upstream
 package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch Upstream
-package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch Upstream
 package/ltrace/0001-arm-plt.patch Upstream
 package/ltrace/0002-sparc-add-missing-library.h-include.patch Upstream
 package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
