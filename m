Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEBCC433FE
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:19:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09F361A4F
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D09F361A4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD10A608E6;
	Tue,  9 Nov 2021 22:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNSN8VBPeXnG; Tue,  9 Nov 2021 22:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF5C608CF;
	Tue,  9 Nov 2021 22:19:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA6951BF9AD
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 998FD401B1
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jq3RUg6gP42M for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4F6B403BA
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0CD058B82C; Tue,  9 Nov 2021 22:15:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 21:46:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e267a7d3d5d350710a81ada188a1629348e4b4a
X-Git-Newrev: 2cf7e51a0e647f2cd6221a72a948139934253079
X-Patchwork-Hint: ignore
Message-Id: <20211109221516.0CD058B82C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qhull: force Release build
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cf7e51a0e647f2cd6221a72a948139934253079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force Release mode to always build qhull_r library instead of qhull_rd
and avoid the following build failure with python-matplotlib raised
since bump to version 3.4.3 in commit
23ca2efef1528c73f04b5db8aff66a826fab1b9e and
https://github.com/matplotlib/matplotlib/commit/2dacb1c9090eda4b3c202db80f5e3ce340850760:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lqhull_r

Fixes:
 - http://autobuild.buildroot.org/results/c2b/c2ba407275863bafe42faa4b335a20c6fa9e1d55/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qhull/qhull.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
index c11bed0373..72f6270434 100644
--- a/package/qhull/qhull.mk
+++ b/package/qhull/qhull.mk
@@ -11,6 +11,9 @@ QHULL_INSTALL_STAGING = YES
 QHULL_LICENSE = BSD-Style
 QHULL_LICENSE_FILES = COPYING.txt
 
+# Force Release mode to always build qhull_r instead of qhull_rd
+QHULL_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
+
 # BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
 # although BUILD_STATIC_LIBS=ON is default, make it explicit,
 # cmake and static/shared libs is confusing enough already.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
