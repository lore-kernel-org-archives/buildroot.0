Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6703DC433FE
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 10:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1936A40190;
	Tue, 28 Dec 2021 10:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpzRbXf-C66E; Tue, 28 Dec 2021 10:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DE51401D4;
	Tue, 28 Dec 2021 10:23:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5D291BF362
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 10:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4E11401B9
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 10:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rkLpDh60JKN for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 10:22:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5B5240111
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 10:22:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q16so37439736wrg.7
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 02:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LBa/9K2l0TfM7vscUHqdsthrVKssqky2NONPMWP+syE=;
 b=nZggfXq1NFjqoLVvYa8ds+gvntbpwiZiQtaZtuHyoaFYt6DmrfprWf5pdNNQUPNHyy
 hVBszKuzkLVor4eiUvB7VMiJ282CT98IMwpeZMzueWvxA6tU/MtwAg1uhXjMI/vTTLFG
 BKu1ndWwOwPPxAty1+KxTBv86i9tqQfNo01mfr8E6LCXOXQivEHsFA0L4HqJTqG1GSqI
 APj1Rpl/O139GcdYMbR0uoArF0xNwhyLF/0C9l7rLxERxflu1z6z0+QALaFEPre95oE5
 X6drPyHRCmsJcR9yKfuANhRzvo8iIGUP09sOBZh1K0CYbUON8Y17zNBr0xtOvVVYj3bw
 mniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LBa/9K2l0TfM7vscUHqdsthrVKssqky2NONPMWP+syE=;
 b=Ewmi6ZiyB2Ea9HguNZ2Hc5IZsT64WMfhVwjgCDrwpWUQACNHi30V4mMv5bYaaI+WUy
 cwhYnwiJ4LPrGelnDqyf0M7VRvJnN2MUGrV2AvQok4giT73wIPacmoFcDGWK2bKjrKtv
 4rfFO1kcy4BzM/I2DRzenVGVpyiVTcUiABuYAXO68gl8ixHRICu6luMt2NWY88z2Xk0z
 FknJlnqRPlHcArLKf6jxtEAEKFLA1kXhKaiP/MTxwvTYA7PprdstSFnDn9MQOeVUPvcn
 cOqZR9WXUSVZDOF6BTwY+a48DCVYJO+H4p1dY3kAIeV5bJ92ol+nrAO3qijTK55XTMwv
 uTaQ==
X-Gm-Message-State: AOAM530bt1/oX2CqyVYC4uMZashODvNCf4fLUf9abQJFDL0mZhbXT0Eh
 S7yGQ/QYNkSNYPyOk6Mm+tgYr7PhHujuhQ==
X-Google-Smtp-Source: ABdhPJzctySrSLVFEC8a/UjIaYu7WKTfDhsnd0LEkiOIKdaWboRmf5+7WTNm9ZvJ/u4FkBsn2lGpdA==
X-Received: by 2002:a05:6000:c6:: with SMTP id
 q6mr15602501wrx.181.1640686947681; 
 Tue, 28 Dec 2021 02:22:27 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id i8sm18635786wmq.4.2021.12.28.02.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 02:22:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 11:21:30 +0100
Message-Id: <20211228102130.3575690-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211228102130.3575690-1-fontaine.fabrice@gmail.com>
References: <20211228102130.3575690-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/pangomm: bump to version 2.48.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to meson-package as configure is not shipped anymore

This bump will fix the following build failure raised since bump of
pango to version 1.50.3 in commit
6b2b1d26cc34553c651e32e8fa37111930e53b9e:

attrlist.cc: In constructor 'Pango::AttrList::AttrList(const Glib::ustring&, gunichar)':
attrlist.cc:38:20: error: 'pango_parse_markup' was not declared in this scope
   38 |   gboolean bTest = pango_parse_markup(markup_text.c_str(), -1 /* means null-terminated */, accel_marker,
      |                    ^~~~~~~~~~~~~~~~~~

https://gitlab.gnome.org/GNOME/pangomm/-/blob/2.48.2/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/efe5015ddb4bede6669ad5b1e4f027a2e076d16b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pangomm/pangomm.hash | 4 ++--
 package/pangomm/pangomm.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
index bde53e4fbd..3fba695831 100644
--- a/package/pangomm/pangomm.hash
+++ b/package/pangomm/pangomm.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.40/pangomm-2.40.1.sha256sum
-sha256  9762ee2a2d5781be6797448d4dd2383ce14907159b30bc12bf6b08e7227be3af  pangomm-2.40.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.48/pangomm-2.48.2.sha256sum
+sha256  e1d75522c53f462799875cd247f9b49c91ced4b1abe68387ac35b271392d4ea5  pangomm-2.48.2.tar.xz
 # Locally computed
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
index 9edcb16474..af90d69c4e 100644
--- a/package/pangomm/pangomm.mk
+++ b/package/pangomm/pangomm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGOMM_VERSION_MAJOR = 2.40
-PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).1
+PANGOMM_VERSION_MAJOR = 2.48
+PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).2
 PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
 PANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
 PANGOMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
@@ -13,4 +13,4 @@ PANGOMM_LICENSE_FILES = COPYING COPYING.tools
 PANGOMM_INSTALL_STAGING = YES
 PANGOMM_DEPENDENCIES = glibmm cairomm libsigc pango host-pkgconf
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
