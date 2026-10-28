Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A01C606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=naWr8c70
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B232409DB;
	Wed, 28 Oct 2026 21:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JU4uUu6oF60; Wed, 28 Oct 2026 21:39:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6311140A02
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223573;
	b=KL0NEboSIHVExC7y8urosM3PdXvL+PAhA/+EYbMBv5GVugoUdMHxz7nZ0ojwvs1HfeWD
	 c1cV+YX0SsSxedTk0MH3zxtxv+XS6wsH9kAgv1g/wVH5xIG1856CbWRCKs5ciiUR7x2PL
	 5u6lxUSXJ5wOhTIxBktehZNwmEmyhy8hY6GcJ2yYEg37oWmV0UB/obDgO8SS7+2GZhoxM
	 djVfS7I3Wd5apfuG2COt7r+6xuo8NmZoWdcIU2Z99IPIRrON6RTEhrIxSJ4xzUCXmpslK
	 kMEtzsj3wtfHmZkltI8zWm/HcpnuT3OHmIHWO/rIwuhzRD0WfD1/TIE8sCnP7uII4cw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223573;
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
	bh=WHItOhBtwjyUoC7QWogTcco+HVuaglscfNud/7ON43E=;
	b=kvpq/BtrMGIM4uYzfaWFRhyVkyi7m9U9o8gNc1fa1nM52S3WuU2GgUXQoxi5CqtA8u/t
	 JWjII/anzlxjLMzwdY/XSgjdgLv57VownaWIG38ogoL1yjXBn0iboIW02lRAkL7+699rE
	 X6ECD73KUI6MLxr6jn3CM3EXZBfy8swMUzRK8AqLkZ2EF/OgXYX8fgmzini78b7QcEeKb
	 P27AxGRz+osua/c7fxmYF5KUmgzLmYz9jSrA7fOA2QgiS239wyWYySx4YeoHoPtzEWayk
	 pZgeypWZQmwIegLCWu6DoDBx9fxF2Pkvbyyl/5IZInpY5fszfsV3yRMfjKHrJgZRLqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223573;
	bh=WHItOhBtwjyUoC7QWogTcco+HVuaglscfNud/7ON43E=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=naWr8c70TjaLbuUdTtzJanTBb1pLkmMk6F7q3uE9C9HBuLl+YnAnshRU6Ybo2wrrh
	 xDLFxCZf903Mpjo0oJJkdSu4j8g2jPqoC2dfKqvHhhX5Gr9+AOPy73iT12imX1EMHA
	 2+52Ak8BVOoIUNeNXLm2MvDoGfyj6QyYNP1GnZrTnFBDnLR6fGk7u/HX0xgupq7fXA
	 q2aqIUuilgpxo7e1GKWM3NuMG8azFWEuxi8uMvjnBHhu5pz8LCuCw6vzFa/KA62p2L
	 egBJhaw1Pr8twf57ZKUYWh6YPuh2DpNAw5Zj6jD39uebmNJ9dqc3nlpNRcesQAv8AB
	 jipMboYUD6AkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6311140A02;
	Wed, 28 Oct 2026 21:39:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31B6D2A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ED1240229
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKm3dHdCKBsG for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:39:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5AC75400B5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223570;
 b=FInDlV76XFr1FBdwBKnpZTn6ETPqvPhCngPOb4UX99dZlSTN7iZw9iBKXZhkK6jVWPZq
 eM9GfVwLuo3IQ9d4eXEOd28vJE2959m4yiKqXBm6sOiFlUwaDhQGSVt1lSrhataSx5AcO
 YdrnPdZjFqNTzRM8KWH04SLuOKwZOV013VX80uu05XI/hhCo1Pb4MCgyFnHEgcA3/EFUP
 Bu5EGysxg0wpy7NEWQILsfAUPp1TNCgEofZIdasYJ8ejLzx1cf6QTsYFnlxFTVP/Tm3YO
 uwQBaqfhkTvSHuVSXCezszplxxnjlwTU3e0aPPjSrMBFO3r8CPB7tNSwZcmTO44E34w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223570;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=Egz+iaMnbx+00tqZgFKg6rKeG8W4/5R1KHW2qoFE/kQ=;
 b=M4VezdPELWxDZoQMQHD1wSIJRm0Z8D6WiBvh8EHQAzvs87/TNj92eUGNbN3VHMrv3HXL
 NSw+ibQqa9UkLAejO0SnQZ5ZguhmEaby3mJCco318nKgfS6qCg6iEL5KsBIaM7hSpSWyq
 X6r4+OcODmPVZSvNhzWP9BVGPWIa/iJ6kl2B3aLV6u4mf11awWaPXuDvJfdOgcq+e3x+Y
 7IDo0tC47GmNGeTUV/EzYmPR2RobeldkAgLAh1W8IImv8kXgQ6T6K0AbHO9OipSP7gGSl
 CEp23JycBrFGBIM2+ar4VGbrHUo/OU8zXk2UbiVWbspxnga6JsMz3YqFhSPPoeQi/0w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=Xu56to+6; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::e64"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e64; helo=mail-vs1-xe64.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-vs1-xe64.google.com (mail-vs1-xe64.google.com
 [IPv6:2607:f8b0:4864:20::e64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AC75400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:29 +0000 (UTC)
Received: by mail-vs1-xe64.google.com with SMTP id
 ada2fe7eead31-745497ac8fcso497305137.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223568; x=1793828368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Egz+iaMnbx+00tqZgFKg6rKeG8W4/5R1KHW2qoFE/kQ=;
 b=IpjrS+N/pj27ULh1+Kjo9rrUIU+IhWpcOA34Hah0Mly98+Z/xL9ju3W9qltG+X7kDu
 O7S3UnvGbfF68z9zwKZk8VamK2E7iST2WkFAhTbmZGAkewPflo1/TP+5/23B/23H8Twm
 pTyfGGMFziVh07mq1/sAIshIcyL1YjCVnuiPlWGvo2/XvRGViwRHeXwJYNP+j4NdSeqK
 MsYRojXuOLfbDAdPh8zYEi4OHgRX3QK0C+MfzxteoE65DNRd11ZImrFk13z30A2ctD+3
 JMFbwao+j4pbCYis/dCKSRhV3ongIIRAIShnJjljaPmx0bPYoXB6cJxdeJB1KiS2lEE6
 HLyQ==
X-Gm-Message-State: AFq9FYLH0QjXCGtso+vsb6NMxYEVr5rw83Fm/IGRpWpRE/bLoG/lwLoV
 ofZK6kv7BYlX/dlCbybAwwmSKdBmF9BUYMP9OSNByYIA6ndkdVDxNipIt1yADGlMbnKI52reDLG
 3BJFRCeTBYgimiJF/ezZwnMudbjaVPnSKatUAxclbfUbomDUG6Gs/cYc4Ct3O5PAkWrXf7eDIz5
 arUuk98igdQyJY03WzkdfzIkzdrxImUf6i1dDlIb4r+xos0DgUtD/R37/Z0/uCTF7Jzi88JNQ0m
 QgGw+mcFLGavDi8RQ==
X-Gm-Gg: AYBFou3yhZ2EcHtxOZ+kxT1vbrQZO594mq8AQJSz161l6B0Tif6rD4NUT5YnlKAqXOh
 Vg4tAjTftWnkOF0agC64h0+hwqYLRg00JTZ9aOIdcisPq/SSZFRhavdlGwcl0jVmovngWktn2Sb
 QXmfwbz2NbCrRBPM4xnArkGVDOdLgcLfJeTQVX3ntUCIKi2W5O/vxthuO9dlCtCWynPyW0rcMYY
 dopstvYY7ouhQm7Um0iBFm3pnkuDRiZi5+HZNQxkWkGm82WL4xkl38Y1PYUxoqiCOkG/Fs0Htxe
 PiuYNDzLqwHtQI4RcpwhaBHsUnaFA7NPi1zk8mTChqwFU76MxDhmO7TNgYmVul/s+gSEqc/UD+H
 7jeNUIa57NpjExkbomYYdIj4OrK3F8k0a6GbkO7YyQUNb2CRqTRLUiGxQic4D6AEZDWmYlLKJGA
 vCC+pqfrh4SwcO7UFv+4ArxZNKtVXx/LqDgHl5t53Q
X-Received: by 2002:a05:6102:5123:b0:7a6:85d6:8ae0 with SMTP id
 ada2fe7eead31-7d03a289c2dmr1610865137.1.1793223568230; 
 Wed, 28 Oct 2026 14:39:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 a1e0cc1a2514c-991259c293bsm61077241.3.2026.10.28.14.39.27
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:39:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9308eafb465so284433885a.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:39:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:c12c:fbbf with SMTP id
 af79cd13be357-94408d76075mr585384485a.76.1793223567458; 
 Wed, 28 Oct 2026 14:39:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:c12c:fbbf with SMTP id
 af79cd13be357-94408d76075mr585379585a.76.1793223566912; 
 Wed, 28 Oct 2026 14:39:26 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c6ed36451sm62806156d6.34.2026.10.28.14.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:39:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:32 -0700
Message-Id: <20261028213744.511429-12-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 11/23] omniorb: avoid target-only patch hook
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Matt Weber <mlweber1@rockwellcollins.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

In preparation for the introduction of out-of-tree package build, it
is important that we don't do different things in the patch hooks for
the target and host variant of a given package, because the source
tree will be shared between the target and host builds.

The omniorb package was doing exactly this: when
BR2_PACKAGE_OMNIORB_WITH_APPS was enabled, it was patching the source
code, but only for the target package.

We replace this solution by adding a patch to OmniORB, which allows to
conditionally enable or disabled the compilation of the apps and
services, which is then used by BR2_PACKAGE_OMNIORB_WITH_APPS in a
post configure hook.

Cc: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998@free.fr: renumber patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit c5fe01e3c525babdc6ad1939fb3f98eae91f7c9f)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../omniorb/0002-optional-appl-services.patch | 29 +++++++++++++++++++
 package/omniorb/omniorb.mk                    | 26 ++++++++---------
 2 files changed, 42 insertions(+), 13 deletions(-)
 create mode 100644 package/omniorb/0002-optional-appl-services.patch

diff --git a/package/omniorb/0002-optional-appl-services.patch b/package/omniorb/0002-optional-appl-services.patch
new file mode 100644
index 000000000000..9e3177465e27
--- /dev/null
+++ b/package/omniorb/0002-optional-appl-services.patch
@@ -0,0 +1,29 @@
+Add support for EmbeddedSystemWithApps
+
+The EmbeddedSystem option allows to disable building a lot of things
+from omniorb: tools, apps, services, python bindings, and more.
+
+However, there are situations where we want to disable all of these
+things, except apps and services. Therefore, as a quick workaround,
+this patch adds support for a EmbeddedSystemWithApps, which when
+defined, will build apps and services even if EmbeddedSystem is
+defined.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Upstream: N/A (Buildroot specific)
+
+Index: b/src/dir.mk
+===================================================================
+--- a/src/dir.mk
++++ b/src/dir.mk
+@@ -16,6 +16,10 @@
+ SUBDIRS += appl services
+ endif
+ 
++ifdef EmbeddedSystemWithApps
++SUBDIRS += appl services
++endif
++
+ all::
+ 	@echo
+ 	@echo 'No "all" rule here.  If you want to build and export everything'
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index b61c7c3537bc..866d8d76b085 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -34,19 +34,6 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 OMNIORB_DEPENDENCIES += zlib
 endif
 
-# The EmbeddedSystem define (set below in OMNIORB_ADJUST_TOOLDIR)
-# enables building of just the lib and disables building of
-# tools/apps/services.  In some cases the apps/services are still
-# required.  The tools however are host related and should never
-# be required on target.
-define OMNIORB_ENABLE_EXTRA_APPS
-	$(SED) 's:SUBDIRS += lib:SUBDIRS += lib appl services:g' $(@D)/src/dir.mk
-endef
-
-ifeq ($(BR2_PACKAGE_OMNIORB_WITH_APPS),y)
-OMNIORB_POST_PATCH_HOOKS += OMNIORB_ENABLE_EXTRA_APPS
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 define OMNIORB_DISABLE_SHARED
 	echo "BuildSharedLibrary =" >> $(@D)/mk/beforeauto.mk
@@ -67,5 +54,18 @@ define OMNIORB_ADJUST_TOOLDIR
 endef
 OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_ADJUST_TOOLDIR
 
+ifeq ($(BR2_PACKAGE_OMNIORB_WITH_APPS),y)
+# The EmbeddedSystem define (set above in OMNIORB_ADJUST_TOOLDIR)
+# enables building of just the lib and disables building of
+# tools/apps/services.  In some cases the apps/services are still
+# required.  The tools however are host related and should never
+# be required on target.
+define OMNIORB_ENABLE_EXTRA_APPS
+	echo "EmbeddedSystemWithApps=1" >> $(@D)/mk/beforeauto.mk
+endef
+
+OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_ENABLE_EXTRA_APPS
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
