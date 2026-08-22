Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73C4C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 10:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86CF840726;
	Sat, 22 Aug 2026 10:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mX3xrRbaZumk; Sat, 22 Aug 2026 10:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787396328;
	bh=AEJ165hXNDufAom2QxCImuFpTk+IAD/1hb/hJgH6FzA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L2XUYyiacDZkRxFxmaakJjPBGJBJSclvStOtOq0GZPvt+UOkAsO5GCClccPF7G1TC
	 sCnmIWWJ2uraQ5TJnkwiqPNT9xrUrnAlQE8Sa87H2Zm2yyl5/b+vGVNhYXn85/ZIha
	 1P+NzE8RGGygNTqYCeXejNLcDWP595B9rBzoi/xAkWrf4z0elRtjXXma+nBpw1vrWN
	 KITHNoaC0SJbmSN+nuxK4Z6HT1KFU9KfhQsOiWFfmI9JEaKkXrllOdOuezwiFoIoBr
	 BRoSGym+MWeOw0VFY+rH1AL1JEXeBJvixg0bBoxY2Mhr0knieMYJAWpJLHyTTpY2oH
	 JiB5gM/137rAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C0240729;
	Sat, 22 Aug 2026 10:58:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B1A039E
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8124840073
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Soh4imCvS0_7 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 10:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E06BF4005F
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC2228909A; Sat, 22 Aug 2026 10:57:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 12:45:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0a91e760f467a90b0f0acf00ec76aac011b241f1
X-Git-Newrev: bdd74f011f88fd1a3d7dc4c2a93a54ed7ce7286b
X-Patchwork-Hint: ignore
Message-Id: <20260822105752.DC2228909A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bind: bump version to
 9.20.27
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdd74f011f88fd1a3d7dc4c2a93a54ed7ce7286b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/notes.html#notes-for-bind-9-20-27
https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/changelog.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 36ff7b2d0a..2131f51978 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.26/bind-9.20.26.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350  bind-9.20.26.tar.xz
+sha256  145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0  bind-9.20.27.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 172bbf79b5..2b42e87d62 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.26
+BIND_VERSION = 9.20.27
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
