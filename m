Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8041F606A322
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L+a7k0pJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C8D240A62;
	Wed, 28 Oct 2026 21:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysxgyn4WqOEz; Wed, 28 Oct 2026 21:41:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9A93040A3F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223668;
	b=ShIAN4GYdD0sPMpaK3SHvuhwh+TY3yY2bRBOXv+I88skItML5qo/2XRngrW45GI9KHUF
	 Xz9G3Va8m95CtOfPH0cfPHYMoXPxz44wDfk5OcXIbEqNx4eRXy/Ng7VVe84PFqUUDK5Ec
	 FUGCQdc0jZFwb7RgrtRYmS5VXYjSF71CKlwHCETVMvOtP5xwTjVCMYpGS2eVOhoGIh/0V
	 kwh5+q1ZwAbbJtAP1LHHUelkprSvQeIBh3XlbX0KpUnAByAUEWMVM5nojZJ/NKuBeShlU
	 uhQkjxgWDqlAwy3QfHb4FNMPSzDbyVdw106RZfUQsapsZA4S8p8HQEGJ4GRIadq2YrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223668;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vLkwg1Hjlz6DhfpQd+tJlci4WP9m1bSAAE45dehgRYQ=;
	b=hzixSmtE+ipwjSM2GGWtCXDM0eRy5ICvOhM4131/j21K2fSJaBqmww4L485iDeNuElAo
	 v3H7D/018TpG+0fNbjKnPloL/+t3c/+OHvH9HNhguGYgh+3il80QHGZZBjKN0x83p909o
	 SaYxNZr8Njvs2j7a6DxPkqbm5MSUdnXRLj++g0NbJeIZg5IDa0fBVXeSVNMV+WX0JyXhg
	 S+IcnNBxWS8kAy1dG6k/R72w0vYwHKOGHfGHb05WU0iWawpDc86JhEudnl1lyhRHaoiwW
	 TVW509Jb4Nt9QDQblLXlXqoHAbrAQcC0C25G9CVSO7aHsgImOY2zdd4A8Z77OdCyWqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223668;
	bh=vLkwg1Hjlz6DhfpQd+tJlci4WP9m1bSAAE45dehgRYQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=L+a7k0pJtqnNHXyyUSQ8fwWu9iwZeuKq2SsP9/6kqw0prziQvNplDxxMgRSjKapKc
	 AmOP2oVHB4ICEzfIYqsC1aXyfmXGZe87xAgZn9T0Nm/6zPntGy9bGx4mSamP2iy+Vq
	 7B7OCc9JWC0i9MZyO8cjku18Yz2MVVGFptPoZnuqqjJjZXyd6VnCW4EDbfOOwX44Hz
	 MsdU6Ix0hIHyE4VyxrOJGe3lwFe8BXkqoELWBqxnUVVfS/35WwuDg0U+zpu6O/fdS7
	 6NL/DQpE3gzUap2CvEFeVIrKTc+S60NhRiqxH2PNfHzbid/yjdm/wgCM4AfeqHOTdD
	 IFcLRszc20ICQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A93040A3F;
	Wed, 28 Oct 2026 21:41:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B8AE356
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04A6C81773
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kb704cCFkIQX for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:41:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B8C9B8176D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223665;
 b=Znh52qp9X4tAm2kX8hNnu2/uRYQWwQ5dHTAJIzRn3yVvGv6OcDwsTeD4OqzX09U/wKj/
 OT/ifSBfWHQdGDbmDG6GLPDiXLQaDLwnq5Uwp03oQ2Ie/SgzjF8eG2Y0QqIioXdDka27l
 MA4CPfM/mHs70isCFRbZuxB4vAQQe2PEUOxgDnZszWKBV+iDXKJJrtihvis3lxrfx4SE6
 B5SRZfNin2HfBEzlI+v58I9Ii6mFsy2ZZgoCfRsZHcf2fL2NytEZ6Df1y+HIGdov09NP2
 9OLlqCezvKQBditQoGECcjOqUnLfz8LW8J0FAnGG+zv7NAR0d2pvBXYtuACmB8BKk4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223665;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=FS+eu+C9cYJLYqL06AyKc6YToxfUyYzlT/hHTDCBOpc=;
 b=JWuNGc89vTu3Se2kxZaXxWnmgcyPEqF2LJk1u/FC+iJZeSubSpesDnnHDHyADILpQ4VT
 uI0VQMpIn6TfrVGuXqK25MOHSy+SQryvqoAIcLk4Wym4rcP/Pd+wgKztnJQ//F3VwcYMh
 duN/FdpKrSki2O2DkLg+6iwzH/Q3fOpzX+Og3lbBR2KpHEhYLIAE0od4Gg4UfqJRqvifY
 zIlkNbUh9K0St63oBJKOSTgUf6/kvE1MBultKmaJduCdAvqLwHZJFWaNJsPxits/lomh8
 6FYrA/EIDd6CzXMYLJsJ1mrFwYpE6meQKY64Eg+F1fqDIF+TwHlUs62CEgHGLnu+tvw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=dwG1iKk5; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::563"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::563; helo=mail-pg1-x563.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x563.google.com (mail-pg1-x563.google.com
 [IPv6:2607:f8b0:4864:20::563])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8C9B8176D
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:05 +0000 (UTC)
Received: by mail-pg1-x563.google.com with SMTP id
 41be03b00d2f7-cdadf7e248aso589328a12.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223664; x=1793828464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FS+eu+C9cYJLYqL06AyKc6YToxfUyYzlT/hHTDCBOpc=;
 b=WrLycL5K1E/XowRwem2MBdkfFBK/gz+HvnzQsbk+Afu8wdCJYkIUIti0lEi3yznzit
 /9wQ4/AWbetXjLfHasctI5rwyLb5wYfJGlN6INRG28F/f+v6szzi3fz7TuvGtZyjK+y5
 VSRHBofPVqhUDoUmP2BbydpkdUx9MdIkG1l6edjxO5M4D83SDuIePtS9yFZhDFV1IHsH
 jC2Ltag3gm6/DKs4hXn7S6/j4hmzng26jfeZr/ZaFUjYT3p4pxWHu1LjuHDNMKJNiDfq
 vFiyId51/BxZApkWCIFA7byrc4dssXQh2ygstYWTfHlgadEnUGq2871wwKG2VLEc5Aid
 zLvA==
X-Gm-Message-State: AFq9FYI8sUye2SWWprBV5gA1ExdPSugy4co+euAuWJQ2tV+m3slxJ7Br
 +rCCxBz2TFhkwIThSj6AicG1NYzFesJjOaLK23JcSvzsJI2IY0GzPMdNJyPLK53zrv2MyWQen3s
 T12z1LOuCJHY8s71okbsQXBh8XX7PAffNv/OQzgLUs+yj7LSQlN/0sKBAs+MwfEBR/fJlw5ryB7
 IwWtLdkWD2YFBcymZCRkj83ofH/Q3tVaw4akSTfmrxHPilpIHykV/kt7yfsU+D+7awV8SeLnYVu
 h+rV6knHQ8we7RgXQ==
X-Gm-Gg: AYBFou3JCg0FLzMWZVfchgSMmvo4DSNtJZaU/P7fiHgDPI6WguCUiCfTtl58c51BZWd
 cUki+nDtEZYoIAY4O5mtBreZcvGOgJyigPmXbzEZlMXQUDOHy7w80MaiUTVgCw0qyFUJ3TYzczL
 ovspjDIZLkw+6cgPiy3pTeGh2lbbgG2xx8VTroYD6nvAkNDZkJFaYBlUAgEf7oUiHMFKsdF0H3F
 +ui44cMG3K4237kk09Wnr2M5jrATpQ7RZZIcFIw+AGHZ39DOjp0/HJNdgM+u1WycVou3wiAZxZr
 yj9b9bVuggXxQeHtuUKzXAwdbt00sqDNgQejfxiH4jLpJ6kZZBjHcf48jCS/ByTboIqmUJ6sVT3
 t8D+aFZsSZkxOaLa2iTPhZsDKAcLfta6ayHH4lSwUSXXEz7keEmVEEP5sITFF4o892LrGI3hSvE
 f3VZEiIxjhXB6WHps5gqJEKfnaoxSrMnNIgFy/L7xE
X-Received: by 2002:a17:90b:1c01:b0:3aa:f4af:1e0b with SMTP id
 98e67ed59e1d1-3ae57e2af4emr2634297a91.8.1793223664356; 
 Wed, 28 Oct 2026 14:41:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae6e6ec859sm575946a91.2.2026.10.28.14.41.03
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:41:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5338ff2cf14so30102311cf.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:41:03 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:533:2ef6:d98a with SMTP id
 d75a77b69052e-53fcb6fff23mr61292121cf.29.1793223662820; 
 Wed, 28 Oct 2026 14:41:02 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:533:2ef6:d98a with SMTP id
 d75a77b69052e-53fcb6fff23mr61291541cf.29.1793223661935; 
 Wed, 28 Oct 2026 14:41:01 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-538394c518csm114745971cf.8.2026.10.28.14.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:41:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:42 -0700
Message-Id: <20261028213744.511429-22-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 21/23] package/linux-tools: support an
 out-of-tree kernel build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The kernel build directory no longer contains the kernel sources, so:

 - check which tools the kernel provides against $(LINUX_SRCDIR)/tools
   rather than $(LINUX_DIR)/tools;
 - build the tools, which build in-tree, in a shadow of the kernel
   sources so that the original sources are not modified. When the kernel
   is built in-tree, nothing changes.

Also: stop python from writing bytecode next to the real perf scripts,
and make the selftests find the headers installed in the kernel build
directory, which fixes a cold-build failure. The host-built net ynl
selftests are excluded from the target architecture check.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/linux-tools/linux-tool-cpupower.mk.in |  8 +++---
 package/linux-tools/linux-tool-gpio.mk.in     |  6 ++---
 package/linux-tools/linux-tool-hv.mk.in       |  6 ++---
 package/linux-tools/linux-tool-iio.mk.in      |  6 ++---
 package/linux-tools/linux-tool-mm.mk.in       | 10 +++----
 package/linux-tools/linux-tool-pci.mk.in      | 12 +++++----
 package/linux-tools/linux-tool-perf.mk.in     | 27 +++++++++++--------
 package/linux-tools/linux-tool-rtla.mk.in     | 10 +++----
 .../linux-tools/linux-tool-selftests.mk.in    | 15 ++++++-----
 package/linux-tools/linux-tool-tmon.mk.in     |  8 +++---
 package/linux-tools/linux-tool-usbtools.mk.in |  6 ++---
 package/linux-tools/linux-tools.mk            | 20 +++++++++++++-
 12 files changed, 81 insertions(+), 53 deletions(-)

diff --git a/package/linux-tools/linux-tool-cpupower.mk.in b/package/linux-tools/linux-tool-cpupower.mk.in
index 2a2d3e01dd5a..aca57ff02bcb 100644
--- a/package/linux-tools/linux-tool-cpupower.mk.in
+++ b/package/linux-tools/linux-tool-cpupower.mk.in
@@ -15,26 +15,26 @@ CPUPOWER_MAKE_OPTS = CROSS=$(TARGET_CROSS) \
 	DEBUG=false
 
 define CPUPOWER_BUILD_CMDS
-	$(Q)if test ! -f $(LINUX_DIR)/tools/power/cpupower/Makefile ; then \
+	$(Q)if test ! -f $(LINUX_TOOLS_KSRC)/power/cpupower/Makefile ; then \
 		echo "Your kernel version is too old and does not have the cpupower tool." ; \
 		echo "At least kernel 3.4 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		cpupower
 endef
 
 define CPUPOWER_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		DESTDIR=$(STAGING_DIR) \
 		cpupower_install
 endef
 
 define CPUPOWER_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		cpupower_install
diff --git a/package/linux-tools/linux-tool-gpio.mk.in b/package/linux-tools/linux-tool-gpio.mk.in
index e825db1b1127..32e3343fc1aa 100644
--- a/package/linux-tools/linux-tool-gpio.mk.in
+++ b/package/linux-tools/linux-tool-gpio.mk.in
@@ -9,19 +9,19 @@ LINUX_TOOLS += gpio
 GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define GPIO_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if ! grep install $(LINUX_TOOLS_KSRC)/gpio/Makefile >/dev/null 2>&1 ; then \
 		echo "Your kernel version is too old and does not have the gpio tools." ; \
 		echo "At least kernel 4.8 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(GPIO_MAKE_OPTS) \
 		gpio
 endef
 
 define GPIO_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(GPIO_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		gpio_install
diff --git a/package/linux-tools/linux-tool-hv.mk.in b/package/linux-tools/linux-tool-hv.mk.in
index e638fecfc63e..73c20e3ed542 100644
--- a/package/linux-tools/linux-tool-hv.mk.in
+++ b/package/linux-tools/linux-tool-hv.mk.in
@@ -20,13 +20,13 @@ HV_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(filter-out -g%,$(TARGET_CFLAGS))"
 
 define HV_BUILD_CMDS
 	$(Q)for prog in $(HV_PROGS_y); do \
-		if test ! -f $(LINUX_DIR)/tools/hv/$${prog}.c ; then \
+		if test ! -f $(LINUX_TOOLS_KSRC)/hv/$${prog}.c ; then \
 			printf "Your kernel version is too old and does not have the HyperV %s tool." "$${prog}" ; \
 			exit 1 ; \
 		fi; \
 	done
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/hv \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools/hv \
 		$(HV_MAKE_OPTS) \
 		$(HV_PROGS_y)
 endef
@@ -40,7 +40,7 @@ endif
 
 define HV_INSTALL_TARGET_CMDS
 	$(foreach prog,$(HV_PROGS_y), \
-		$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/$(prog) \
+		$(INSTALL) -m 0755 -D $(LINUX_TOOLS_KDIR)/tools/hv/$(prog) \
 			$(TARGET_DIR)/usr/sbin/$(HV_$(prog))
 	)
 	$(HV_KVP_HELPER)
diff --git a/package/linux-tools/linux-tool-iio.mk.in b/package/linux-tools/linux-tool-iio.mk.in
index 27ab0ed7ed63..b975a548e473 100644
--- a/package/linux-tools/linux-tool-iio.mk.in
+++ b/package/linux-tools/linux-tool-iio.mk.in
@@ -9,19 +9,19 @@ LINUX_TOOLS += iio
 IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define IIO_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/iio/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if ! grep install $(LINUX_TOOLS_KSRC)/iio/Makefile >/dev/null 2>&1 ; then \
 		echo "Your kernel version is too old and does not have install section in the iio tools." ; \
 		echo "At least kernel 4.7 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/iio \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools/iio \
 		$(IIO_MAKE_OPTS)
 endef
 
 # DESTDIR used since kernel version 4.14
 define IIO_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/iio \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools/iio \
 		$(IIO_MAKE_OPTS) \
 		INSTALL_ROOT=$(TARGET_DIR) \
 		DESTDIR=$(TARGET_DIR) \
diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
index b2ec090fc086..703d3681ae43 100644
--- a/package/linux-tools/linux-tool-mm.mk.in
+++ b/package/linux-tools/linux-tool-mm.mk.in
@@ -7,16 +7,16 @@
 LINUX_TOOLS += mm
 
 define MM_BUILD_CMDS
-	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
+	$(Q)if test -f $(LINUX_TOOLS_KSRC)/vm/Makefile ; then \
 		MM_SUBDIR=vm; \
-	elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
+	elif test -f $(LINUX_TOOLS_KSRC)/mm/Makefile ; then \
 		MM_SUBDIR=mm; \
 	else \
 		echo "Your kernel version is too old and does not have the mm tool." ; \
 		echo "At least kernel 3.4 must be used." ; \
 		exit 1 ; \
 	fi ; \
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(MM_MAKE_OPTS) $${MM_SUBDIR}
 endef
 
@@ -24,12 +24,12 @@ endef
 # exists, because that was checked at build time already; we just
 # need to find which of the two: if not one, then the other.
 define MM_INSTALL_TARGET_CMDS
-	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
+	$(Q)if test -f $(LINUX_TOOLS_KSRC)/vm/Makefile ; then \
 		MM_SUBDIR=vm; \
 	else \
 		MM_SUBDIR=mm; \
 	fi ; \
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(LINUX_MAKE_FLAGS) \
 		INSTALL_ROOT=$(TARGET_DIR) \
 		DESTDIR=$(TARGET_DIR) \
diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
index 52d7639bb102..a6f6ef265643 100644
--- a/package/linux-tools/linux-tool-pci.mk.in
+++ b/package/linux-tools/linux-tool-pci.mk.in
@@ -7,11 +7,13 @@
 LINUX_TOOLS += pci
 
 # Linux 6.14 moved the PCI endpoint tests into Kselftests.
-PCI_SRCDIR = $(strip $(if $(wildcard $(LINUX_DIR)/tools/testing/selftests/pci_endpoint/Makefile),\
-	$(LINUX_DIR)/tools/testing/selftests/pci_endpoint,$(LINUX_DIR)/tools/pci))
+PCI_SUBDIR = $(strip $(if $(wildcard $(LINUX_TOOLS_KSRC)/testing/selftests/pci_endpoint/Makefile),\
+	testing/selftests/pci_endpoint,pci))
+PCI_SRCDIR = $(LINUX_TOOLS_KSRC)/$(PCI_SUBDIR)
+PCI_BUILDDIR = $(LINUX_TOOLS_KDIR)/tools/$(PCI_SUBDIR)
 
 PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
-	OUTPUT=$(PCI_SRCDIR)/ \
+	OUTPUT=$(PCI_BUILDDIR)/ \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LDLIBS="-lrt -lm"
 
@@ -22,12 +24,12 @@ define PCI_BUILD_CMDS
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_SRCDIR) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_BUILDDIR) \
 		$(PCI_MAKE_OPTS)
 endef
 
 define PCI_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_SRCDIR) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(PCI_BUILDDIR) \
 		$(PCI_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		INSTALL_PATH=$(TARGET_DIR)/usr/lib/kselftests/pci_endpoint \
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 3271fd5683eb..348eb1a4240f 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -18,6 +18,11 @@ else
 PERF_ARCH=$(NORMALIZED_ARCH)
 endif
 
+# The python scripts run by the perf build are run through symlinks when
+# building out of tree: do not let python write its bytecode next to the
+# real script, in the kernel sources.
+PERF_MAKE_ENV = PYTHONDONTWRITEBYTECODE=1
+
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
 	JOBS=$(PARALLEL_JOBS) \
@@ -147,25 +152,25 @@ endif
 # For a POST_PATCH hook, tools/perf/Documentation/Makefile is not
 # guaranteed to exist yet.
 define PERF_DISABLE_DOCUMENTATION
-	if [ -f $(LINUX_DIR)/tools/perf/Documentation/Makefile ]; then \
-		printf "%%:\n\t@:\n" >$(LINUX_DIR)/tools/perf/Documentation/GNUmakefile; \
+	if [ -f $(LINUX_TOOLS_KDIR)/tools/perf/Documentation/Makefile ]; then \
+		printf "%%:\n\t@:\n" >$(LINUX_TOOLS_KDIR)/tools/perf/Documentation/GNUmakefile; \
 	fi
 endef
 LINUX_TOOLS_PRE_CONFIGURE_HOOKS += PERF_DISABLE_DOCUMENTATION
 
 # O must be redefined here to overwrite the one used by Buildroot for
-# out of tree build. We build perf in $(LINUX_DIR)/tools/perf/ and not just
+# out of tree build. We build perf in $(LINUX_TOOLS_KDIR)/tools/perf/ and not just
 # $(LINUX_DIR) so that it isn't built in the root directory of the kernel
 # sources.
 define PERF_BUILD_CMDS
-	$(Q)if test ! -f $(LINUX_DIR)/tools/perf/Makefile ; then \
+	$(Q)if test ! -f $(LINUX_TOOLS_KSRC)/perf/Makefile ; then \
 		echo "Your kernel version is too old and does not have the perf tool." ; \
 		echo "At least kernel 2.6.31 must be used." ; \
 		exit 1 ; \
 	fi
 	$(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
-		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile* ; then \
-			if ! test -r $(LINUX_DIR)/tools/perf/config/Makefile ; then \
+		if ! grep -q NO_LIBELF $(LINUX_TOOLS_KSRC)/perf/Makefile* ; then \
+			if ! test -r $(LINUX_TOOLS_KSRC)/perf/config/Makefile ; then \
 				echo "The perf tool in your kernel cannot be built without libelf." ; \
 				echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
 				exit 1 ; \
@@ -173,14 +178,14 @@ define PERF_BUILD_CMDS
 		fi \
 	fi
 	$(Q)if test "$(BR2_PACKAGE_LINUX_TOOLS_PERF_TUI)" = "y" ; then \
-		if ! grep -q NO_SLANG $(LINUX_DIR)/tools/perf/Makefile* ; then \
+		if ! grep -q NO_SLANG $(LINUX_TOOLS_KSRC)/perf/Makefile* ; then \
 			echo "The perf tool in your kernel cannot be build with the TUI." ; \
 			echo "Either upgrade your kernel to >= 3.10, or disable the TUI." ; \
 			exit 1 ; \
 		fi \
 	fi
-	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
-		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/
+	$(TARGET_MAKE_ENV) $(PERF_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
+		-C $(LINUX_TOOLS_KDIR)/tools/perf O=$(LINUX_TOOLS_KDIR)/tools/perf/
 endef
 
 # After installation, we remove the Perl and Python scripts from the
@@ -196,8 +201,8 @@ LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
 endif
 
 define PERF_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
-		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/ install
+	$(TARGET_MAKE_ENV) $(PERF_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
+		-C $(LINUX_TOOLS_KDIR)/tools/perf O=$(LINUX_TOOLS_KDIR)/tools/perf/ install
 	$(PERF_INSTALL_REMOVE_SCRIPTS)
 endef
 
diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
index d9bdcc3016e7..aef4343010c8 100644
--- a/package/linux-tools/linux-tool-rtla.mk.in
+++ b/package/linux-tools/linux-tool-rtla.mk.in
@@ -16,7 +16,7 @@ RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 define RTLA_DISABLE_STACK_PROTECTOR
-	$(SED) 's/-fstack-protector.* //' $(LINUX_DIR)/tools/tracing/rtla/Makefile
+	$(SED) 's/-fstack-protector.* //' $(LINUX_TOOLS_KDIR)/tools/tracing/rtla/Makefile
 endef
 endif
 
@@ -27,14 +27,14 @@ define RTLA_LINUX_CONFIG_FIXUPS
 endef
 
 define RTLA_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if ! grep install $(LINUX_TOOLS_KSRC)/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
 		echo "Your kernel version is too old and does not implement the rtla tool." ; \
 		echo "At least kernel 5.19 must be used." ; \
 		exit 1 ; \
 	fi
 	$(RTLA_DISABLE_STACK_PROTECTOR)
 	$(TARGET_MAKE_ENV) $(MAKE) $(RTLA_MAKE_OPTS) \
-		-C $(LINUX_DIR)/tools/tracing rtla
+		-C $(LINUX_TOOLS_KDIR)/tools/tracing rtla
 endef
 
 # make rtla_install build and install by default documentation using rst2man
@@ -42,12 +42,12 @@ endef
 # folder so let's simply install the resulting rtla binary and create symlinks
 # like Linux does in its tools/tracing/rtla/Makefile
 define RTLA_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/tracing/rtla/rtla $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(LINUX_TOOLS_KDIR)/tools/tracing/rtla/rtla $(TARGET_DIR)/usr/bin
 	ln -sf rtla $(TARGET_DIR)/usr/bin/osnoise
 	ln -sf rtla $(TARGET_DIR)/usr/bin/timerlat
 
 	# Check if hwnoise is provided or not
-	if grep -q hwnoise $(LINUX_DIR)/tools/tracing/rtla/Makefile; then \
+	if grep -q hwnoise $(LINUX_TOOLS_KSRC)/tracing/rtla/Makefile; then \
 		ln -sf rtla $(TARGET_DIR)/usr/bin/hwnoise ; \
 	fi
 endef
diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index 032a71e32000..4f25c4a922c1 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -27,11 +27,14 @@ SELFTESTS_MAKE_FLAGS = \
 	KHDR_DIR=$(LINUX_DIR)/usr/include \
 	KHDR_INCLUDES="-isystem $(LINUX_DIR)/usr/include"
 
+# The ynl library of the net selftests is built with the host compiler
 LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
-	/usr/lib/kselftests/tc-testing/
+	/usr/lib/kselftests/tc-testing/ \
+	/usr/lib/kselftests/net/lib/ynl/ \
+	/usr/lib/kselftests/drivers/net/
 
 # O must be redefined here to overwrite the one used by Buildroot for
-# out of tree build. We build the selftests in $(LINUX_DIR)/tools/selftests and
+# out of tree build. We build the selftests in $(LINUX_TOOLS_KDIR)/tools/selftests and
 # not just $(LINUX_DIR) so that it isn't built in the root directory of the kernel
 # sources.
 #
@@ -43,12 +46,12 @@ LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
 define SELFTESTS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR) $(SELFTESTS_MAKE_FLAGS) \
 		headers_install
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/testing/selftests \
-		$(SELFTESTS_MAKE_FLAGS) O=$(LINUX_DIR)/tools/testing/selftests
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_TOOLS_KDIR)/tools/testing/selftests \
+		$(SELFTESTS_MAKE_FLAGS) O=$(LINUX_TOOLS_KDIR)/tools/testing/selftests
 endef
 
 define SELFTESTS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/testing/selftests \
-		$(SELFTESTS_MAKE_FLAGS) O=$(LINUX_DIR)/tools/testing/selftests \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_TOOLS_KDIR)/tools/testing/selftests \
+		$(SELFTESTS_MAKE_FLAGS) O=$(LINUX_TOOLS_KDIR)/tools/testing/selftests \
 		INSTALL_PATH=$(TARGET_DIR)/usr/lib/kselftests install
 endef
diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
index 56c328c51fd7..cb071f5fee12 100644
--- a/package/linux-tools/linux-tool-tmon.mk.in
+++ b/package/linux-tools/linux-tool-tmon.mk.in
@@ -14,24 +14,24 @@ TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 define TMON_DISABLE_STACK_PROTECTOR
-	$(SED) 's%-fstack-protector%%' $(LINUX_DIR)/tools/thermal/tmon/Makefile
+	$(SED) 's%-fstack-protector%%' $(LINUX_TOOLS_KDIR)/tools/thermal/tmon/Makefile
 endef
 endif
 
 define TMON_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/thermal/tmon/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if ! grep install $(LINUX_TOOLS_KSRC)/thermal/tmon/Makefile >/dev/null 2>&1 ; then \
 		echo "Your kernel version is too old and does not have the tmon tool." ; \
 		echo "At least kernel 3.13 must be used." ; \
 		exit 1 ; \
 	fi
 	$(TMON_DISABLE_STACK_PROTECTOR)
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(TMON_MAKE_OPTS) \
 		tmon
 endef
 
 define TMON_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools \
 		$(TMON_MAKE_OPTS) \
 		INSTALL_ROOT=$(TARGET_DIR) \
 		tmon_install
diff --git a/package/linux-tools/linux-tool-usbtools.mk.in b/package/linux-tools/linux-tool-usbtools.mk.in
index 797758adce51..6e72fe6de79a 100644
--- a/package/linux-tools/linux-tool-usbtools.mk.in
+++ b/package/linux-tools/linux-tool-usbtools.mk.in
@@ -13,20 +13,20 @@ LINUX_TOOLS_USBTOOLS_LIST = \
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_FFSTEST),ffs-test)
 
 define USBTOOLS_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/usb/Makefile >/dev/null 2>&1 ; then \
+	$(Q)if ! grep install $(LINUX_TOOLS_KSRC)/usb/Makefile >/dev/null 2>&1 ; then \
 		echo "Your kernel version is too old to build the USB tools." ; \
 		echo "At least kernel 5.9 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools/usb \
 		ALL_TARGETS="$(LINUX_TOOLS_USBTOOLS_LIST)" \
 		$(USBTOOLS_MAKE_OPTS) \
 		all
 endef
 
 define USBTOOLS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_TOOLS_KDIR)/tools/usb \
 		ALL_TARGETS="$(LINUX_TOOLS_USBTOOLS_LIST)" \
 		$(USBTOOLS_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 49e73a9ca4ec..c1b13af0dd4c 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -8,7 +8,25 @@
 # Instead, we directly build in the sources of the linux package. We can do
 # that, because we're not building in the same location and the same files.
 #
-# So, all tools refer to $(LINUX_DIR) instead of $(@D).
+# So, all tools refer to $(LINUX_TOOLS_KDIR) to build, instead of $(@D).
+#
+# Which tools can be built, though, is checked against the kernel sources
+# in $(LINUX_SRCDIR), which is not $(LINUX_DIR), the kernel build directory,
+# when the kernel is built out of tree.
+#
+# The tools build in-tree, and we do not want to pollute the kernel sources
+# of an out-of-tree build. So in that case, we build in a shadow of the
+# kernel sources, which is a tree of real directories with symlinks to the
+# files.
+LINUX_TOOLS_KSRC = $(LINUX_SRCDIR)/tools
+LINUX_TOOLS_KDIR = $(if $(LINUX_OUT_OF_TREE),$(LINUX_TOOLS_BUILDDIR)/linux,$(LINUX_DIR))
+
+define LINUX_TOOLS_SHADOW_SOURCES
+	$(if $(LINUX_OUT_OF_TREE),\
+		support/scripts/symlink-tree -f tools $(LINUX_SRCDIR) $(LINUX_TOOLS_KDIR))
+endef
+# Must come first, before the hooks that tweak the kernel sources
+LINUX_TOOLS_PRE_CONFIGURE_HOOKS += LINUX_TOOLS_SHADOW_SOURCES
 
 # Note: we need individual tools makefiles to be included *before* we build
 # the list of build and install hooks below to guarantee that each tool has
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
