Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F52F5510F
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 22:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AFE1406AE;
	Sat,  7 Mar 2026 22:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlKmP5oDJ693; Sat,  7 Mar 2026 22:12:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3C10406BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772921535;
	bh=evvpQnJL8ed8idG7Vq6gBTjkhG2YU7OqeNnn4Os+dow=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f9Lf8Vf18BnHo8OFZC2rX00PKRIBzOSuugddbmYK/f0wwshz8t1MCvKji7Bf8xhCi
	 UE+sMCIKHTMgFCN5LwGp7437oihtF9aisWR7ayvXHqnxYm3vzxoRvUyIwhDIVz6R6m
	 iIeZxrvZiKbZLNJT6jHy1YFOSETzA6FN1cAuc7g4eJcGKV3lHmPVSRj8yDP1ESxP8q
	 O9QpfqK1eiD4o+ZwKu8e7aHHHkOjd5yPSINZbFiwBa0clBh6GFy03XtAHWAik1+gLK
	 8MJevSkJgRe+quIeIbKL3qYxXElyO0h9W8bDVSil4zwx3Sb4v7xAeeunEKC0FZIqiN
	 nNLziHrsF+MwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3C10406BD;
	Sat,  7 Mar 2026 22:12:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6829E169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4357C60B05
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3KLc7zTVkNd for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 22:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BADA60AF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BADA60AF2
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:12:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90FF285A84; Sat,  7 Mar 2026 22:12:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 22:53:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60ac9e27704ae80a41217ee064b9b2bfb7b43e17
X-Git-Newrev: 6019875dd2da189a8063130983e1dcd297de2e83
X-Patchwork-Hint: ignore
Message-Id: <20260307221213.90FF285A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mobile-broadband-provider-info:
 bump to 20251101
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6019875dd2da189a8063130983e1dcd297de2e83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The package switched to meson in release 20240407[1].
The download url changed to gnome's gitlab, no more xz tarballs are
available, use the bz2 one.

There is a signed git tag, but no signed release archives and also no
checksum files released, so the hashsum is now calculated locally.

Release notes: https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/blob/20251101/NEWS

[1] https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/releases/20240407

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../mobile-broadband-provider-info.hash                           | 3 +--
 .../mobile-broadband-provider-info.mk                             | 8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
index c965f5c783..53d6a3e264 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
@@ -1,4 +1,3 @@
-# https://download.gnome.org/sources/mobile-broadband-provider-info/20221107/mobile-broadband-provider-info-20221107.sha256sum
-sha256  d93392566c347a96eed95da8c66a5da0dd94f4115cfb3a305ff2682c64cfd810  mobile-broadband-provider-info-20221107.tar.xz
 # Locally computed
+sha256  6fa60b5e9860a648d7c5b8e4e3f87d6ce6a7622b8a7b5f2d567a9a0d9dddb9f7  mobile-broadband-provider-info-20251101.tar.bz2
 sha256  3d510b215a33087b9ceb9592da21575ea1f9f98bd4d983a38e65fe851a552174  COPYING
diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index 2744844951..2710683fd5 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20221107
-MOBILE_BROADBAND_PROVIDER_INFO_SITE = https://download.gnome.org/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
-MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
+MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20251101
+MOBILE_BROADBAND_PROVIDER_INFO_SITE = https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/archive/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
+MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.bz2
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE_FILES = COPYING
 MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
 MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkgconf host-libxslt
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
