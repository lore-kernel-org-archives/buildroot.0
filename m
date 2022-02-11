Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43897C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 20:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F07F40480;
	Fri, 11 Feb 2022 20:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ygu4tJiXnn9H; Fri, 11 Feb 2022 20:31:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90A4F40270;
	Fri, 11 Feb 2022 20:31:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 031A41BF215
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 20:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E31014046B
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 20:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fBZgIZ_yyM2q for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 20:31:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0E9940270
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 20:31:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d27so13318934wrb.5
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 12:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ToDmxbOftSYKgVpgDiBT/cMGtbmvpvwcAjF5lhIsreM=;
 b=I0cYC8+cB2HxG7O5PTkaf2yvoyQ9cGXXoGDaNCmFA4bkp8JxYsaZ78y664PfFPkDSM
 HfvJYY1rfQuK8iBwO6W6LhOV5R+/t9ymUnaVARWbXlDf0prsW9ppTI1KJ26oavemjl9S
 itVPMKkBTmLbjczxEeX505UP38Jb6fFEHhIFUo7mm5V3yWKwALtfroeb2A6m6TbZkFt2
 0Xmr7xwILPfmAa1EKYwr0HQUeyci3f5w6EUzndSKG6J4NvwcxAYQXfTZPp+podoJfkqs
 vXDHt7wwMpUBQrXyKH/MmX3qzxbktIPWUs3XJDR7lXkMWNAkyzzy8DSQvuH0AgMWljpG
 FqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ToDmxbOftSYKgVpgDiBT/cMGtbmvpvwcAjF5lhIsreM=;
 b=f0sYYqPMw+JEptKZ86xUOjXcDVtxDpgsX97wXTxPwApRBg9DWBCdt1dX41GqpYhv6B
 HL5tupeC0yfS9eXdze9PxxVjfMTWNXLWY0Db3LQgeO6ftar1NdVi0E4FbRqGCcPUhty2
 WtoA/XJsjhaiXx1G+dT2ZV0CBFr+PorUunxXyStQMsrh2ZRDXjMUT7bTLD2+UK0ckm8u
 rPOSOsrd/xSX4cVQ4vMqt3qGYDdO+29IkiWH7nhPsw2N29YqdKZy2hr8jQDu/q728u3G
 7l1yqXXrV8VrT8NFYkhzdgDEdckJSFAoj3IPF6nc7W5Dxl9BPPd9o/HWTwDoy+ZiKi4p
 hrCA==
X-Gm-Message-State: AOAM5322LCIhjlVvOJGG+QqoWXTKWYge0B3NC2rBDKXW6Ek4Jt+yb6Pg
 c6hu88b72djDUfaAuUgEDvsmWzPF9/4=
X-Google-Smtp-Source: ABdhPJx2ZQuj9UjFZQRBIienzC/MS2ZSwHFArp2be0XRmLmeU8LU0dzteek1X/7eyKp1qlVZV3Ij8Q==
X-Received: by 2002:a5d:50cb:: with SMTP id f11mr2611961wrt.178.1644611508629; 
 Fri, 11 Feb 2022 12:31:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id e8sm7465848wru.37.2022.02.11.12.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 12:31:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 21:31:43 +0100
Message-Id: <20220211203143.603357-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lzip: switch to tar.gz tarball
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

One of the autobuilder seems to have an issue with tar.lz tarball so
switch to tar.gz to avoid the following build failure since bump to
version 1.23 in commit 4648090a89a2478a4b0fa8cc43a49bc94668622c:

tar: This does not look like a tar archive

Fixes:
 - http://autobuild.buildroot.org/results/76d8afa81e478cb4f408292484f67898236ca5a0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lzip/lzip.hash | 2 +-
 package/lzip/lzip.mk   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 5e285a5ad8..48ee8175ca 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
 # From https://lists.nongnu.org/archive/html/lzip-bug/2022-02/msg00000.html
-sha256  ea02b9e6fb25d0e1a1d3ef4fdeb6ab26b931f1ece66fa1cee2983c95215e930a  lzip-1.23.tar.lz
+sha256  4792c047ddf15ef29d55ba8e68a1a21e0cb7692d87ecdf7204419864582f280d  lzip-1.23.tar.gz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index e3cc86b956..31b5750767 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LZIP_VERSION = 1.23
-LZIP_SOURCE = lzip-$(LZIP_VERSION).tar.lz
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
