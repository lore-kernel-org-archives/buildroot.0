Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DEDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 10:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AC8A40207;
	Sat, 12 Feb 2022 10:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RifqXc6WtAS6; Sat, 12 Feb 2022 10:14:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B56E40160;
	Sat, 12 Feb 2022 10:14:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16DAC1BF853
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 10:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11DDA40160
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 10:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hwMpXysLHyDQ for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 10:14:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBC4A400D8
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 10:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D73D82AA2; Sat, 12 Feb 2022 10:07:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 11:12:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c26eab78ab17bcc507b28a7e9eb70a08ffe88ef3
X-Git-Newrev: 0baf647329010270ccdd91dfe65a819886a4a21f
X-Patchwork-Hint: ignore
Message-Id: <20220212100722.3D73D82AA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiio: add missing backslash to
 python binding logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=0baf647329010270ccdd91dfe65a819886a4a21f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5ac65831d5b6434dfa (package/libiio: drop python2 support) combined
two LIBIIO_CONF_OPTS lines, but forgot the backslash at the end of the line.
Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiio/libiio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 48e2f385e3..e15d276b44 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -75,7 +75,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
 LIBIIO_DEPENDENCIES += host-python3-setuptools python3
 LIBIIO_CONF_OPTS += \
-	-DPYTHON_BINDINGS=ON
+	-DPYTHON_BINDINGS=ON \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 else
 LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
