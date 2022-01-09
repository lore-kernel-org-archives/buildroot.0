Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC26C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 584248143B;
	Sun,  9 Jan 2022 20:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9ozdcO8q1sO; Sun,  9 Jan 2022 20:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5495813B7;
	Sun,  9 Jan 2022 20:02:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A79881BF20D
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A215740143
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFzz3xt28ZjG for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:02:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F24AA40103
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:02:53 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso6125729wme.1
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 12:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wj7j6oyPpImez8qKL4OtI9OcI7TiLYxW6Gn1S/XquiY=;
 b=NykYvajLv1A8R4KMbwuIM6/dRXL2aTSf1yFNu1VhviDPy502ck2MnNribdJ7N6anVI
 FMCnAjbZ2KUb9flPrJy7nus9LObTezRE6xMwypWDiyDDeLXz0bZI6ALqJyzpeGWaVSql
 nfx5TqSs3ujzoI241f3LquMRXR5BkyFWLkdIpsDjplB4qIzypLe/zzWuPxJx+UpX6kng
 6LmBlOs7R5gGnLBiFIRzE875Ugw09nP1vaJ8lrEZhrJlnOqJ0k23QV+F7C1agMblnTd1
 qeqWmgRuh1P7H5j0YtviZ8ghBFVv4ROzCEpvVA0/KbShLeqq2Hv6pK3sLK+kmHsqp+w7
 0NuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wj7j6oyPpImez8qKL4OtI9OcI7TiLYxW6Gn1S/XquiY=;
 b=TCGiPW4uNZGgLk9slRMnp2qcsJTqA5AKIRcSd/VdowIvrGEtViG2Q0ctvnxO1DpLj0
 08mU2yUb7O2O8tH4IWp4MzWReoAmPO2Qsd+rCh9uJQx3XdFKZWLIyHoV+j66JnvF0yIw
 e+2nYVLP3eeVMz2NwpEsLyh6fTFnSEWh9zruD3ckyH+J7+BF9+BKDYS3CZlDvdMJefkF
 tjTA1k2Pa6zXefEowIFTUMBsIVNOZW2QVjqu3x6a71GOgO8Z6XDVpVawwUsGbsw4bO67
 NN0xm4tOIN8Ec5bLNJe3g50toxMmwGY7Pgq0w731IhBqrbm0V1QSb197x/jme4rlOSPV
 sEMA==
X-Gm-Message-State: AOAM532w/azs0thi0QUq6ruSz2IkowlIOzHC44rxxg7qveiCjChXp1+l
 V71HBS0lnBI8nxsXp1Vn4JkTG1cHDg0=
X-Google-Smtp-Source: ABdhPJyAw31y/WiV8qcMhCBRrur+HDYlP8j60E1ooIU2CNbL1ArSJASNw+uZTqRKLiUvKju1m4K40g==
X-Received: by 2002:a05:600c:1d08:: with SMTP id
 l8mr19414398wms.44.1641758572144; 
 Sun, 09 Jan 2022 12:02:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id z17sm2044678wrr.4.2022.01.09.12.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 12:02:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 21:00:37 +0100
Message-Id: <20220109200039.3188788-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/libvirt: fix ssh2 option
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
fbf25acfbfd5a73b3560918bea081768abbe5723:

output/build/libvirt-7.7.0/meson.build:1:0: ERROR: Unknown options: "ssh2"

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 41218c0e53..0c1ee82f43 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -220,10 +220,10 @@ LIBVIRT_CONF_OPTS += -Dsasl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
-LIBVIRT_CONF_OPTS += -Dssh2=enabled
+LIBVIRT_CONF_OPTS += -Dlibssh2=enabled
 LIBVIRT_DEPENDENCIES += libssh2
 else
-LIBVIRT_CONF_OPTS += -Dssh2=disabled
+LIBVIRT_CONF_OPTS += -Dlibssh2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVIRT_LXC),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
