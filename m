Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADD1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:36:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CC0860F92
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CC0860F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA170830E2;
	Tue,  3 Aug 2021 14:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7NebXML4gDA; Tue,  3 Aug 2021 14:36:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C52558392B;
	Tue,  3 Aug 2021 14:36:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C5461BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5789A4052B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjWsJHhmQCUZ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:35:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB0F2404BC
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:35:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D79658A690; Tue,  3 Aug 2021 14:35:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 16:19:28 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6a1dc0757d425981896719f686a947fee022bcaa
X-Git-Newrev: 7caf738e4a9ae6d00a2f80d40f53a2a4e8fcbecc
X-Patchwork-Hint: ignore
Message-Id: <20210803143527.D79658A690@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gcr: fix
 introspection option
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

commit: https://git.buildroot.net/buildroot/commit/?id=7caf738e4a9ae6d00a2f80d40f53a2a4e8fcbecc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

introspection option was wrongly named --with-introspection instead of
--enable-introspection since commit
d4e7c720aa78dbe659db82f4eb38ff58ebae4c57:

configure: WARNING: unrecognized options: --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --with-introspection

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a0a59c6451ec5ac75c277f186de2655196a1fe6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcr/gcr.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 97a0e22064..7f71614bca 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -25,9 +25,9 @@ GCR_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GCR_DEPENDENCIES += gobject-introspection host-libxslt
-GCR_CONF_OPTS += --with-introspection
+GCR_CONF_OPTS += --enable-introspection
 else
-GCR_CONF_OPTS += --without-introspection
+GCR_CONF_OPTS += --disable-introspection
 endif
 
 # Only the X11 backend is supported for the simple GUI
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
