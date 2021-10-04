Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD41C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:13:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEDB461409
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEDB461409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90B8D4062B;
	Mon,  4 Oct 2021 20:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brKQzy_3-YqZ; Mon,  4 Oct 2021 20:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 046C14060B;
	Mon,  4 Oct 2021 20:13:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B91801BF2BA
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A751A60668
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXPv4FcgTcOq for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B75BB6077B
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:10:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BB6E48ED8D; Mon,  4 Oct 2021 20:07:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 21:18:41 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: d98654f3e46f4f50ec127980503cfdbd6c3f8954
X-Git-Newrev: 81333a72843957e4e400a0ee0a2b43be57d02f97
X-Patchwork-Hint: ignore
Message-Id: <20211004200739.BB6E48ED8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] support/testing:
 test_openssh: use a prebuilt toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=81333a72843957e4e400a0ee0a2b43be57d02f97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Switch from the Buildroot internal toolchain for armv5 to
the prebuilt Bootlin external toolchain.

The test doesn't require to build a toolchain, there was
no prebuilt glibc toolchain recent enough at the time this
test has been introduced.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 184d20404e8a5b95f2b2940f4d959d09be7ae2f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_openssh.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
index 2ae5030d5d..fe517e8da1 100644
--- a/support/testing/tests/package/test_openssh.py
+++ b/support/testing/tests/package/test_openssh.py
@@ -49,9 +49,8 @@ class TestOpenSshGlibc(TestOpensshBase):
         TestOpensshBase.opensshconfig + \
         """
         BR2_arm=y
-        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-        BR2_KERNEL_HEADERS_4_19=y
-        BR2_TOOLCHAIN_BUILDROOT_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_PACKAGE_RNG_TOOLS=y
         BR2_TARGET_ROOTFS_CPIO=y
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
