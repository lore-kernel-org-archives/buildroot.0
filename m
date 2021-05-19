Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05810C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:25:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C337260F45
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C337260F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9607140266;
	Tue,  3 Aug 2021 21:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KqTubGOnPDZ; Tue,  3 Aug 2021 21:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA7B04022E;
	Tue,  3 Aug 2021 21:25:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 187721BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED50C6085C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fk9DI0hWnEtB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A7CC60641
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A243789078; Tue,  3 Aug 2021 21:09:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 May 2021 22:56:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 02a0b30b2c666ebe55829373fad547ebe13e82e6
X-Git-Newrev: 1beb9784927d1a5402bcb16d618278d82c039459
X-Patchwork-Hint: ignore
Message-Id: <20210803210941.A243789078@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flatcc: disable -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=1beb9784927d1a5402bcb16d618278d82c039459
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable -Werror to fix the following build failure with gcc 11:

/data/buildroot-autobuilder/instance-0/output-1/build/host-flatcc-0.6.0/include/flatcc/reflection/flatbuffers_common_builder.h: In function 'flatbuffers_char_array_copy_from_pe':
/data/buildroot-autobuilder/instance-0/output-1/build/host-flatcc-0.6.0/include/flatcc/reflection/flatbuffers_common_builder.h:341:3: error: this 'for' clause does not guard... [-Werror=misleading-indentation]
  341 |   for (i = 0; i < n; ++i) N ## _copy_from_pe(&p[i], &p2[i]); return p; }\
      |   ^~~

An other option would have been to retrieve the following upstream
commit:
https://github.com/dvidelabs/flatcc/commit/f8c4140dd9dde61c86db751f6002def78754fced
but disabling -Werror is more future-proof

Fixes:
 - http://autobuild.buildroot.org/results/4d5cdddbfeefdeb943234b76eb08b04376f3c36d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flatcc/flatcc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
index c27809b86a..fcace691c0 100644
--- a/package/flatcc/flatcc.mk
+++ b/package/flatcc/flatcc.mk
@@ -10,6 +10,8 @@ FLATCC_LICENSE = Apache-2.0
 FLATCC_LICENSE_FILES = LICENSE
 FLATCC_INSTALL_STAGING = YES
 FLATCC_DEPENDENCIES = host-flatcc
+FLATCC_CONF_OPTS = -DFLATCC_ALLOW_WERROR=OFF
+HOST_FLATCC_CONF_OPTS = -DFLATCC_ALLOW_WERROR=OFF
 
 # Disable build of tests and samples
 FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
