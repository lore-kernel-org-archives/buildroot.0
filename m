Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCE6CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BB2585676;
	Tue,  9 Jun 2026 13:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgZYGKoSQ8th; Tue,  9 Jun 2026 13:03:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56A3385AC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010229;
	bh=lZjcJlRk3zRMlGZB84lWrOakpTf/d5nFU1UdsGNQBWY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RqrB5UwaSWJ7Jj7xnJYCG5S+ekNC+vSGCe8hQY6fp4XFpe3JIi3UIkAU3IRhToKcZ
	 XED6IIfdh/WuiXT3D9+OreAYIoB9xVPrsBBHXx19qsQ72lfcits9WKHyptex5zbkaa
	 TWG8r0g8upfxFWIP8NCqscbY6tveynfYqsaz7GzN+ObjqtS0b0fYK+NWytz8jYKrF8
	 MIh9IjsSfqcyOS2nSFHgpAVGCMLg9aaayLsABPsx8bm39ucKVwquFgioFlRKdXBqXB
	 sg3r+ZiFi5//z05AMwQHV+w8xjd/OYUaCgGX2ZCjXXTWwaMZiaa33hD9+8D3cdSKBF
	 xkgQvplX3brNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56A3385AC5;
	Tue,  9 Jun 2026 13:03:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5DE4196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC436426FF
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSTBaonH_K7n for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E6CE426EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E6CE426EF
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA5DC87E68; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:36:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03108175ce3b1067709b1235a9703f7abedf50d2
X-Git-Newrev: d6768a2b6820142c31d95b5f84722caada1aa000
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.AA5DC87E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: provides libudev
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6768a2b6820142c31d95b5f84722caada1aa000
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Bernd: adjusted for libudev-zero]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/systemd/Config.in  | 4 ++++
 package/systemd/systemd.mk | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f507a55ceb..5200e4a8f9 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,6 +26,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_ROOTFS_MERGED_BIN
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
@@ -107,6 +108,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "systemd"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9ce4f8fef2..3223915d40 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -62,7 +62,7 @@ SYSTEMD_DEPENDENCIES = \
 
 SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
-SYSTEMD_PROVIDES = udev
+SYSTEMD_PROVIDES = libudev udev
 
 SYSTEMD_CONF_OPTS += \
 	-Dcreate-log-dirs=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
