Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD75D3B7EA
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 21:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C46240C58;
	Mon,  8 Dec 2025 21:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUi2byCnrRL0; Mon,  8 Dec 2025 21:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4683340282
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765229642;
	bh=QRhRouXx4412JdptBppL5iKgjR+mCStP0vSGejI3lq0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aNiM8EmCo0h+PXT35UaUFrORTyEcsxf8ob8jcXTCpfFiS9v1EpbNX7IqMB53UCXGX
	 cZjW8QEqczkAtW2oF7O8CSluo/0dMLBWXAzqZZ4UHzUYXXnqa9Vs/udPfeeo7lFZ07
	 sPkZatE2LpPlI5e0P+jrAKNmSw7n2wHE98k2+lI6OtFXba/aPNPRPCHJofSdvzYkAl
	 TWXSzZeYYF5NFbfaih1l8ipU5tuQ9Xj9rHiHVmShEvVfAuaVe+MOTM55vcGWQXbRhh
	 SFdJOIAzcgZNaTd+OIpj+l2ZMqpBJZna2F4Vtgxrq5lppm3HaFVToc3ema7Pp9va0Q
	 l5OsaUam7wABQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4683340282;
	Mon,  8 Dec 2025 21:34:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62924197
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 21:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ACD183CE7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 21:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCT3i1OrfUyW for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 21:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52D5E83CCE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52D5E83CCE
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 21:33:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 410E186817; Mon,  8 Dec 2025 21:33:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 22:23:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52f83ccfbca8497d58eb624ac7b59d5195565f3d
X-Git-Newrev: bd57bf71295d2bf860b341fbda19f430388324ee
X-Patchwork-Hint: ignore
Message-Id: <20251208213351.410E186817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxslt: security bump version to
 1.1.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd57bf71295d2bf860b341fbda19f430388324ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.news

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-7424
https://www.cve.org/CVERecord?id=CVE-2025-9714
https://www.cve.org/CVERecord?id=CVE-2025-11731

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxslt/libxslt.hash | 4 ++--
 package/libxslt/libxslt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 98c68eded1..0523c51362 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.sha256sum
-sha256  5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a  libxslt-1.1.43.tar.xz
+# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.sha256sum
+sha256  9acfe68419c4d06a45c550321b3212762d92f41465062ca4ea19e632ee5d216e  libxslt-1.1.45.tar.xz
 
 # Hash for license file:
 sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  Copyright
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index e92b383b89..229f3de2f6 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.43
+LIBXSLT_VERSION = 1.1.45
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
