Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4167FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 21:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB16C60B97;
	Fri, 14 Jan 2022 21:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c256RANo52NY; Fri, 14 Jan 2022 21:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E2D60B1B;
	Fri, 14 Jan 2022 21:47:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE9931BF36A
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 21:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC92560B29
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 21:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VlK1CNr2EFf for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 21:47:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A522460B1B
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 21:47:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id c2so3003475wml.1
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 13:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y7j88a3FKidpWsKB8N5VgWsBUFzebL6ubLxzpv5X2ug=;
 b=JAPkW/vAmAP/h10yOVxSD7lkblTyGQlM2wTkhfSXxPt+cFdphJIe5hHCmJXYyLpPPm
 RvX/78lQUpcquAQ1gJwMXPoDBOc5YUpsqnJUhi9totjf1ePOCGCjWLr2p92mU2YbKQt8
 PUgE6YbJD1YKQEPI3+FAfwhLjVVftNznihCkDtir8P+iVoFSxE95tZreBy4kxSww0WIG
 0KTWg+eo9atLF5IOTTgDB6oPiO0RClr66voIk80EqKoy7hgPNPoi4xLrKJ0dGAuFnQlo
 NavR7vCW7+8fygDxw/RYYqRmG8ZaT2czBFDEIzVmXvqk9dYjohctUcCtZJlqEKLl8F6y
 9hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y7j88a3FKidpWsKB8N5VgWsBUFzebL6ubLxzpv5X2ug=;
 b=MkH70qPVkl1TvUvNdspYNJ4SAqhCiq4YvdthNmxPDHbAlunvp5MNy67htFHaNMT6E0
 BGnIpGgH+l9M+d7LCJIHLf6GTIg1stFkQwQiyZxMpiSSepMnuC/oOcYBH9Gpxpn8V3mg
 KZCOpOmVKqM4R0BnE4D6x/4goWnoXBBefUCHLQf6fwUzmG/Dhc9Vk4Wh8kjwdhxd6hfE
 3yP/Xt1ep9wi8nlkTd85vd8D0+9zOgiVwh3kdvNv7y969R+yYwLZaLoAerMzUUO70N3i
 vugiatg98PiwoUvGopWp88PJzkwVEiMEZAe51cDlL3wZEmm6Ck7dkRI+VXDyLJ1Z13mn
 5b1w==
X-Gm-Message-State: AOAM533EQcOuIgOqnl5FGt905Ux9zm9p3Uy2a/4NSXHfVJpuWUx58ZNx
 4WDgH8CINokXWrdJ2m49RzvdAjY9A6M=
X-Google-Smtp-Source: ABdhPJzdtN5WCULHwL32SbFAtPz5yCObpsTZj2HCS43ri4+cuwsoxu9zbPH1HRVE9Trm9JZr48RbhA==
X-Received: by 2002:a5d:6549:: with SMTP id z9mr10082435wrv.567.1642196828771; 
 Fri, 14 Jan 2022 13:47:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id p4sm6973129wrr.6.2022.01.14.13.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 13:47:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 22:45:26 +0100
Message-Id: <20220114214526.1153063-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ipmitool: add freeipmi optional
 dependency
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

freeipmi is an optional dependency which is enabled by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmitool/ipmitool.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index facd97a0b8..801f1ea6b0 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -19,6 +19,13 @@ IPMITOOL_CPE_ID_VENDOR = ipmitool_project
 # 0013-fru-sdr-Fix-id_string-buffer-overflows.patch
 IPMITOOL_IGNORE_CVES += CVE-2020-5208
 
+ifeq ($(BR2_PACKAGE_FREEIPMI),y)
+IPMITOOL_DEPENDENCIES += freeipmi
+IPMITOOL_CONF_OPTS += --enable-intf-free
+else
+IPMITOOL_CONF_OPTS += --disable-intf-free
+endif
+
 ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
 IPMITOOL_DEPENDENCIES += openssl
 IPMITOOL_CONF_OPTS += --enable-intf-lanplus
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
