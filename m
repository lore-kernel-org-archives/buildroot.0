Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4D2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB14B40581;
	Sun,  9 Jan 2022 20:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QW9nqvJegopg; Sun,  9 Jan 2022 20:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D813240558;
	Sun,  9 Jan 2022 20:03:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C88E11BF20D
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5C5C40877
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXSwf9SpSJU3 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:02:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED7FA40875
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:02:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso8533753wmc.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 12:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aa4lj/PpCmwP1q68EQNolu2+MwBvpCg0m2Mj+hvWkhY=;
 b=mY1FggcAZ0/0CPfQftJCJn7a6ri20IfcFvT27aWdRu5EyyGUfP5aThwZjhBDo/V1kc
 QOvkFAJbNEskj7Jap8p+2xx7S1/yW/PUd0ITAXeXsy9yNqQKXxPJOWqciyqfZGxw3rMp
 gvfohYQQwyuGD9aKwmJZwk+cjBINyrnEw+IHtm4P6mJc0ralTqhjO8LL5sb/h17Bk2T1
 k5xA64n2/k6jx0GI3YyMFgBVp2fbCqW8YFlwYMm2oCEzjAnEf01xSBPc/LFF4+zwuK9r
 ez8/qqbLZtqZheGKuCEP+8K0ANgWglYjOfyaPkiOgas1/KmGOoiPisfGhNIIBOUflv1/
 Lm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aa4lj/PpCmwP1q68EQNolu2+MwBvpCg0m2Mj+hvWkhY=;
 b=Gw/DOkBc8AYyI3GiTi1yZW+iSDnfsxqfTyEJj91v+5RAYVyuR0w2bq7uqXNH5f/Bvq
 gjuwtF+CVcQSSQUWlrm6PQ7Ft2UzbXVqjLJk+Z3xLqJEmjMFjk5+4vGzQhswex5lDhVp
 q8hOf0GJBs/VNuVFd+OLj/BHTALVtaqlL12bypON30JSD/IB+Bd0m9CVhhqT/ZN86O5w
 CBUj8sDMxXtcKenWfqx4RcUPUG1A2rglxiB09AQ1MyWMWFbMg9dLxVKVL3i1OJK7z0zt
 XHbjLE7iA84yEUyXeNOnZbrt0v+MhSAxgOG3EREbG8kLuoSucg0URZ7Lu1tr/xTocbaa
 UhOQ==
X-Gm-Message-State: AOAM531L7y8rebaGyPFDE5X1wtKH2c2JYtpKMnOHuPI5mXGTZJtsscQW
 ERSOCUVHSkvSNKHGUWQLbZnPP7+Xs00=
X-Google-Smtp-Source: ABdhPJz5Dq5tHi6JfSKgo7UZBKphVem3ltmo4NMVPvty9q0yU1MTsVOa1YDmtz9ojua/v3YZ+i9njw==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr18810238wmi.136.1641758574090; 
 Sun, 09 Jan 2022 12:02:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id z17sm2044678wrr.4.2022.01.09.12.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 12:02:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 21:00:38 +0100
Message-Id: <20220109200039.3188788-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109200039.3188788-1-fontaine.fabrice@gmail.com>
References: <20220109200039.3188788-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/libvirt: disable sasl
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

sasl depends on libsasl2 (https://github.com/cyrusimap/cyrus-sasl) which
is not packaged yet in buildroot and will result in the following build
failure raised since commit fbf25acfbfd5a73b3560918bea081768abbe5723:

output/build/libvirt-7.7.0/meson.build:1212:2: ERROR: Dependency "libsasl2" not found, tried pkgconfig

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 0c1ee82f43..816bb0760d 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -63,6 +63,7 @@ LIBVIRT_CONF_OPTS = \
 	-Dpciaccess=enabled \
 	-Dpm_utils=disabled \
 	-Dsanlock=disabled \
+	-Dsasl=disabled \
 	-Dsecdriver_apparmor=disabled \
 	-Dstorage_iscsi=disabled \
 	-Dstorage_iscsi_direct=disabled \
@@ -212,13 +213,6 @@ else
 LIBVIRT_CONF_OPTS += -Dnss=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGSASL),y)
-LIBVIRT_CONF_OPTS += -Dsasl=enabled
-LIBVIRT_DEPENDENCIES += libgsasl
-else
-LIBVIRT_CONF_OPTS += -Dsasl=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 LIBVIRT_CONF_OPTS += -Dlibssh2=enabled
 LIBVIRT_DEPENDENCIES += libssh2
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
