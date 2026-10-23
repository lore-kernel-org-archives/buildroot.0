Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1C2606A328
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 22:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z6ROir2m
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15769815CC;
	Fri, 23 Oct 2026 22:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKWuEHWFvx1J; Fri, 23 Oct 2026 22:00:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F05088168D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792835;
	b=QagXcelg4EOW7Dp/MVisZoBqbewmW7LhOwWQgb0J528FDDdGYyaaFTKYfDmZ5tXD+iE2
	 6uvgsLFhIJzPEp7V9SrC7Sn1y/wjhyuDMOMVuKTQj5CQ2CKV1V7phoSweBhAF18cpXIqu
	 u/+7XOnhMEnpH3aZqwNoWrhdrradmz5ifPMJgFXx9bEYNCmfQXEPlBQ6397rWh4vMIz3u
	 Y9CNcJ+PNDSnExDzbPdOxcMw3G3YDUqUjzbBrc/y+WAF3OfwcTvqxwZPYT4gtqC7jbsV4
	 nTbJkTN1Y1Hkl8KizklmiYwmhVCso+9eoyJdBi3+mS+J/Rl65SJaqPAmUqleRLxouxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792835;
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
	bh=VCAGnvR0oRSL+ihimIfQhKKWT7t02nKRzW4+pMAa9DU=;
	b=RWdLJF5jKfMzK1pnb4KFNP5wFBu33kdfyJm7eOlZjtBigD1V0kba/mF0Sm2nOZnAiPKT
	 neAnHvohWCHcz994Yl8wyCCdQmqm7+yfmVQJ2S21BdUTNNpfGY20BkJKlzYh56hJvLGSe
	 HYA3qIw+EoswqliPy3UeMXKfBs3jy8Da3scvek0CI2K+hrT8/xKZAZThnLFv8Mzl8ZxOy
	 rUgwpuIlGywnRUn6v89XR3Z4nUBQE0Jf6D/sV9O29hLpVrbettFAp5blemZLCWZ6YDTlK
	 S7S1IqhlVuHUon+a72YEHmL953FK3yKEadikXg8ve5P+C2hJ9gbIBgy+pPcNmPMbf+w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792835;
	bh=VCAGnvR0oRSL+ihimIfQhKKWT7t02nKRzW4+pMAa9DU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Z6ROir2mhLx4CzpKfEy+Bri3EnrxcRF3H4tffKrmE8ywY5bWPEuMyQQmIm+lKh3Sc
	 EuBNtFT5ZOOMlKgkXttMq+WXwl6A+cKBkgFSGMW7toFwewgRuDzWvpqKjuat9mDUrs
	 xkfnI/y45uSjJtEm5asd8lEEp/a0aRB9SuMUK+U5YBVylI0PwfOG3+m5DbXuPVZFhg
	 K3rw2chHIaW8LY9utzOphglSTO/JGTIxetKuutn+QwRA9U18MTekh3TSQddGBY8IPr
	 VsPWzaphJcxS7Ci7u8ki8iufsHioBlnFoLEzS5QAXbkIVqLjEyrSpoaxhk6liIxmOQ
	 /tZv6moHn9FZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F05088168D;
	Fri, 23 Oct 2026 22:00:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B971479F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E8E740A8C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EZHXoBHl3j9 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 22:00:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 948FB40AB6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792832;
 b=gLyphxptCnGZDqIrfQLH/PYqT3fMhX4JYmNeMuJ5wHfN4kATok0Rr8qJNPzByIbM5/9j
 sX+MbBfJugt2x4lwfXLw22VMpPSafnytvLf0/alxrcUIY5LjYMQknYw2QyyRPp8z/IQrk
 IQJJdjgjgbLI0hqPYgkD9l6KMk7J+zcOk+n/33rGO97dO13e3tMlXNJhoBCiXxsZuHTjV
 yY9WuWouCtv6siExP6OG4X2K48ARuq603DfrVjURaSw2B1+4enpmnKnVPDYtsfzWR8g5C
 vjIFUDZ6Ewwx2EmcwPmozi5CfF7LRFIIVAP79fxLbq5zW5O+D+XuwHaQCalJILhQzJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792832;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=V5zXa+RWLTznikvBxVkCr7qr7WE5npX3hH3k8/FaSkQ=;
 b=rEqfTNYOoQ4Arj9s4ncf8xbTBFbLbZELIk5QtgZRCAo21ezeTKjzjxHbW3bXKK1TxWot
 IY3Q0D04f9TRDfjNPpE4Xc049RT8Es0Jo/LN+ECTUvbNboTXlmbw6RBCTOVEnr+vlDHS4
 ExMZMFBadrdv53SHnuuQvKDW1wLzM5wowLXWJO6ITCktQlz9NDW77uxJeBWgZ9X58n92Q
 gQU3kTqEUIuy/EZLfADlt1Y+josnRrPqoaDPKEMbYnEBmpL3lsIWU7693/n8Q5KXlZvew
 32uQPG6hWBQ+fRdLT4RFfYE/CoZ1NvqZm+vYJlqi4Otg4Rfrt5navdGmY/ZMrFr7nyw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=IlzOj4p9; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::a62"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a62; helo=mail-vk1-xa62.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-vk1-xa62.google.com (mail-vk1-xa62.google.com
 [IPv6:2607:f8b0:4864:20::a62])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 948FB40AB6
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:00:32 +0000 (UTC)
Received: by mail-vk1-xa62.google.com with SMTP id
 71dfb90a1353d-5eadf48fb2dso524666e0c.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792831; x=1793397631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V5zXa+RWLTznikvBxVkCr7qr7WE5npX3hH3k8/FaSkQ=;
 b=DhVjgPeL+8fNV7GFxpzfRjYDbhZYNAaBeV1MxA5oOYHssdWniUX3r0NcYmUI3NQN2W
 /fnrLjPRhHlkuDMRj+886gOGWcFiPGcYfKvtgjQ/nFhaNKYY8pVx2rzcbpVgU2Dqrr9g
 LD2x+gZFiy6cquFOaTYNQ+s6Tv6Is+pGJjFJQS58uvnxEpOi9UXXLD9YAL6Xz0bkQyrY
 7auFQPFoVslovLFSR8dzQ5nQGarzpnKqMLL0/qJC+dX2oJcu+ezwO0u/8o457LKK9LBh
 jIs2MY9o7IffgAip0yciT3rSDK8XK1i5pibXQK6DOeVmyscv2WB4xf0k//buv37coe8A
 iO7Q==
X-Gm-Message-State: AFq9FYKYx08MSBrCaWSSn55yqpvB9WKnwZUEotlJtu2nVBj/bOU1BuvI
 tLL36ZCs2sha/y+YNF1Q1QHFj93y8c1QWVyF2nsgGnPdgUJ9IAAgISf+eWEBYsR0AiXx6/P764R
 Qbi44SBLPPqRMqE1w4r0M7b62vex2R1DlorngbbJ5gL+Z0V/Y8fzqse71S+xIsTSY0ayDUBcGhH
 z++8RPPH2WNaM2sVUJTCkWpiz0l5J+okBy9STVcbJ8uqYNGx6pVUJRifzi3njL8+OLyyrBK1Rx2
 7lGb30K7pv4Dy2HLp7u
X-Gm-Gg: AYBFou1+buLX9G7Sj+1DHSpcZ0pIe0JQsxHDF8alJ+6JVsGl9FvDnD/O1Fm5t/JTWc0
 m5ViI2+N/c3K4tbO6SdlBKa+h0e6jj6B+HfbWt09+rby/5h0EANGFJos49+Hrcrk26IyyWbwxWI
 hb8p2fP2AHJxZZRCuOwbj3N7iqvXA+fzKJFF7mIX6g39Z+um42jUc+idP6/7SuI/yTteQ6H/fug
 BDcRL7UQVrE1cZLiVg5Q37dNZPgLeXijmCHKMtJu7LwUj6w1rX7nUyk1YnAti9u2M1aEvsJT6Yv
 6e9f5Oqr4dTGDTkmCMQETwsoWV4Ew19SYvN3HxevTD7W3Y09g5cvFwJ8+7IJfvC88IzS+zyCieA
 HtQgcnnzsOieyv/K8jXThjF/DE91hSD9LsiUIUcjPjxB4HVQOYm+D6IWTHW/4tY15n96Xfdskel
 yUcz5U/wSKc3C/QsumYfuE123gyYQK61vHLTJdqMuf
X-Received: by 2002:a05:6122:c88:b0:5ea:d32a:16de with SMTP id
 71dfb90a1353d-5ec2328e3d4mr77909e0c.15.1792792830891; 
 Fri, 23 Oct 2026 15:00:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
 by smtp-relay.gmail.com with ESMTPS id
 71dfb90a1353d-5ec23066181sm2751e0c.0.2026.10.23.15.00.30
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 15:00:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2e93e2f72bfso18725985ad.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:00:30 -0700 (PDT)
X-Received: by 2002:a05:7300:5bab:b0:360:b8b4:840a with SMTP id
 5a478bee46e88-369e866092cmr958301eec.39.1792792333864; 
 Fri, 23 Oct 2026 14:52:13 -0700 (PDT)
X-Received: by 2002:a05:7300:5bab:b0:360:b8b4:840a with SMTP id
 5a478bee46e88-369e866092cmr958217eec.39.1792792332928; 
 Fri, 23 Oct 2026 14:52:12 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:52:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:34 -0700
Message-Id: <20261023215138.2301146-13-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 19/23] packages: replace $(PKG)_DIR with @D
 where possible
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
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

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, packages that use $(FOO_DIR) (with FOO as the package name)
expect it to be unspecifically either the source or build directory,
with some packages even expecting that it is both. Because it currently
is both.

But when we introduce out-of-tree build and shared host-target source
trees, FOO_DIR will no longer exist, because it can no longer be both.

So, In preparation of that, replace all occurences of $(FOO_DIR) with
@(@D) which is always the dorectory that is the destination of the
current rule.

Note that in some cases, $(@D) is used as the source of a copy or a sed,
and expected to be from the source directory. This will have to be
carefully identified when source and build dirs are separated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998@free.fr:
  - reabse on master, convert new packages, drop old ones
  - add a commit log
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit a7e38cf17ada495c3abc1f9bbb377c883a9b4c5a)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/linux-backports/linux-backports.mk | 2 +-
 package/ncftp/ncftp.mk                     | 2 +-
 package/pciutils/pciutils.mk               | 2 +-
 package/php/php.mk                         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 8513a84487a8..e14cd4a1706b 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -33,7 +33,7 @@ LINUX_BACKPORTS_DEPENDENCIES = \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 
 ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
-LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
+LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_SRCDIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
 else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
 LINUX_BACKPORTS_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE))
 endif
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 4075449c53e1..1f33270adb92 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -37,7 +37,7 @@ NCFTP_DEPENDENCIES += ncurses
 endif
 
 define NCFTP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(addprefix $(NCFTP_DIR)/bin/, $(NCFTP_TARGET_BINS)) $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 $(addprefix $(@D)/bin/, $(NCFTP_TARGET_BINS)) $(TARGET_DIR)/usr/bin
 	$(NCFTP_INSTALL_NCFTP_BATCH)
 endef
 
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index ad32713d579f..52f92db78505 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -46,7 +46,7 @@ PCIUTILS_MAKE_OPTS += SHARED=yes
 endif
 
 define PCIUTILS_CONFIGURE_CMDS
-	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
+	$(SED) 's/wget --no-timestamping/wget/' $(@D)/update-pciids.sh
 endef
 
 define PCIUTILS_BUILD_CMDS
diff --git a/package/php/php.mk b/package/php/php.mk
index 1bb25d086370..1dd979d7a2a4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -343,7 +343,7 @@ PHP_POST_INSTALL_TARGET_HOOKS += PHP_EXTENSIONS_FIXUP
 define PHP_INSTALL_FIXUP
 	rm -rf $(TARGET_DIR)/usr/lib/php/build
 	rm -f $(TARGET_DIR)/usr/bin/phpize
-	$(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
+	$(INSTALL) -D -m 0755 $(@D)/php.ini-production \
 		$(TARGET_DIR)/etc/php.ini
 	$(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
 		$(TARGET_DIR)/etc/php.ini
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
