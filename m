Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9AEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 11:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51284428B3;
	Sat,  8 Jan 2022 11:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3nEBDp1NkE1; Sat,  8 Jan 2022 11:04:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6FE428A1;
	Sat,  8 Jan 2022 11:04:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 648B91BF34E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60D0A60803
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3-HdoA5gzo3 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 11:04:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDFD160745
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 11:04:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A2FFA82A91; Sat,  8 Jan 2022 10:58:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 12:04:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5260f3189b6479dac1aa07af41f55056352a3c40
X-Git-Newrev: dd448234d284dc42730bef0ffa1e6d9b8e5b0096
X-Patchwork-Hint: ignore
Message-Id: <20220108105818.A2FFA82A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/scons: explicitly specify host
 Python 3
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd448234d284dc42730bef0ffa1e6d9b8e5b0096
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All packages using scons are now using Python 3 to run it, so
explicitly set scons as using host-python3. This avoids a
spurious host Python 2 dependency if BR2_PACKAGE_PYTHON3 is not
set (for example, if no Python is packaged for the target).

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/scons/scons.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index da2ccceb08..a95fa7fd69 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -10,6 +10,8 @@ SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
 SCONS_SETUP_TYPE = distutils
 
+HOST_SCONS_NEEDS_HOST_PYTHON = python3
+
 HOST_SCONS_INSTALL_OPTS = \
 	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
