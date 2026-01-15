Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6B3CCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D06F81DFD;
	Mon, 19 Jan 2026 10:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNKjLa1ZzvTu; Mon, 19 Jan 2026 10:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68F6E81DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816850;
	bh=QJrHnf/9yechS8ZRqLDGcp8C6hCp3YA8L+CDcZs0ZLI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=inIkwRRlOMuMNXjZBMENQD1QnhQpDQ1Xj0D3VQnqv2uvdgjWyCv8+i2xIdsXl0HJZ
	 P9ys6akLgtJBf4SCjOs6WTyNohXFIhCZT4GnhvqCZXqBrp/MPKOsZ6si0sapnSdjSi
	 FGFjkXnFitqaF/2Cczl4+k1W8U4cdz26OS1VSLEwLnTl0u+i3MbGPQ9fIVwb95P0Uw
	 Y908R90wppi+zou/psNLdZAzxAUpzdNln089uyPHIuWUSihjaIWQqaPJ9qXc5ufGFg
	 cMoaE0PqjljMOrHxCzfJjkeDvfTG+GMhJwoOibu8pgpu/MqGj6XPJ8MRDe6RcEz/Ql
	 UfaqQRQuLxJAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68F6E81DE5;
	Mon, 19 Jan 2026 10:00:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2718C462
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BBC2406D3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXO2HYOS8jh3 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81B02406D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81B02406D4
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80D7388587; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:15:49 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d36d284bc28b1436aff217da8dcc99809de92ec9
X-Git-Newrev: 848adc792eff8eae25593b388f0a1baed2385c43
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.80D7388587@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libtirpc:
 introduce BR2_PACKAGE_LIBTIRPC_RPCDB
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

commit: https://git.buildroot.net/buildroot/commit/?id=848adc792eff8eae25593b388f0a1baed2385c43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Package libtirpc with commit[1] exposes --enable-rpcdb so make it
selectable to allow packages that use rpcdb functions to enable it
and build correctly.

[1]:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
[Bernd: move gss comment into if-block]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 746dd2ad2ba4acda80f4572a5082c4f8d4b2f9c6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libtirpc/Config.in   | 17 ++++++++++++-----
 package/libtirpc/libtirpc.mk |  7 +++++++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 31f1636ef5..371f7c46c1 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -7,19 +7,26 @@ config BR2_PACKAGE_LIBTIRPC
 
 	  http://sourceforge.net/projects/libtirpc/
 
+if BR2_PACKAGE_LIBTIRPC
+
 config BR2_PACKAGE_LIBTIRPC_GSS
 	bool "gss"
 	depends on BR2_USE_MMU # libkrb5
 	depends on !BR2_STATIC_LIBS # libkrb5
-	depends on BR2_PACKAGE_LIBTIRPC
 	select BR2_PACKAGE_LIBKRB5
 	help
 	  Enable GSSAPI support
 
-comment "libtirpc needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 comment "libtirpc gss support needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_LIBTIRPC
+
+config BR2_PACKAGE_LIBTIRPC_RPCDB
+	bool "rpcdb"
+	help
+	  Enable RPCDB support
+
+endif
+
+comment "libtirpc needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index ab15954561..eadacedfcf 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -25,5 +25,12 @@ LIBTIRPC_CONF_OPTS += --disable-gssapi
 endif
 HOST_LIBTIRPC_CONF_OPTS = --disable-gssapi
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC_RPCDB),y)
+LIBTIRPC_CONF_OPTS += --enable-rpcdb
+else
+LIBTIRPC_CONF_OPTS += --disable-rpcdb
+endif
+HOST_LIBTIRPC_CONF_OPTS += --disable-rpcdb
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
