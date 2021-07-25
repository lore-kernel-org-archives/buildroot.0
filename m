Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B7DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:41:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5187760F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5187760F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D44283C20;
	Tue,  3 Aug 2021 22:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4p38vZ6YtHO; Tue,  3 Aug 2021 22:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79F0F83CDF;
	Tue,  3 Aug 2021 22:41:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C12F31BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42741608AD
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajvqICO84rwX for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DAEB60866
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E7FB383FBA; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 18:18:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b500d4731a66fa15dab4d2a10ea053d143421a56
X-Git-Newrev: ddd9e723c3ef6f8eb26a5eafd7d8a504b56059f2
X-Patchwork-Hint: ignore
Message-Id: <20210803211017.E7FB383FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libtirpc: Add optional
 GSSAPI support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ddd9e723c3ef6f8eb26a5eafd7d8a504b56059f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libtirpc/Config.in   | 8 ++++++++
 package/libtirpc/libtirpc.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 2e9c939fa8..1899edefbf 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -7,5 +7,13 @@ config BR2_PACKAGE_LIBTIRPC
 
 	  http://sourceforge.net/projects/libtirpc/
 
+config BR2_PACKAGE_LIBTIRPC_GSS
+	bool "gss"
+	depends on BR2_USE_MMU # libkrb5
+	depends on BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_LIBKRB5
+	help
+	  Enable GSSAPI support
+
 comment "libtirpc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 46b74cae8e..9d3c4b5a94 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -16,7 +16,13 @@ LIBTIRPC_INSTALL_STAGING = YES
 # getrpcby{number,name} are only provided if 'GQ' is defined
 LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 
-LIBTIRPC_CONF_OPTS = --disable-gssapi
+ifeq ($(BR2_PACKAGE_LIBTIRPC_GSS),y)
+LIBTIRPC_CONF_ENV += KRB5_CONFIG=$(STAGING_DIR)/usr/bin/krb5-config
+LIBTIRPC_CONF_OPTS += --enable-gssapi
+LIBTIRPC_DEPENDENCIES += libkrb5
+else
+LIBTIRPC_CONF_OPTS += --disable-gssapi
+endif
 HOST_LIBTIRPC_CONF_OPTS = --disable-gssapi
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
