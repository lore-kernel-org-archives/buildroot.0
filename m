Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9672CD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 19:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CE48405E4;
	Tue, 19 May 2026 19:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQxLliOcowj6; Tue, 19 May 2026 19:13:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B6B40D82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779218005;
	bh=dMlfC1w62LoPYyI0tWMWNCFrX4IOkwli6BC7kts3MIY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XJFPKMQrU5yz8nmiHXle9lj/P6e5GMf1Vi/Q4xcy0lALIM7QqqC/04+oadt57jwBM
	 KcnEzSKTqk9zyU8P6OZi+VwMgWQz608IUY9GSiFdOcuxoanlPaC4zOE8rFUyXT4R1W
	 ZVUj78Aj5X11Kffi+72JIpMkvxfxgXQXGjpBI2L5StqSsT+O557nbdrTA5NqpHaQpJ
	 F2ySL2W/FcUytvIHBSTTwHSJgWuGGQYVfmTAtes9nhKaHvAJqQO1e6ac0Nd98En89q
	 ExXGRew29WwKdku3664NLNDCs7n7tPQ6UzkR3e3BDTAfumwoU7WdmWgALJm4laF28A
	 li/+4L+6nAUDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9B6B40D82;
	Tue, 19 May 2026 19:13:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B28282
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2EB280D96
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiNz-99sSPRj for <buildroot@buildroot.org>;
 Tue, 19 May 2026 19:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94F480D89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E94F480D89
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:13:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 265C6867A8; Tue, 19 May 2026 19:13:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 May 2026 21:09:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c537913fb9bef85c4667b22dc6841b000b93c6c4
X-Git-Newrev: 7c887cd87866c7c7453ec07cc4a89cf41fb3a880
X-Patchwork-Hint: ignore
Message-Id: <20260519191316.265C6867A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libinput: bump version
 to 1.31.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c887cd87866c7c7453ec07cc4a89cf41fb3a880
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://lore.freedesktop.org/wayland-devel/agWtsIBqMXTVknR_@quokka/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index ec6e52e1e2..c813993358 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e0bb6537de892ce7c63fc5be9ad373eae894b7655c92220ef00316cc33097356  libinput-1.31.1.tar.bz2
+sha256  1daebac6cb5b8946139c9669a7e5c0e4c8f17320de232a6b9bf470f37dc569e4  libinput-1.31.2.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 8b930805b2..33fd012076 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.31.1
+LIBINPUT_VERSION = 1.31.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
