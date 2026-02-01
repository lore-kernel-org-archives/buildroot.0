Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECE4E65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECDB60688;
	Sun,  1 Feb 2026 20:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_2hut-_DLXW; Sun,  1 Feb 2026 20:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F4BF606C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978458;
	bh=n77/9t0UpGmDHpdO6LTXHl4/hBiZqzJvFsQwwad16ts=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LKXQQwyWel0G9PCr2h356GVt0pfJJpJHRWUuiQFk+IUPGi6NJCi99TeTCQYSApiap
	 xrjiJHu3dBKtDOVbZNelj1egkQqUvhX6Q+ZqvtNtWJpkEmDrHz7Vd5ePrhRaaBfAoy
	 f8Urmqil2hwctNQAkvGJ/reL2SS4ajOnqUZxGb49ZC3m+GOfrUpNJgNjr5CLcAl254
	 Icve3FfzkVEy2IKOtjRl2UdzVJ77erQmTb/LC4e4NBaMZnEVj8VnSrQU93GlJy8HCH
	 5kRksDMwj+AM+weF2/zgROPCOOfWV+6oJ9BsI7er55zNIQc0TeXoVQIqQblw1Evgp4
	 MPCZRqWsecpUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F4BF606C5;
	Sun,  1 Feb 2026 20:40:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6026C34E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 556758271D
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8_v7-D-F8Ug for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC8182684
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CC8182684
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 749798616D; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 21:26:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33c09c71d57986dc58e20dd8487d07f052178cd7
X-Git-Newrev: 4367b88a0f83c75c870592aa3483c192e1ee7b91
X-Patchwork-Hint: ignore
Message-Id: <20260201204055.749798616D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/transmission: bump version to 4.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=4367b88a0f83c75c870592aa3483c192e1ee7b91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/transmission/transmission/releases/tag/4.1.0

Removed patch which is included in this release.

Updated license hash due to copyright year bump:
https://github.com/transmission/transmission/commit/5ce17df2e52eda39d61272590bdf4921c9bf7bc7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-bump-miniupnpc-to-2.2.8.patch             | 39 ----------------------
 package/transmission/transmission.hash             |  4 +--
 package/transmission/transmission.mk               |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/transmission/0001-bump-miniupnpc-to-2.2.8.patch b/package/transmission/0001-bump-miniupnpc-to-2.2.8.patch
deleted file mode 100644
index f8fab5024f..0000000000
--- a/package/transmission/0001-bump-miniupnpc-to-2.2.8.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From febfe49ca3ecab1a7142ecb34012c1f0b2bcdee8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?C=C5=93ur?= <coeur@gmx.fr>
-Date: Sat, 15 Jun 2024 07:24:06 +0800
-Subject: [PATCH] bump miniupnpc to 2.2.8 (#6907)
-
-* bump miniupnpc to 2.2.8
-
-* Avoid build error "ln: include/miniupnpc/.: Operation not permitted"
-
-Upstream: https://github.com/transmission/transmission/commit/febfe49ca3ecab1a7142ecb34012c1f0b2bcdee8
-
-[Bernd: rebased for version 4.0.6]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Transmission.xcodeproj/project.pbxproj  | 2 +-
- libtransmission/port-forwarding-upnp.cc | 9 +++++++--
- third-party/miniupnp                    | 2 +-
- 3 files changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/libtransmission/port-forwarding-upnp.cc b/libtransmission/port-forwarding-upnp.cc
-index 6d7bbc7f7c2..a4146e0df13 100644
---- a/libtransmission/port-forwarding-upnp.cc
-+++ b/libtransmission/port-forwarding-upnp.cc
-@@ -261,8 +261,13 @@ tr_port_forwarding_state tr_upnpPulse(
- 
-         FreeUPNPUrls(&handle->urls);
-         auto lanaddr = std::array<char, TR_ADDRSTRLEN>{};
--        if (UPNP_GetValidIGD(devlist, &handle->urls, &handle->data, std::data(lanaddr), std::size(lanaddr) - 1) ==
--            UPNP_IGD_VALID_CONNECTED)
-+        if (
-+#if (MINIUPNPC_API_VERSION >= 18)
-+            UPNP_GetValidIGD(devlist, &handle->urls, &handle->data, std::data(lanaddr), std::size(lanaddr) - 1, nullptr, 0)
-+#else
-+            UPNP_GetValidIGD(devlist, &handle->urls, &handle->data, std::data(lanaddr), std::size(lanaddr) - 1)
-+#endif
-+            == UPNP_IGD_VALID_CONNECTED)
-         {
-             tr_logAddInfo(fmt::format(_("Found Internet Gateway Device '{url}'"), fmt::arg("url", handle->urls.controlURL)));
-             tr_logAddInfo(fmt::format(_("Local Address is '{address}'"), fmt::arg("address", lanaddr.data())));
diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 3e470a002e..b6dcaf9ae5 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  2a38fe6d8a23991680b691c277a335f8875bdeca2b97c6b26b598bc9c7b0c45f  transmission-4.0.6.tar.xz
+sha256  dcd28c1c9e6126229c4c17dbc9e95c9fd4aed7e76f4a1f2a74604c8cddec49d6  transmission-4.1.0.tar.xz
 # Locally calculated
-sha256  f56732960a61ecf3b9637404eef1a39221d2006336a98792b7b65a79f155449c  COPYING
+sha256  9715b55d11caa499d34a6e23498c766fe1ece4ace57777553313e27d688dee78  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 1eab839fd3..e4b6d8d189 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.0.6
+TRANSMISSION_VERSION = 4.1.0
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
