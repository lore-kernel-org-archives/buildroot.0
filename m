Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B21EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 09:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FDDE83EFF;
	Fri, 16 Jun 2023 09:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FDDE83EFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPAC4OLVolGo; Fri, 16 Jun 2023 09:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA80783F54;
	Fri, 16 Jun 2023 09:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA80783F54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46FC61BF97E
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 09:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A1BE403FF
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 09:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1BE403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2uEvUHFG6ct for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 09:31:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34A0640949
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 09:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34A0640949
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20C1683A2E; Fri, 16 Jun 2023 09:31:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 11:29:06 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 24ef678979124353d1a49a3b38a877b8d974eae8
X-Git-Newrev: 255441793c902d6392b4eb42a77b6970c4f42a27
X-Patchwork-Hint: ignore
Message-Id: <20230616093116.20C1683A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x]
 package/x11r7/xlib_libX11: security bump version to 1.8.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=255441793c902d6392b4eb42a77b6970c4f42a27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes CVE-2023-3138:
https://lists.x.org/archives/xorg-announce/2023-June/003406.html

Release notes:
https://lists.x.org/archives/xorg-announce/2023-June/003407.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 89585576728ebf9362394ae6e26df595098f8bbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index ed68164d5f..f443d947a4 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003318.html
-sha256  c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518  libX11-1.8.4.tar.xz
-sha512  3150a47498b0cb012482ee02efeaae16d9e736288f2b3f917be912e1613d56ad6b4ab180de8820305deb2b95dfd993633f43a65344d75979d6b86bdf110cb63e  libX11-1.8.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-June/003407.html
+sha256  59535b7cc6989ba806a022f7e8533b28c4397b9d86e9d07b6df0c0703fa25cc9  libX11-1.8.6.tar.xz
+sha512  b94a578003078a42cea43d80fae2c54a3aaa30f706088bb3546331e9abfc180131cafb37887117abcc5b6116992e299974981eef96ecfcf883cc8a1aba4d1ade  libX11-1.8.6.tar.xz
 # Locally computed
 sha256  2e7012a140f000735a7172674a2d314398d79622444fba65d108b029b29ab283  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index add16f49db..75199f1a3d 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.8.4
+XLIB_LIBX11_VERSION = 1.8.6
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
