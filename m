Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5936C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 06:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 574BA812EE;
	Mon, 24 Jun 2024 06:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlxOuWVXFK-X; Mon, 24 Jun 2024 06:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4605881348
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4605881348;
	Mon, 24 Jun 2024 06:58:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCCB61BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BABB681348
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMq3JLDrRepi for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 06:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70AA3812EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70AA3812EE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70AA3812EE
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:58:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.90]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f9h-1sKoJJ3XAt-002jNv; Mon, 24
 Jun 2024 08:58:34 +0200
To: buildroot@busybox.net
Date: Mon, 24 Jun 2024 08:58:34 +0200
Message-ID: <20240624065834.12048-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:e+yQj9ED7UPlZrUAeZ6Frm2fvFAZY5M/P+vs0SlAgTxJQ7jG76q
 IV9vRnsnlumTLcfbhXQMhRpwFbBEg19A+2C1+sE9NuBZsF8zOGahSl2DsZzyxQovBl2cDWQ
 amKfw0aslEeGI7cYzk6IOdvAKRuTEI081VFLeFUiLrOHFWwi7dWkgE35/ntuxDSijF6lX9H
 cuzaGyv1jkkSVe5IDeJIw==
UI-OutboundReport: notjunk:1;M01:P0:sMDA1UWOCPo=;jFv8C6nZQswLtOaZ6aq40yOrmU8
 yEICn+84jcE/HTaTcuDZt2lb1SmGZ+tDhjzkTBrfgZwWqYbmTOkPxHu9Bhqz8XJibcgQJaB6D
 CwBOZpkuJBbiGb0G7PeAO5tEbsLNfh2UzpEn7SI6cUsoDNiksAVb++ppOFFe50btnFgVyAGfN
 B4Pv2w7/wgjuf8OrJy1QyjrpXBTfdFGzGNY6ouB1CLB2QGqrUGC7Pk1Tuh+PPj4tkjo8mdgwd
 1kUphkfwhtg/zYBaQa2U1CBQqSan9IFYKpsBVxGHEnt0NSCt8zLaeHtcyVaJaNebJ0yejWhTZ
 yA7GmrenxEbe6CypobGS7SeUqazKAsSDv7gAtIbKEp0kJAZLlOiEqCTAnjcy8nK238eHo8tJ5
 sEIdkBYX2U4VvwJN+VhCJj6tESIaMbD+MFuy9wqJGp4CP4c045t8YG5I5RfxUZ4H6KuDadj+q
 wkWDDlnwGoZRWQ7jSYalBZi/CKoMvhNvAjUc02F/qP44RnfkEBG75XDWwoMdM9t9ZbQrl+qB6
 iplfwItHvkusAk4PF6LwChG9hRqHAiaMJ3A66khIsvg4X7S6SdaT81t7qeLY1+uKC1UQ6ovL1
 93FLiBvKxoFdvH5YImJgV/SOV91JQiew6ghfP20ysKP6fTlxYK3ArRobxEnVjd7/a53HjSrZt
 i0MYQMSUF4Jg3cW+C+sk8BG5ZHA56vK2oLFSSIfYSQ/LRxbl7b6Rv6SNT/pCRtXeg1WthyCcd
 lzt2K0qsunPTRkMfZqSt/VZsI+pEZB27DcrCpXi9FcecKLsBHyOVSkikEeMKPcLQI2SWHa9g7
 Zt0T8Wibnebj57DxnNEqagBGbDUPZ/YwT3X7CgBC9HahQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719212315; x=1719817115; i=ps.report@gmx.net;
 bh=SgxDCPp+FA7xKBoOn/X7HKE0q1yJV1qAaMeFktUIVyg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OMfmF9VxyLFrZP7xZ137ASZEsihJ6/3b9TumMZ+m0jhYGgzC93j2vNZze53BvyC6
 slBMfe5MK5trGaisjsykm6NweLd2YkgEtgAWv+mVdD3/ER4A/Jc72+Eq14xfw13/Y
 6y9Sf7YTD2dKoRAyx4TrPS4bkHohAjxGqH+dYueUCn5rQxkM3cxh2FwpRwskTzqyf
 R/28+XCZHrBSTefMe4oaiKHJsazcgMBPBKiUXkTVwYl1QFJpFIio0/jWIFH0lsl/0
 hiBwEJXi4RYJP0gsJVD1iAzCdAi0ceQ4wgq3f8DTXq+ekSJFGdH1Xfs0BS036X8Rk
 csmamf3TNhtAibPOqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=OMfmF9Vx
Subject: [Buildroot] [PATCH v1] package/gettext-gnu: bump version to 0.22.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://savannah.gnu.org/news/?id=10597

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gettext-gnu/gettext-gnu.hash   | 2 +-
 package/gettext-gnu/gettext-gnu.mk     | 2 +-
 package/gettext-tiny/gettext-tiny.hash | 2 +-
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index 7c649843f4..a16c3f11e0 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,5 +1,5 @@
 # Please keep in sync with package/gettext-tiny/gettext-tiny.hash
 # Locally calculated
-sha256  29217f1816ee2e777fa9a01f9956a14139c0c23cc1b20368f06b2888e8a34116  gettext-0.22.4.tar.xz
+sha256  fe10c37353213d78a5b83d48af231e005c4da84db5ce88037d88355938259640  gettext-0.22.5.tar.xz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index b7d0cf213c..31606e1f5c 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -6,7 +6,7 @@
 
 # Please keep in sync with GETTEXT_TINY_ARCHIVE_VERSION in
 # gettext-tiny/gettext-tiny.mk
-GETTEXT_GNU_VERSION = 0.22.4
+GETTEXT_GNU_VERSION = 0.22.5
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index f7ed50b49f..ba22fb0149 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -3,4 +3,4 @@ sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettex
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
 # Locally Computed:
-sha256  29217f1816ee2e777fa9a01f9956a14139c0c23cc1b20368f06b2888e8a34116  gettext-0.22.4.tar.xz
+sha256  fe10c37353213d78a5b83d48af231e005c4da84db5ce88037d88355938259640  gettext-0.22.5.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 3fe8a781d9..de91b24704 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -15,7 +15,7 @@ GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
 # Please keep in sync with package/gettext-gnu/gettext-gnu.mk
-GETTEXT_TINY_ARCHIVE_VERSION = 0.22.4
+GETTEXT_TINY_ARCHIVE_VERSION = 0.22.5
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
 	gettext-tools/misc/gettextize.in \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
