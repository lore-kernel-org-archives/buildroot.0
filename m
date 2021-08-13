Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B17C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 11:29:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A1061038
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 11:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96A1061038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A0A740184;
	Fri, 13 Aug 2021 11:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rqBltPyrCBFs; Fri, 13 Aug 2021 11:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD1B7401E0;
	Fri, 13 Aug 2021 11:29:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9D621BF2AB
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 11:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9970D401E0
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 11:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKb0qPaWVn1l for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 11:29:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A30540184
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 11:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C69D7817CE; Fri, 13 Aug 2021 11:29:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 13:29:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 047b85e7d5c1b936d886bcda49fea9e7f435cbfa
X-Git-Newrev: d811549b755ac5079dfb1cb06d7d325aeaf462f2
X-Patchwork-Hint: ignore
Message-Id: <20210813112911.C69D7817CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: fix
 gidatadir
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

commit: https://git.buildroot.net/buildroot/commit/?id=d811549b755ac5079dfb1cb06d7d325aeaf462f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 521d387640d704f24caee51841388d98bcac739b gidatadir is
wrongly set to ${libdir}/../share, set it back to
${datadir}/gobject-introspection-1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gobject-introspection/gobject-introspection.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index f56d0c5eff..81938b14df 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -121,7 +121,7 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 	# causes the host /usr/share being used instead of $(STAGING_DIR)/usr/share.
 	# Change datadir to $(libdir)/../share which will prefix $(STAGING_DIR)
 	# to the correct location.
-	$(SED) "s%datadir=.*%datadir=\$${libdir}/../share%g" \
+	$(SED) "s%^datadir=.*%datadir=\$${libdir}/../share%g" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
 
 	# By default, girdir and typelibdir use datadir and libdir as their prefix,
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
