Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945F7D30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 688C940D0E;
	Tue, 13 Jan 2026 20:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1czWY4iMCPP; Tue, 13 Jan 2026 20:59:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A35E40D10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337963;
	bh=M5dmXCg8VieTLWyX70nfhxcKqaqXGgT/s0NbpKsCC7g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Cy9PE6QxP/ERVuUWBizzqYOkXqISyE9qtTjqyNjYOtT9X1LkL12iOHy5FuwtR2MGc
	 ZdTWbNC3gBdIRcN0/dBzzBRPvWLAm7HYXew5eicKYwe64+Gh76vegwQFRu3PN/41FS
	 kHDX3P+X9nzE8ROVm+YGp3dnvLHOcW+a+IocHKRuW0/H3p3nbO1f8xSVSNfYy9TIqf
	 bkHK342oCzuRvRlwks+ZWsal0h/3dtAApmIPiWekJlq+TW8BtGIDOeE1htQLSWtKE0
	 xbfUv3UUyLlLgQGDmTwvZB10jnbyHsqvBb4y1IaS7voVUqz86mu680MKILwiQLkVUp
	 JEYqwuLzGZpkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A35E40D10;
	Tue, 13 Jan 2026 20:59:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 281B7231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13624407B9
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJ4eRgzzEg78 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3876F4077F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3876F4077F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37136819E3; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef603acb90762e550c3c1396559b63b7732faf89
X-Git-Newrev: f6c8ce050586312341dbefd6e7adec1ff6bf60dd
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.37136819E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xdriinfo: bump version
 to 1.0.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f6c8ce050586312341dbefd6e7adec1ff6bf60dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-July/003617.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash | 6 +++---
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
index ce11d06977..540ef0e228 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003308.html
-sha256  dd838bae9d2b19ddd71fe6d30ed33abc7c85e19d223e79d35600db3fa44bf734  xdriinfo-1.0.7.tar.xz
-sha512  a368cf32c606ca78f3a23bc5d88fb57b9c1a3827d0fec3e48cee153703135e47cecd3db8ee0eba93f309d7f03b4306c3f2e7f46f36d0d2970671c5e5b78093ad  xdriinfo-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003617.html
+sha256  00463056435b82261c227ad0de1873fd4536101607fbc57540e28e4a0a9b71f7  xdriinfo-1.0.8.tar.xz
+sha512  36ea6a453b7f3ec7caa028282c701c98dfb45886dc833e31931d3ed6333a96a5bf7d3816bf5db51b3c359297f25e242c913eae4dd01be5de557475b4cd98d458  xdriinfo-1.0.8.tar.xz
 # Locally computed
 sha256  de2fbb160bbb64c48975d7a3ebe3636a312b73227df1efe37488a8cecb9c1932  COPYING
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index 7672dc8899..ab383431b9 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDRIINFO_VERSION = 1.0.7
+XAPP_XDRIINFO_VERSION = 1.0.8
 XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.xz
 XAPP_XDRIINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDRIINFO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
