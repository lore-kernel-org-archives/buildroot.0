Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4194D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C99BF60F56;
	Tue, 13 Jan 2026 20:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xX6-4NFGPIYO; Tue, 13 Jan 2026 20:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFA6A60F75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337989;
	bh=Y+CWh+y9xO4QmNhpJp4lJt6BBjLnwESxelk2BqG3cOQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pTwim8c+1Oa0ex+kxps0+D4yo8K/HtgbLbdCtk3FOj18sw+kj+xBSsyUlaOsEI9qC
	 i9nlgd+TwAkijLGtDImbyV1wqYQ/WSBHtj/kezVRwAheTX+Dc8VyTMPiXA63cde/9t
	 Bz+HFYLlNP5VP+i9AS0mrPmyMrbnfmcjvuQlVk2mJ2cEyvwk6VmHOWQ+4O3MsMLFBZ
	 uEjzZ3A1HL/RvrsDzywxHxp6XhF3k8dnOJEeIsPfwCHByudqF9z49MnUAbDupzRN4x
	 yHpR9QQb2bSrIF5x3z6UcmVKc0bBt0H0l76KNv7dPDlafjy5SuftV4dA4vFa6BWcVz
	 QRUstruWAu/PA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFA6A60F75;
	Tue, 13 Jan 2026 20:59:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA9D41CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6AC44075B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNMw-_D3IPi2 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5984540771
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5984540771
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57EA887F77; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf6c292c9c72bde74916b0bd6c0a7926cfc9d124
X-Git-Newrev: a8b547a44a5e59e4ee8b2152b6af3e8835425520
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.57EA887F77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_oclock: bump version to
 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8b547a44a5e59e4ee8b2152b6af3e8835425520
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-December/003564.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_oclock/xapp_oclock.hash | 6 +++---
 package/x11r7/xapp_oclock/xapp_oclock.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_oclock/xapp_oclock.hash b/package/x11r7/xapp_oclock/xapp_oclock.hash
index 20e899b880..6d9c605783 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.hash
+++ b/package/x11r7/xapp_oclock/xapp_oclock.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003206.html
-sha256  8f09979655e889d056b7a1e50b57f38b32529453e756b53ec659070fb3c3965c  oclock-1.0.5.tar.xz
-sha512  a87e89afdb25a91c36077e030b05c3907ddc063c6bdc0715a01bfc16edef8730b3b5a0347399ef4c8b2a13e70e068cba9ec5fe8d411f08548c0aa790a1873aff  oclock-1.0.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003564.html
+sha256  3ee85e5e2d211eca7bdb8b2fe0e3baf31998829af48198b5fa9bbee2aa0d24be  oclock-1.0.6.tar.xz
+sha512  02d062745356ad09e2c5ef22c41f2f5c271e756c6a78cac78d459fdf8e4b107f4f8df1a657e16ecc3ae0c1801c2a913396133ba0628685c9ea4fe359c0d7dcc3  oclock-1.0.6.tar.xz
 # Locally computed
 sha256  f6cae4b0c603ef5bd76da2df96b38aa43aa7547e482adb8cb8b83f09af35e4a2  COPYING
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index 4f70df4cbf..2598180dcc 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_OCLOCK_VERSION = 1.0.5
+XAPP_OCLOCK_VERSION = 1.0.6
 XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.xz
 XAPP_OCLOCK_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_OCLOCK_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
