Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B69FED3F2
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9580D84DD5;
	Fri, 24 Apr 2026 16:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_hnlz02c7Xc; Fri, 24 Apr 2026 16:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 930B284DD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047962;
	bh=NKDmvi9xii3pE/4kFTWDZ2tm4B1rxIMuFggCngFLgq0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ToYlVyW1o0PwHN5wPdxUFwLtzOOJtC/7c3uwjrUzuanpzqnrd15O08IdACmZ1gpIc
	 Hv3FfuZRMpV0rvPDnML233jMLi2ERrUI8U2jeOHp4LpTjqJs1EXPTFw2CONMdsSAaU
	 I+vm+h06I8Q8h4xiaZv0kytv6HK60twBVyqtCoZKQX1cyGjrSUPyPf6R6/YRJk8Rts
	 bp/PSBvq0yALnvtCO6HJdw2DukHfREwQgCtvofVCr16hEu1VVsw/kp+FVwgJDgTDgJ
	 6m1dqV3PoghedNoHUDUI7nQnrSg/3SeH3JVM2pnCJm+c7kRFUdhxU8VqTXOCT1Fwhq
	 JGwL4EP5DbLkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 930B284DD8;
	Fri, 24 Apr 2026 16:26:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12195194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7750784C4F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loJiyT2pUbgn for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C869884C78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C869884C78
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 808BE82AFB; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:21:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b077bab476f8428a10495d548afb76c9b36b901c
X-Git-Newrev: 8ecf930abf9bab3dff8d0fddf44f59a398fd923f
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.808BE82AFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xdg-dbus-proxy:
 security bump to version 0.1.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ecf930abf9bab3dff8d0fddf44f59a398fd923f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

While there is not a security advisory to go with the release,
it includes a patch to prevent message interception that may be
considered a security fix.

Release notes:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 188fad7af1fafae2981d3916bcc8e0b13b3d2c5b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index 93d4bc05ce..e5be1f0cd3 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.6
-sha256  131bf59fce7c7ee7ecbc5d9106d6750f4f597bfe609966573240f7e4952973a1  xdg-dbus-proxy-0.1.6.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7
+sha256  3ad3d27ba574e178acb5e4d438ba36ace25e3564f899c36f31c56f82c7adbbe7  xdg-dbus-proxy-0.1.7.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index 0e92946915..6c3ef5c9d4 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDG_DBUS_PROXY_VERSION = 0.1.6
+XDG_DBUS_PROXY_VERSION = 0.1.7
 XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
