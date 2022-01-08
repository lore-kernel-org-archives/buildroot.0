Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260D2C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C97D760A6F;
	Sat,  8 Jan 2022 15:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IZKsRpFysFr; Sat,  8 Jan 2022 15:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3261460AA9;
	Sat,  8 Jan 2022 15:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 427081BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 307ED60AA9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzV--jIM6La5 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:42:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17CCE60810
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:42:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a5so13338289wrh.5
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DC28dFYcSft5p2AD+ioacbUl+T18JigloB9JBv30KfU=;
 b=GAxYXb+rhkvecsuBSSBtoHBSqgiXE/x+RRl87uGX2EqLwphKnhwXLJz7kS/wtsMmap
 DBSAoAMVJrFLO89wehEB1GqVFcue7KoGeDZRWoBVUOYOH/A24cmlDfAfnkspup8J1wbX
 /OnEo1JipMIaYcd1RuUJzeSEvL3U9jwLOotQMuiQnPbdV5b7AWAxOTvzfGHjU8nuDpdp
 JTQhN9Giax7ZfgQhy3sUPFHaznujkKHwyIPYg95cvjogQwRY978jI9pfjZ2Xwyvv1zcA
 pf2YTnDE72w3DCfleCqHHvNvq9Y/KMSMxj3faDeplSSQe4VSuE7XXe4+Dk32hCwm5AWA
 xcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DC28dFYcSft5p2AD+ioacbUl+T18JigloB9JBv30KfU=;
 b=Yq6duoECx4VFLAwHD31N2iWy0dZaZcKHLSfjZtrc7a+mDwKCIkitHeLzp5wDFPyjYM
 5yeJurwo+CGPR8TouGmT1udIJ4dCm4NvrgXehgeLm+kpMsySHa8VBQejgTTIg6akmwin
 O7aX3dUJxlc6ylYf8f372FrWhejZD2eFPkTXpdJlbRBL8kPKhUSvnupWyVO9qDOz+bn4
 ogtHCjI12Gp1el0MDkge3/t6y81nuUlKTtFGygZC1H/dxirN8yWnSn+jQcJEjNZIreLQ
 eU5tdV9ATvb4hcPHvTcbyfbG5XfxvtOAMt8u17JY88fjOCMJVrGgpNWq+PW0m+vhru+x
 0/GA==
X-Gm-Message-State: AOAM530vkBF5K+3s+ofDtjIvSyMf5X5ke/XUu/lvsJbgwL/wpOgnpyUI
 NsemJxtfQbsS4SYHS43x76L/2fU6mRs=
X-Google-Smtp-Source: ABdhPJxFIItSTFitvaFwFvvGrK1iccDV5uAH6TKsZU/okKnStM7DDKdBLqd5/L8vtd+AkhFpQC0+uw==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr56903326wri.704.1641656572103; 
 Sat, 08 Jan 2022 07:42:52 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id w18sm1888219wrs.26.2022.01.08.07.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 07:42:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 16:41:18 +0100
Message-Id: <20220108154118.2320814-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/trinity: fix build with libexecinfo
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

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: debug.o: in function `__show_backtrace':
debug.c:(.text+0x10): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/bf78e4be9b9d9ca7d32f922d72ea6cd39a78d3d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/trinity/trinity.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index befb8de826..4dca50c0b6 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -11,16 +11,24 @@ TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
 TRINITY_CPE_ID_VENDOR = trinity_project
 
+TRINITY_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+TRINITY_DEPENDENCIES += libexecinfo
+TRINITY_LDFLAGS += -lexecinfo
+endif
+
 define TRINITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
 endef
 
 define TRINITY_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) LDFLAGS="$(TRINITY_LDFLAGS)"
 endef
 
 define TRINITY_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		LDFLAGS="$(TRINITY_LDFLAGS)" DESTDIR=$(TARGET_DIR)/usr install
 endef
 
 # Install helper scripts
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
