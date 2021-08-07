Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51E4C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:13:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46D0561057
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46D0561057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 161B640418;
	Sat,  7 Aug 2021 18:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_4YqqSVZOzx; Sat,  7 Aug 2021 18:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8632340403;
	Sat,  7 Aug 2021 18:13:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DCFB1BF403
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E0BB605C8
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WRA3ZamU6dty for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:11:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C280D60689
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 18:11:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F28118CA78; Sat,  7 Aug 2021 18:11:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:56:01 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: c3a88fd434b45a906e4429bbbf2040a430ce0484
X-Git-Newrev: bde89f9a0fa34e07a7203e73b489d8569498ac46
X-Patchwork-Hint: ignore
Message-Id: <20210807181138.F28118CA78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ibrdtnd: fix
 build with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=bde89f9a0fa34e07a7203e73b489d8569498ac46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c3b873dd443eaf59e64cbe3d06e5fe096a65515a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
