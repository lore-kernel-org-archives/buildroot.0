Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5BDD30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDDAE8124F;
	Tue, 13 Jan 2026 20:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpwob9MuEDHx; Tue, 13 Jan 2026 20:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2175B8125D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337972;
	bh=4JDo1iy8szXqlf/+HI6PbEzojDMoPnr7gIAEL5JRu/U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DxW+4oce25s32aetDQc3kz/NZCWUqv5VBG3vY+x2LHqGHUllzZOfKsa0FqCtpMhZs
	 8Q2VEIz1rElgwtcQ28SxXIhb64w/JOyojlD0HpQwDY/kv0NiIEhAkGxCI0VVr20yPl
	 C6k86VrwvYwcOl4DTOhK7JrygOl3K0RmN7oyvYBWvsxpTS2HRRrdVaeEVLKHZr2fb8
	 8IWZ1oWBbM+TNTx4342MwaxQx//sWiTrbLMU3Ohb/GeK6AKWpLARmXIdFFnQiivBWF
	 9QizrvxdSYvr0cyKz57rXAuoz9h2flWayPtyGaRF/5hg8XNHpOo/u5nymYvLM1z7pa
	 6m7tGgOvTUjUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2175B8125D;
	Tue, 13 Jan 2026 20:59:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31852231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA7AB407C9
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqZwzRzwNnC0 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D63540766
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D63540766
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BEA781382; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5c9aa07184953a677144941cbf726ac10900934
X-Git-Newrev: cf6c292c9c72bde74916b0bd6c0a7926cfc9d124
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.4BEA781382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkbevd: bump version to
 1.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf6c292c9c72bde74916b0bd6c0a7926cfc9d124
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-December/003566.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xkbevd/xapp_xkbevd.hash | 6 +++---
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
index 40b813fcf2..e06f5adbd8 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003255.html
-sha256  38357b702de9d3457c4ff75053390f457b84c4accc7f088101255c37c684926b  xkbevd-1.1.5.tar.xz
-sha512  9e4a56484771e5eb5444fbd11e7d0bb952a2746eea79b84298e2000ada96896d501b886727c4ef08c120b5dcce550fca2d3e3dd762f4ca0327c38d9609961c5b  xkbevd-1.1.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003566.html
+sha256  d9b401f84cf8568342ff63b1ffc6aecd3877579256d89fe6408645e2741b073e  xkbevd-1.1.6.tar.xz
+sha512  5120909376d11c1b153198ba887c1af8c0398f2a7ded8ec85402418f9837730cc4ca689773f326f4f74dc348942644ab0159bd2c973de0007d21a4f14731ac1a  xkbevd-1.1.6.tar.xz
 # Locally computed
 sha256  38c6dbf8f88b1c920561ff3a4d1ffdb85c069c664f5f8b64a9adb477ef347b7c  COPYING
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 5b99e6967f..b252d368a6 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBEVD_VERSION = 1.1.5
+XAPP_XKBEVD_VERSION = 1.1.6
 XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.xz
 XAPP_XKBEVD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBEVD_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
