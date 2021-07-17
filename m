Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FBBC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:35:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2041360F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2041360F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA38183CBB;
	Tue,  3 Aug 2021 23:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6DWUOTJ2_Z6; Tue,  3 Aug 2021 23:35:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6111183C6E;
	Tue,  3 Aug 2021 23:35:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 255551BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE69F40EF7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzlQIHwe9Rv2 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 800B3406BC
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C77D986A84; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:10:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c64abc69349e28707a8861f0719edf65e7a91462
X-Git-Newrev: 2170033bf68f1a34dc5d183d50e3f38d9779b6de
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.C77D986A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/duktape: add and
 install a duktape.pc file
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

commit: https://git.buildroot.net/buildroot/commit/?id=2170033bf68f1a34dc5d183d50e3f38d9779b6de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Most distributions include a duktape.pc file bundled with the duktape
development package. As the duktape source does not include a .pc file,
add one to the package/duktape directory and install it to the staging
directory. This is used by the polkit duktape patch later in the series.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/duktape/duktape.mk    |  4 ++++
 package/duktape/duktape.pc.in | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index aadd609248..89a6e451f5 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -19,6 +19,10 @@ endef
 define DUKTAPE_INSTALL_STAGING_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f Makefile.sharedlibrary \
 		INSTALL_PREFIX=$(STAGING_DIR)/usr install
+	$(INSTALL) -D -m 0644 $(DUKTAPE_PKGDIR)/duktape.pc.in \
+		$(STAGING_DIR)/usr/lib/pkgconfig/duktape.pc
+	$(SED) 's/@VERSION@/$(DUKTAPE_VERSION)/g;' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/duktape.pc
 endef
 
 define DUKTAPE_INSTALL_TARGET_CMDS
diff --git a/package/duktape/duktape.pc.in b/package/duktape/duktape.pc.in
new file mode 100644
index 0000000000..eaef5f6994
--- /dev/null
+++ b/package/duktape/duktape.pc.in
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: duktape
+Description: Embeddable Javascript engine
+Version: @VERSION@
+Libs: -L${libdir} -lduktape
+Cflags: -I${includedir}/
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
