Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4F0C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:45:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9748361037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9748361037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 742D883C95;
	Tue,  3 Aug 2021 22:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1LEIXN1OIIP; Tue,  3 Aug 2021 22:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27F783C86;
	Tue,  3 Aug 2021 22:45:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 191231BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4ED74058D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yV1chDgbZwld for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3D0B40544
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 360CF810E2; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 May 2021 10:30:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9e21579c13d1a0225e987eba172f3f0254a4eb3e
X-Git-Newrev: e1e0e275c6715bf2963bdcf32d7008321e525d1b
X-Patchwork-Hint: ignore
Message-Id: <20210803210945.360CF810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pillow: add xcb
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1e0e275c6715bf2963bdcf32d7008321e525d1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libxcb is an optional dependency since version 7.1.0 and
https://github.com/python-pillow/Pillow/commit/3c39e6fcf6a11b18eec0d1c66710bcd35033d069

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pillow/python-pillow.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 3018758b48..ab52f38df1 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -35,6 +35,13 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-lcms
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCB),y)
+PYTHON_PILLOW_DEPENDENCIES += libxcb
+PYTHON_PILLOW_BUILD_OPTS += --enable-xcb
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-xcb
+endif
+
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += openjpeg
 PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg2000
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
