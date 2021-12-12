Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC94CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 20:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B6E04063D;
	Sun, 12 Dec 2021 20:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0nQBYXrh8GZh; Sun, 12 Dec 2021 20:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BFEC4062F;
	Sun, 12 Dec 2021 20:35:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D0781BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 20:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02BC160EAF
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 20:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OKvpwhWN79cy for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 20:35:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BD5F60E7F
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 20:35:06 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u17so23936979wrt.3
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O25yRmPz3wKS2Gk72iptct1XPNmXUR02lViAPon05/g=;
 b=YpDsIzdLIawfxQK1QN2r6m9jMOb1WR8Xznv92Y/crlA0O1AP+CyUJawzGcoxcLPAgH
 TR8ag2Q09PHyEpv/ZP7W3bZoorQGDzt69mV5+7yAVFRNv2OHXaroeRivJpnRJqpmSZ04
 F8c9Ec0IMr+lqBqqbgDHnh2SEI1U6bGhomVsPNlRj1ik0BJSyUH8HSdM6wIIXfzf9ZU5
 IreveNJzZ6piuhiWJPG6bd6TpCABL76//i7d4cXSpil5TA729jfIQBRrcsVsslXdtEAs
 eTw6xJkZhCkcajazRL665P8tTVEonUrYLMQYQHo0H0SmuuJwAy7FPRIO3N0WQjc83TwF
 tb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O25yRmPz3wKS2Gk72iptct1XPNmXUR02lViAPon05/g=;
 b=EFuRBbEIbmce2W/6oErUVawg1cq1U6x72ofxnYnFE4HA4ZE00UxoruCwIcAeweghQe
 EWbPSgopjDkZyuP0onxJagtQj0gFoLxqjiUsuJH9/Q1OPqBcy5P/OyeZ1bJVo4aq1vbm
 Ux3hjBi278AEMYOfNT8ftTwQcqyaGrJm5SORWQQHWJE8zUJaEOUHo5GQCwECcPzbmuZm
 /wtABeuTQmVIFaNVVoDxQ8NiIh4XkM6mghblt9Rc6gccFhoadD3MK0d86N4XMnjmyRhL
 69Tw/cmxrcDdlM/4d5VwXRoyGeg57nBZfbpY8dCQwlKxV6WRLd6Y5oFTd5AbA5UGiaY0
 uytw==
X-Gm-Message-State: AOAM531yZ6C3CybC2echQpLIRQXpwtR9kftQt+PXajRRYR4WCsZUQu6k
 IhCMXQE4N9QQxZbcvwcsWl/k3i7RSRkBOQ==
X-Google-Smtp-Source: ABdhPJwSvY9hXRNvFQnVI/3PqEHU/Glv2EOJOk1X4jWDjXZAsR7CALKkSyFY4eRtdcz6p0o7zXUMSg==
X-Received: by 2002:adf:facb:: with SMTP id a11mr11640557wrs.18.1639341304351; 
 Sun, 12 Dec 2021 12:35:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id y7sm8306005wrw.55.2021.12.12.12.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 12:35:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 21:34:47 +0100
Message-Id: <20211212203447.944473-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gnupg: add SELinux module
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

Support for gnupg is added by the apps/gpg module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnupg/gnupg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 9729441bd2..68df11a0c3 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -11,6 +11,7 @@ GNUPG_LICENSE = GPL-3.0+
 GNUPG_LICENSE_FILES = COPYING
 GNUPG_DEPENDENCIES = zlib $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CPE_ID_VENDOR = gnupg
+GNUPG_SELINUX_MODULES = gpg
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPTS = \
 	--disable-rpath \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
