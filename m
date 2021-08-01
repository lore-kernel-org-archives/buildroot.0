Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69297C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:30:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2755860F22
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2755860F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00ED883AE8;
	Tue,  3 Aug 2021 22:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0sd-h3SOZAx; Tue,  3 Aug 2021 22:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E20883A99;
	Tue,  3 Aug 2021 22:30:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4141C1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAF6183A70
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uy3UG74hQS0A for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 129A983993
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5BCB48750D; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 11:36:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3d61b037392b1972d54cc73abd9498d564c7b89e
X-Git-Newrev: c3b873dd443eaf59e64cbe3d06e5fe096a65515a
X-Patchwork-Hint: ignore
Message-Id: <20210803211025.5BCB48750D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ibrdtnd: fix build
 with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3b873dd443eaf59e64cbe3d06e5fe096a65515a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ibrdtnd/ibrdtnd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ibrdtnd/ibrdtnd.mk b/package/ibrdtnd/ibrdtnd.mk
index 0632ed36b7..20ac496fee 100644
--- a/package/ibrdtnd/ibrdtnd.mk
+++ b/package/ibrdtnd/ibrdtnd.mk
@@ -18,7 +18,9 @@ IBRDTND_CONF_OPTS = \
 	--without-vmime
 
 # don't build documentation
-IBRDTND_CONF_ENV = PDFLATEX='no'
+IBRDTND_CONF_ENV = \
+	PDFLATEX='no' \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 ifeq ($(BR2_PACKAGE_LIBDAEMON),y)
 IBRDTND_CONF_OPTS += --enable-libdaemon
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
