Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EE2CEFD0C
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CBA402CD;
	Tue,  6 Jan 2026 22:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwRMVsSA4Asa; Tue,  6 Jan 2026 22:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64E5040917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737780;
	bh=wUmEOOwNShihuuOVc+TI9kigGFhP4vOa8Q0Lt/9ziXg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OjwmztkJ+L+RWs07iKfhgPOnHNcgd4+YdjmFT85ZjBk7S03r4ZMMux1BwKllimp9C
	 0VLxhSUzABpDz45i2BxaI37UJE7+HqC+Hp1gaeP558M+ztLSznoznVC85wfds3Y1Ep
	 v8a6iaqRB5v3KbQP7za04BM3x4mvJzpn6Q9Blp+8HpU+hsDb96uITJXVfZXiyHkyGk
	 AZRpUlmhFCjlEEFYiRh1xWXpUUaFmI+YCRr/GARtC3rrTxddUUbY+jqURCAHMjQcVQ
	 GLpc74HRXAJ7HWwK1GPy/scHLTokZEa9k/SxKPsu0FFc031glUVdm1R7Ep4P1XI7lc
	 fFIMkoqBr62Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E5040917;
	Tue,  6 Jan 2026 22:16:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 528A9249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F4EA60C21
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3m7hmvGdej2 for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF9160686
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAF9160686
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A55FB87CE3; Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 23:12:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b5735cc6914f694b2c3172244c5a925d55636fc
X-Git-Newrev: 746dd2ad2ba4acda80f4572a5082c4f8d4b2f9c6
X-Patchwork-Hint: ignore
Message-Id: <20260106221613.A55FB87CE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_RPCDB
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=746dd2ad2ba4acda80f4572a5082c4f8d4b2f9c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
