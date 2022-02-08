Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BC2C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C6B48269C;
	Tue,  8 Feb 2022 21:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytd0LYq6Kq8z; Tue,  8 Feb 2022 21:26:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B396E829DB;
	Tue,  8 Feb 2022 21:26:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5224D1BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F233960E2F
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vI7MB00GTJwT for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAE3C6077D
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355449;
 bh=DTbJDkEKLnUeGt/Rg+lkkAXtkUC5O9jSI060j+Uw2Hs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LGHqg+NXsmsBdpl8iVbwY5M1yXKCjh14TnlNnvj98Q5bYzW/LaQez/IsZVQ22PMNu
 i2Fx8q8bMiC//Yl0i2mPAcH1OKjg3GSIWnw8v2m3hVglQVjn9muu7Ivomd8NcBptdZ
 uxWtv5IrkNyCFRZZnihs2vMBtnhQHjq/BOxYqAgc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCfJ-1nmZCa1AQ5-00VCfE; Tue, 08
 Feb 2022 22:24:09 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:24:05 +0100
Message-Id: <20220208212405.19243-14-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:rGx368SUMZOAU/IKjFNYALdZwGw12Senze8LBCQDLX0SJ2CXOVi
 EOga6nlaq+viaEhqnTpPS0VYXPe/jQAIOU9TPueoz5Ngm3O/ZnM4Q5KJSifsrm0qFl/1Jqi
 5A+ZtGgDBy5DH//Oh1znqIi3L279yfSIk+qCOu5y0T+L9G9JRUknFrW0tdW1dHVEJ6IS6Y5
 Q4H77HyZ+Bpv6FUHwKWXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RJPXxcM1DfU=:jdHs7KJtR6URrmc3/Be+Ka
 0QuF0CHOe1LGF897zO9GHwS2VuyqxyqAqYXVeu8v6GkziklCr//Rn2DJfOG8lZgTjOBjZ2Naj
 NBFrqcEC6MUmOiL0Q4dO6kSSWl9TVlCLfOWgiWaq+1tMi2YjluoaPL2FF3poD9Npl7SZaddmV
 NSes3J63bQCSU4Zx7RxLIajh2CQRQ2oayNwdRbpqqYwYYl43pPd8tUH9/RmP1ORCDiy0naZ20
 1O+3rsd4emVj6BFU5ZI79kLCfNSxrnocFdQM0NoC2VW/03HnfDb59cImjEkgJSj75yPHNXold
 s8aUW4xCC3NQ8IX4zO/anqJhgZdz9yxWg48PuE3nNvFge+cjutgcsnM81dhsmsokOWxdf8jrK
 QDmPxqxRCDGok8JqGL7AQoWyw6dtc0y/k1C9RJPG6FyjEBoMPGVvkYJkChcvmRQZ422C+ehMK
 XZCq/j/xLp5yVGlkrDUio4o8nZ++DvtHDCFLgErN8nzoTuFs6XCwmU+P7g4HHwrlgvuXJQyzI
 nWnw+CILFUBaxpJJof881k7N1t0hOdarvYw38TFVMtBwC6wjabmJ7oU6t2kx5sNb1YLntMQO/
 RkqB+Vqf8hukp6Os6m2gEcKSXNuvcD9qCV6/dfn1IN05s4I29YE7cM1iPCLoCCgodKIUXxd8a
 0SGF/RR+ywlDVi2sEJGcbpizvqCaKGF6CV2+BgDIRC21Qd6Ogq7CY+mIi69BpZdrBbEZEUxRV
 X91O95LWJv8i7gPNHr/AEk9p7VM+svhKQpkEQ+nmrXg6gn1+b5PkxW8gIuyiZxOXXViETgr0L
 tBLvNFD/XaF17tsoxaVD68IjmhWAJahb6eiUI7F72oyScmtdsuHmByEYms0QGXejp0E3GW7su
 +wHdaC//fMGNmWTEEtl3DxBqL9I5dRljWXCYTXKrMyLDXH6yKVUJqsXv5e1PCfQ/IKHPSJD3+
 sMboZD12Zmaf5LsFNLbXxlfq4yYKn6UV0pgoZ9NvmyEcCyW+TRldyrU89QX6lRZj7oK1y/qGm
 LmLgmif03yFWKWIXUKL9zwg4CvR8YS2JwJvf439+05orUmOyftxjNisnKZeWFJn5O4TNbOyEV
 /8UZuAPTg/y5nU=
Subject: [Buildroot] [PATCH v1 13/13] package/gst1-plugins-bayer2rgb-neon:
 fix plugin install
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- fix plugin install path, add '-with-plugindir=/usr/lib/gstreamer-1.0',
  otherwise the plugins are installed with duplicated build path
  (as detected by step_check_build_dir)

- remove GST1_PLUGINS_BAYER2RGB_NEON_INSTALL_STAGING (no need to install
  the plugin to staging)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gst1-plugins-bayer2rgb-neon.mk                            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
index 815099e315..0d4aeac7f5 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
@@ -10,8 +10,6 @@ GST1_PLUGINS_BAYER2RGB_NEON_SITE_METHOD = git
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE_FILES = COPYING
 
-GST1_PLUGINS_BAYER2RGB_NEON_INSTALL_STAGING = YES
-
 GST1_PLUGINS_BAYER2RGB_NEON_DEPENDENCIES = \
 	host-pkgconf \
 	gstreamer1 \
@@ -20,4 +18,6 @@ GST1_PLUGINS_BAYER2RGB_NEON_DEPENDENCIES = \
 
 GST1_PLUGINS_BAYER2RGB_NEON_AUTORECONF = YES
 
+GST1_PLUGINS_BAYER2RGB_NEON_CONF_OPTS = --with-plugindir=/usr/lib/gstreamer-1.0
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
