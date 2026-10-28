Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D71606A31E
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AdlI5RBr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CDF240A60;
	Wed, 28 Oct 2026 21:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBgpcfFPrp24; Wed, 28 Oct 2026 21:41:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0557A40A49
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223673;
	b=rpY/qwJX3VmUQZ79ij/UnJvohPeLvvlSbNp9Tw1cQYvBzYl06flh8wUrx9KuTLp0eaQl
	 wjGYsLF4eOjhxbu7Dxkl+phCdjhUKqh0adQhB80wR+X1TeBceB6ZyetXswWYMsSFRawGi
	 jf3mBV1g+8ec5tgjE1rluCMr49PEpRN40vH0JeSIr1FviKA4Q8NZz8FQYnx+0llGlfVxU
	 ffsxoXTuk14nf56Uz3+fcfXiqjTA2wrFWSF5+iQk+iswtIwoCWI8kCNNMhqvYQ59fMUdV
	 16oCG0fqmgq7ZQFgyRVDEm5A9gZImRDFwT3/+1ONWsFmVK12tt27Tl7iVCFLK4dTrtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223673;
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
	bh=/LTW8vZtrFZcyGcuj4IFN6Mz5GqEfHP8qgwpq0012k0=;
	b=WJs/U+12y5h0kXiu2DEIOMU4DeqXkYpkHxE+lmHl4z5Ydb6mjQMXv04Krt7mmYvUh923
	 famtFaK9+PoFeAQFBiIAXtChZS4p49H4VXLDUW6X6qfa4FOIje74eTlTtIMq+Y2vo8WH7
	 21B/lNf70znwYMY40zvnawA6UwbdAWV493iQSdA5GnMm6uRWaX/4RkIkTZ3166LmALUMB
	 VVkdtwg8GHru5wYarVz9VwRs/Cq8NuxccfNtyFzUJPQkIyQorktVum/4MzBXfopcPHswH
	 mw3CfsV0fwl/mk47xU0BNFDAxGg3XtT/X896F0kUKGGtAVrLqhIQwrAWVpcNdEW7/Bg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223673;
	bh=/LTW8vZtrFZcyGcuj4IFN6Mz5GqEfHP8qgwpq0012k0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=AdlI5RBrZK+LUSyzE9wGikSNGtKjfIouBaqyEpZintijWI2vdOHf9YVlaYV9RJD5e
	 WqmgsfFvGOnUnK6YmKOS0shL/dXsa+66kn+AXs4omV64wE7U0MvmjUY2iGi0JUW5M+
	 +87ZrHZa813zZ7btMJvO/2KEdVCaWeRy5FF4ZEBekFT8O2iCwQJ9j/sovn0XvoYiEC
	 PNPsIn3upAXkjhDS73+4yYHQUzXlcl5Nio+kdxWvhAiTyyWdZhb0O3e/qOTq2Q9U1E
	 yYmOUgO5ZTHJs1aE4tP3nxngmANILE0EWq4uLWPRXjFzwDeimGHpfpXnKGsamvxSQd
	 krXmCQ6pzQvWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0557A40A49;
	Wed, 28 Oct 2026 21:41:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E7D7356
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 059E740A46
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osxAtJjnUk7F for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:41:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2083940A3E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223670;
 b=tARFdeyh2wUN9UgHgfRVmz7ZUpf14uhOsixktnYjPzASlRK4Qt8xXYZI4HcwSgTIvYEj
 OE6UqwipIjtTmz3Q2QJ2NIB+gKpj+bLlTlQYf+apUaRn2CZNe2o1orEeNXGSZ6uuQ4VCw
 f2KFTtEL3QC3k3VLH6CnOhr9j1ALkZkmJBM5YzxkwfFoyrCTrEfyZ9LmlGVYbRJI0S5lT
 P5BGjCwNvVV6lJfC/K8oMjhTcQJ+YcBVUUe+sm51swyCSVb8RgihU406ngt69vJtAiSrB
 oK25/FkWn/CTWv9wWi+XkkFO6N3dD5nokiYMxjqGNSDFiickWSJX+73J/LkONPzm2UA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223670;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=kmjtxdjKfwF54M6MSbnc22tZa1nS0feubx4bpTX/IRs=;
 b=K5pLp3otSuisVmsGNXiDweVbo8U9B5MBr4ZTOvbWnjFKqzC7HcGL2MfTW4Su3iDU3w6c
 ZMuS/suy+xLkdeRuW/9FVVDlhO7X+1WERHrLSEJzoGK44COyJAd4xsTkCc+aYCoFzaL93
 ZcGa71/bCmaSECIRvEwHA0CdgLdFAga0cYQT5OS//bjn0+zE6shjXbpib7cCVY/S2VATA
 fQln3CTKELei+VtlgYyHHV27bEmQaWYuP3j+MBGX06xXpLyjDQ0h54ncCWRNP4g/+rFhG
 ZgwKo+9kXqfb2i+CTnAoWOcPK25y3oSScdGrhCMRakpGxIB6Cru2syN7cBr0h1Tz9Yw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=XjQQG5iL; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::661"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::661; helo=mail-pl1-x661.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pl1-x661.google.com (mail-pl1-x661.google.com
 [IPv6:2607:f8b0:4864:20::661])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2083940A3E
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:41:09 +0000 (UTC)
Received: by mail-pl1-x661.google.com with SMTP id
 d9443c01a7336-2e9eb579c0eso8908345ad.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223669; x=1793828469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kmjtxdjKfwF54M6MSbnc22tZa1nS0feubx4bpTX/IRs=;
 b=zYMbr0x1GRla3IgfrGuHyQ2fwt0OLMDfydaQp1ddZIypPKpsowTd7QzbCYQsiroWjN
 eMuNs9N/nAJIv78MnspTPVTbP63bSwUldSShtzYtLvZb84m3edccuoq/PTrCI2Ypd/4u
 MY5NLNJE+BUBOoFnNHeHBbM5M9+QVJETKGIgrYXqWvP1g+E75oikeNO+DTC3ugL/YalV
 SNeo9uZeGv3ZXOEzDEbBDiURyFHXYBx7DsFpieL4/r6VbQFcSivg1nP6R67gQSGisUF2
 RYP9AiHQ3Zs9PrU3y/7dW+lfxhIVXgo3piSbQuT2VKaC6Zn3L4zTqNYAQ5+KeSIN1/9m
 GBBw==
X-Gm-Message-State: AFq9FYKuCCmivG6d2iQFJnAAcg6xhWQTV7mdZy6YUoEysrEsMJc8XpN1
 g/OP/gVVbyEpXNtV3hOUfUyBET//hqqlf/3cDB5qGXQ1grb2Iu/uvAp4ddBIrWxEhqqBxb/NpkG
 pZs+UaLYhl+8+ssJiFJ1JwWYipA5zl+u1JEGXyY+cloU9Mm77LzS4r7HxSU//Y0r5lDyrgY8dpm
 6EkJ1DLKmpfvm+hRKlMF2uuw6kTq2tVIgF7MaaDpkaTyxeimOS9UWa6V9Nho4Nb0rv8+2Zr7JsB
 g0+QSGyUbRfj2hfNQ==
X-Gm-Gg: AYBFou0m0bo7kkL1cxcXgTVzXETWdpZRD0WNogDLnUyhfP4DWMkXiZ3IIuQsW3itmPK
 J55GCAtyLv3p8r6fS2qxdPGtsf5phKO1SZnBamszjqlq2JvjRJeQXaNpuQRJIgInTKeETJff2L5
 rhcgVsGcSMs5AwG77oucadFMbqr00PYfY6M5zeC9bDD1CShNtW7OnNbCYLTLcko0wHnzjmSVkrE
 SGjpfW28JEmY7uEJvguUUBRCFFZn9ASj/mE4qAeTTzznaK/EXuNI0ylTV5pdnOfgllcO1NmueF5
 Ah1ldVXalp3X0C6lEB++8Pz3e9UBeFxPSivTOZQyoCMR1Sltsbn1qz0NVUm9ejX5CW4+emk9KXZ
 UyD3AVeTB6jckLwRVrgWp/aWUtmmnD1m5m1qC+bnJjrl28QtVPRLG8tcH+sT0RWrKjOpwOKXiXc
 XqpC8CF+gs6N7ObGPA7GcOzhnHxThE/FKEQ55GznJb
X-Received: by 2002:a17:903:380b:b0:2e2:ffcb:87a9 with SMTP id
 d9443c01a7336-2eb00411b36mr28532565ad.24.1793223668420; 
 Wed, 28 Oct 2026 14:41:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-2eae6b4f298sm1465905ad.11.2026.10.28.14.41.07
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:41:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-534f3fe0236so27340531cf.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:41:06 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:537:c47b:f904 with SMTP id
 d75a77b69052e-53fcb7fa551mr65986861cf.29.1793223666102; 
 Wed, 28 Oct 2026 14:41:06 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:537:c47b:f904 with SMTP id
 d75a77b69052e-53fcb7fa551mr65986311cf.29.1793223665517; 
 Wed, 28 Oct 2026 14:41:05 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-538394c518csm114745971cf.8.2026.10.28.14.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:41:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:43 -0700
Message-Id: <20261028213744.511429-23-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 22/23] package: read kernel headers from
 LINUX_SRCDIR
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the kernel is built out of tree, LINUX_DIR is the build directory and
does not contain the source headers.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/a10disp/a10disp.mk                                     | 2 +-
 package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk     | 2 +-
 package/freescale-imx/imx-lib/imx-lib.mk                       | 2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk                        | 2 +-
 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
index c919202329c4..a7ba85fb5a42 100644
--- a/package/a10disp/a10disp.mk
+++ b/package/a10disp/a10disp.mk
@@ -12,7 +12,7 @@ A10DISP_LICENSE_FILES = a10disp.c
 A10DISP_DEPENDENCIES = linux
 
 define A10DISP_BUILD_CMDS
-	cp -f $(LINUX_DIR)/include/video/sunxi_disp_ioctl.h $(@D)/
+	cp -f $(LINUX_SRCDIR)/include/video/sunxi_disp_ioctl.h $(@D)/
 	$(TARGET_CC) $(TARGET_CFLAGS) $(@D)/a10disp.c -o $(@D)/a10disp
 endef
 
diff --git a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
index 912cc7c68bcb..e153738a5ef4 100644
--- a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
+++ b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
@@ -15,6 +15,6 @@ IMX_ALSA_PLUGINS_AUTORECONF = YES
 
 # needs access to imx-specific kernel headers
 IMX_ALSA_PLUGINS_DEPENDENCIES += linux
-IMX_ALSA_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(LINUX_DIR)/include/uapi"
+IMX_ALSA_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(LINUX_SRCDIR)/include/uapi"
 
 $(eval $(autotools-package))
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index f06453e8a6be..3048deb96053 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -15,7 +15,7 @@ IMX_LIB_INSTALL_STAGING = YES
 # imx-lib needs access to imx-specific kernel headers
 IMX_LIB_DEPENDENCIES += linux
 IMX_LIB_INCLUDE = \
-	-idirafter $(LINUX_DIR)/include/uapi
+	-idirafter $(LINUX_SRCDIR)/include/uapi
 
 IMX_LIB_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index f091b4f9832b..ebeccc3bd66f 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -23,7 +23,7 @@ GST1_IMX_CONF_OPTS = --prefix="/usr"
 ifeq ($(BR2_LINUX_KERNEL),y)
 # IPU and PXP need access to imx-specific kernel headers
 GST1_IMX_DEPENDENCIES += linux
-GST1_IMX_CONF_OPTS += --kernel-headers="$(LINUX_DIR)/include"
+GST1_IMX_CONF_OPTS += --kernel-headers="$(LINUX_SRCDIR)/include"
 endif
 
 ifeq ($(BR2_PACKAGE_IMX_CODEC),y)
diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
index b80c6b77335e..3f2602268d36 100644
--- a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
+++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_IMX_SOURCE = xserver-xorg-video-imx-$(XDRIVER_XF86_VIDEO_IMX_
 XDRIVER_XF86_VIDEO_IMX_SITE = $(FREESCALE_IMX_SITE)
 XDRIVER_XF86_VIDEO_IMX_DEPENDENCIES = linux libz160 xserver_xorg-server \
 	xorgproto
-XDRIVER_XF86_VIDEO_IMX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_DIR)/include"
+XDRIVER_XF86_VIDEO_IMX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_SRCDIR)/include"
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
