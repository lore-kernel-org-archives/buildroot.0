Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D413FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 12:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F5760F65;
	Tue, 15 Feb 2022 12:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxY1VFfFDch9; Tue, 15 Feb 2022 12:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB8B60E5E;
	Tue, 15 Feb 2022 12:46:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E8F61BF97D
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 12:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AA9D8271D
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 12:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o9cLEYJi3SD8 for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 12:46:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6D3D82660
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 12:46:29 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id k25so43966844ejp.5
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 04:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zu1j8bhrusqm2OBTfknnxKx9kgbBhOGFUKKrEFlwURs=;
 b=RdpptzxBN+Tuoejb4a6TlYICYk4pIGWaRyn1L0nx8aT9Dwq7feljZy6WXIARb85WKR
 1CPP6Fikt8E37neJsM3eRr1PFizz8IzpmEPvPIAnHaAiLbGo48PR4fAwIO8Z1tqAHTOW
 Hc6h1HqVSKxQIhvoxO9L5xZBO1P4uz/j/D96a/n69uQCa6DwGj+AOp6lkVawUHZhWTY/
 sDq0gh9aTWsG+Ma/G7inHDbcnnLXAggGkz7XZJuC6s6CRgMWpCjubMQA8dC5R62J/aFX
 /kCVSIdOd704dvYldkMIqt8C6dRCs72GKjI2rIdO5mnB1As6jwOR/+MJB5a6zIviqY6+
 US2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zu1j8bhrusqm2OBTfknnxKx9kgbBhOGFUKKrEFlwURs=;
 b=UuJcBODtWjawF30c1Q+bH7473uG2r7PoN6phHpjawyzbLFi0Z/Raz4wPkECpP0milQ
 2UdmP+XZbLvpocjFtz0wZ4EmF0B6WF2aRpdmbwrWDHAvClFqgCyiWCU43r94byUWTbnx
 12PZ4BR1SAZh552muCiNC6Y3UmCR4jzEp0uI0NFF8y834S0BTrxbcLSlP1soa21j2QaI
 Wx2psCEavbNjdS82+skDg9HjTKNDV9L69a2glC39TImZXeQb5aXkQuHyTDj3mqC7ZSdp
 H3xuPpZjIOgyBn39pxZcIFWwxbyyazufEbQvE+AWI2lMg2msizWMs6WC1VpqOdFOu+CW
 bsTg==
X-Gm-Message-State: AOAM532M6zQaPVbziQrMSDO3Qazb7HxYweDxMZQbto/IgmYKKgIGTwgu
 6pr1PkCHthRLUINTISPuaZHeByiD/e42cw==
X-Google-Smtp-Source: ABdhPJztCHAThPLWC5eIuWu1tq/dg3wjrlhHLFjv9pet5AiDl7svay16EA/4SixP+RlYkD9sbrTrmg==
X-Received: by 2002:a17:907:c1f:: with SMTP id
 ga31mr2805253ejc.347.1644929187865; 
 Tue, 15 Feb 2022 04:46:27 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id v30sm2356056ejv.76.2022.02.15.04.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 04:46:27 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 13:46:17 +0100
Message-Id: <20220215124619.563502-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] toolchain: support mismatched merged usr
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
Cc: Romain Naour <romain.naour@gmail.com>, Norbert Lange <nolange79@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Look at the case where the source toolchain has non-merged usr,
yet the target will have merged usr.

sysroot/lib/ld-musl-x86_64.so.1 -> ../usr/lib/libc.so
sysroot/usr/lib/libc.so

What happens is that buildroot copies the ld-*so* symlink
into usr/lib, at which point it becomes broken.

We now detect these broken symlinks, then try to find the target
binary in the library directories and fix the link.

Fix the case where the lib directory is a symlink, and no ld-*so*
is installed by adding -H to find.

Also use `cp -t` instead of some rarely used xargs tricks.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 toolchain/helpers.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index ef8e9a5f64..aaf2aecd80 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -135,8 +135,17 @@ copy_toolchain_sysroot = \
 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
 		done ; \
 	fi ; \
-	if [[ ! $$(find $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
-		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
+	for i in $$(find -H $(STAGING_DIR)/lib -name 'ld*.so.*' -xtype l); do \
+		LINKTARGET=`readlink $$i`; \
+		rm $$i; \
+		NEWLINKTARGET=$$(find -H $(STAGING_DIR)/$${ARCH_LIB_DIR} $(STAGING_DIR)/lib $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/lib -name "`basename $${LINKTARGET}`" -print -quit); \
+		if [ -n "$${NEWLINKTARGET}" -a -e "$${NEWLINKTARGET}" ]; then \
+			ln -sr $${NEWLINKTARGET} $$i; \
+			echo "Symlinking $$i -> `readlink $$i`" ; \
+		fi; \
+	done; \
+	if [[ ! $$(find -H $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
+		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 cp -t $(STAGING_DIR)/lib/; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
