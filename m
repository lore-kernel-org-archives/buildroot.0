Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF72A606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I1b45KpU
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCF118168A;
	Fri, 23 Oct 2026 21:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdQdE5cHOQ3K; Fri, 23 Oct 2026 21:52:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B709881693
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792351;
	b=OzaMi/+EGLEkBaLXOGemvPU7aIangBjdXXZw2LhkjgIGe/EJTRFsdLSMUAQV0a6zcS26
	 cAHYk+vEn/PDrh+BqsUk+R0I6xFc+dYfYlOdIDga5DHQpcHvdN047+effh1+91Wzw39RM
	 ABDoCDfYG/LPM+bipVDQmwd4mKVpK8kQGXRgbdSRYmsVhmzKru6uslU1lnct4bJGYshNL
	 onnZ80TGjLMYHasNCBNfz4N3Tn0SyE+4NfpGfIWZQw5vLYib94jJNpV8PwB4qyhzxEp/o
	 xQxzsquPZuxmb6NOjGXepvsNY78DK9CGKAL7Q3REs8I+0lH+KatHdjsyKcy2fbAsBmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792351;
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
	b=NTdGje3jJNqev8pJ5n9w0ZU1gKAZBmWk7gdmdJMDw9rA3WyTgze0eLHEP5vc2RENobn5
	 2YCCTwLQ7GhPWUPBsx99f+fuvfd3fbhGI5Gvqb1aV0QxKTZkS798lzCCSKByBsWCFclFR
	 i5LmyTGeYj7vwR2QevPCGbW1qg2Ye6uMwkA0RfCaKBPHl/ZFzidUnTx2/X65KNxIV1AAM
	 wW72nZiy8XayPF5M9ffUVl4HWeu3ZaXZoLiXSVYMZKLWA7iRp8uNkRBkF/+gsq83r/1gE
	 4ER9HIIhiOP+q3az6EOX7fTwTSp0fvMq2nmoJLEzen6XGTXm6B1O1Ee7+jtsVlwP9YQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792351;
	bh=/LTW8vZtrFZcyGcuj4IFN6Mz5GqEfHP8qgwpq0012k0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=I1b45KpUBMu92JzsXsyaU0TzhhgU1YdH8fnOmQONoZhmJraA5cXK1YyrWJ8CcNrys
	 qsGa2ytIArGcOESCw9NlhCcNGQQ5ooXOw4BxyOz0S+M8x4IMhG2ofsUo4Rd4uOChG+
	 AC1xrJM28x8+djEU1k8vGDzMEL/aWWcaiRWUyJeDDuNHQFSUHla1N7Hx+gwywCQyQH
	 mm+AAhH2NMUIxBrlpjp2UPixntlpFbQOr+U9FMMnjPC7V+dKS20DtLXiGf+z6WyEP1
	 iK6dUK4RYAK6sL+N1nTml90bHZ2wa7ogMvPNgHkZ7lgFpsxvXhEpb9l8Vo7rwYeZEK
	 toNkyfgC9mCFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B709881693;
	Fri, 23 Oct 2026 21:52:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8361F3D9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69C618168A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5MGoGZnqnqz for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7AB66816D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792346;
 b=fjVxqohcMrnGWnXw/nNZKQtDdbybKV+hvYQ2n84THXXNc/U4DKfyeLYQH+vZNUmWf7Ty
 V2bJECKxa109/hhe4f7OaSqRc2zB3HVrhg1jRwG45o+ETcWIGB+4pl4Po/lazFrpQeb5X
 8m5YcN1PnCyVH3sYwLe+/Z6wr3qezUDeN6AE8vvyeTW/+oZPKR0eNVFAzUoLFHTvkeamz
 dtZsJY2U8PA+2kNjqZdvSIHrX5lpbVOuGPE377oXd7M5kIcdoJNsbIJ1qqMfw961FJPkH
 +2fIyO0q1joET5ClQrtMnKqJU+f8DuOHSPu6Zl05Vox6tqIqvaaNn4xC2WJnYozbxng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792346;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=kmjtxdjKfwF54M6MSbnc22tZa1nS0feubx4bpTX/IRs=;
 b=XvNHwvKO3cRzKe55vpyuK6496id6t6xDCrbtUwuXr7Q9bB3oUYRFskU41fbA2rVvPDVi
 i33rolv++mGPLAisl7I6bM6lGKFdSWlvmN2Lu9ANztzE7w9KWC8zTLcUJ9n5hN9f8qATr
 /k4U051VZ+sPlV42z34hi6gbDBQOPFO/pxNS4JxovOmY6byES6LHzrKgJx+muLcRfOGZz
 OmUOQnkxINR5rNZDR3jHMt+HaoJWB5by61VpP7nDcS43tPLeMLfUdQxr+RWExGQT0qKiJ
 3mhmVh9EuyRZWzfnbZ9GIHbGWi1RI6/VhqYotB9EcgEIaAbtV6faRc1mkBLgncjchuQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=YvwSGu0g; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::562"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::562; helo=mail-pg1-x562.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x562.google.com (mail-pg1-x562.google.com
 [IPv6:2607:f8b0:4864:20::562])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AB66816D5
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:26 +0000 (UTC)
Received: by mail-pg1-x562.google.com with SMTP id
 41be03b00d2f7-cc7d154ec4fso569028a12.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792346; x=1793397146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kmjtxdjKfwF54M6MSbnc22tZa1nS0feubx4bpTX/IRs=;
 b=N2h3kC/Picd5XQ5l/EwPFwS2fk3MDwrlUChDEVAYT5rk5+hk/ypWBHxhOvL1LjN43I
 k9Pbu8BEcoDcJrIWSEjBDESXksTLNJsevGjs1JJlhUO5Vyp2gDwoGzhSCcRn0qjOUKjC
 A7KHbgm5obJ9UjUMdQGMhBZSVcx/YlxoveCGMDEPflhEMrv8sk/spni3D36n/qnAW2jZ
 8JoxG4zflLywYkXkXWfFp1XdIeqQWdtJoFeV8tFz71+0YriF9ynV6mkV+36k94OO3DLI
 SqwsmmiZsn9K6vEG2KeZqidLEnw4nqGEnoVmUfqIGgQldN33G4g59rgyfa9repC2E08+
 lBKw==
X-Gm-Message-State: AFq9FYJy/8TzSdMk5Ryj536IdH9SFB5XTQHxjC3yEpN/sfWx7DldbP7W
 enHjaXvjcbHi6eWnnjYVlFQkLW7pAQMZ7sihI3IiLtmt9Bmiqdga52Je7NFeqPat42d+SiZHqY8
 +aOgCENjUsLoPhPtRntR/gB9/+uOZHMxuP5PBf9mjyKtBBd3TNLUjUvQZnw6UDu755iz878/G8H
 1+TkJnWv6nIRBriY+sexq5RRkvFcQFr1vMxYCtTIDdXoy8HCDuMCUZX/j4boNzARgepcDNrc7wS
 WUc9Ko8QoTzr80ZIx1L
X-Gm-Gg: AYBFou3/tXFtqv2g63xdCYvsfam/oQbqwRzR6MCGvU/3+dVHj1T+2OoF3OvbohR+Mzm
 E2i76qmzLO1+sIc5xowObmxRIPusdA9a5l9LrSqW62KtbNGkmaInCe6ACafhhEUuPdKXXsNC4/Z
 4B1IU20eGhVsL/Is6lBjCw8qQ10FVHo5dWhaoNVKzSlrQNWREbEIsaGzwBHGhP5U34Rs0esOLL5
 2Rrh0vZ5Np05VMhRujzhHB/NRrkd6EBfMzES2/D4IVWmLAfZ9yiVULsef4L6OkG53dFZAPD1s+C
 UJ0hVB5JvulkdOldYH1qu5N7t5PE6k380V9pNlJJ2CXQ+856j4aaWZiSyvdSMJz+q/IkG0InPae
 dlET8P2SKKIC+oUHzkwdsmwlawBCDBcTbS1thip0GR/sx9IgW+gILlVr1zoglLRgJ2RfbjTz+dG
 lR++qMSGOujCs2WDS4tIVI53ODjJN3n6MdfN+VIMgZUjI=
X-Received: by 2002:a17:90b:3941:b0:3ac:eeb:e0ed with SMTP id
 98e67ed59e1d1-3adead5e324mr437081a91.36.1792792345440; 
 Fri, 23 Oct 2026 14:52:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebe6b8c4sm343108a91.5.2026.10.23.14.52.24
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30bcb065bfdso1940641eec.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:24 -0700 (PDT)
X-Received: by 2002:a05:7301:922:b0:368:3e29:665f with SMTP id
 5a478bee46e88-369e8645eb5mr657267eec.33.1792792341726; 
 Fri, 23 Oct 2026 14:52:21 -0700 (PDT)
X-Received: by 2002:a05:7301:922:b0:368:3e29:665f with SMTP id
 5a478bee46e88-369e8645eb5mr657192eec.33.1792792340614; 
 Fri, 23 Oct 2026 14:52:20 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:52:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:37 -0700
Message-Id: <20261023215138.2301146-16-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 22/23] package: read kernel headers from
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
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
