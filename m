Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F78606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i+6+h22L
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0817B409A7;
	Wed, 28 Oct 2026 21:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7rRz20iveWB; Wed, 28 Oct 2026 21:38:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ED5E6409AF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223482;
	b=QaI/IDoXi++WnfTM1TUG3qpTGtwvyfzcMkyUImRlv3XC31WiPxaw6ovOjLoug1De/X0E
	 VblGbItZSw8ICJg3v/mb3YJali29GrwF82GpCUYJpmlhAUbpLBPwqNuj/NpjEJIQpt0XO
	 GPNik1wNaxzI65zwtYXdZv8rkTB7N8zQrYuEKrXD+XnFvRrJwnCQ7QfHONbO2GGP/saiX
	 IcAZWOng/QT0DZL8T6N3lCK9bq9sBQKqNl8z0DedJWf5reKTRf9WLcrrYe8BFEAq7Ym8h
	 ixjipywiXO5SZnFIWsQRXPaUCEUyl/13+UN09cuqbQ3SnhBXexe6IJXhX7klv8Iwl1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223482;
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
	bh=EVfR14hsNO8wDVfCTaBChoo/+U5Ti2Oq1LHMi/cnorI=;
	b=PsrnoDX32f8QGDJkEmCdikvfVrYGTBNTnxIo9Fwzq1SsCt8pLk4E6HZ60Y7lxVeAJX5P
	 WYMvqoRr7ADWsCxBOyqimGLcCAVgq5upLqkb6gIbpi6leUU1jCsguqjFBZZAROQeG0hz/
	 6+xkJjwcAHvyo1BNXnINYH+0BunvhSyqSMqYDrYOgi06/M3u1fs1V+n7JELcndBAWhr+R
	 CIlpqWMu63M98Vq9LKVfnHL2C131TdHYi6qN4UdTb0xXFRzKulPV88YrWqD5qrT8WJkiC
	 bF8WNP4yx09T4Ju/gNG7f3K8fg1ibfbPHS8xVEcriTlj/R1y4FS+zrgiJ/tQMdKc8HA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223482;
	bh=EVfR14hsNO8wDVfCTaBChoo/+U5Ti2Oq1LHMi/cnorI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=i+6+h22LLRu5/JOoktq13EsgsPkjZTwl0yB53Vzh+ULpdkbTXD+C8W7BbCZtb95Xe
	 4u2nQeWsIJkRB4Gv4VSaQlCib4Cif+YGMEGeDAPEBOLgdWs3WeN/zo6NujvBJPL+4W
	 Du3RkaH52UOIVrVjzADHb5+JUPsMteMJkllXJn32fwwyO8DHUu3qQusGRueH3L8X4s
	 YrqjFbQvrNwrZCFrVRHPmQWZUbZhitwj8d5/1ZxIygKvPgxtUqnz2aXUENW1iNt56I
	 OHyipxMJcIb3FzlrgweLhrJDFtNx81zlXLzVw6TDCCIHJ4IxAX+d4UmxS3RHhCzdJi
	 EJ+DK8rzL+3iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED5E6409AF;
	Wed, 28 Oct 2026 21:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 230732A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1508B409AF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pe3w9RQH8SMD for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:37:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 39121409A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223477;
 b=JHsosmg9PTZfCZ5Y9HuTQSxjN2VLoT4Ky4c8w/dERoi5iDnCzz7D/zlwXGTdYjErS7Iy
 JIeHwcMakxAWmUXrSc2/p31fARbvCyLj0F+30+z/JPXi0MxHTomB/1/sbxfuLGmDdnMLc
 mlh3LO3cWV8dpCHgfoqCPv4DIhYdM5kF54ArPmVwsXhgii0vwkswyHEvEwV3BD4kAZ9tk
 9WlTIQ9lE+/ZaorihE1R+LiK7ELBDOSgaDtdFKbQPvZfFW4B2NxDXig0CvG7BrCcA6XIt
 PFq8MCz8G76bzZmIhf6YXDE0q1oV6t4zh4AppDJB1pgTp1OkQNYCyyICSJNUMqw/NIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223477;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=GfEMni0XRSQbWis9KyNWEw4OzVz9r0CUnmI8j1ftEX4=;
 b=TGvAyb3TmhCb247AQu5ByofrtgIf/uIvq4G7PpCSvsMvniORAMohsqy2MJnqhITk+xPV
 zTiGG8bE7va5qJkL2DnfvgJGJ/V9d5hLQJl4ItfGzz/oOu+46kZcE8Ra6CZTXu8EtEplL
 CFeZZg2VHPKcG3GtDeW4lhmJjgdbo2fQa1ujYUue2u/EDRCbklbxmmG39reG8sciMHJ55
 87W6TNOfkPOCb7HviOzySveOvK2Bo51SuqS/XN6QSW9aKTwYrRi/geAVGOgq1zQVJECsx
 6I32rspLBE7FI02Wjyi5Bvjn8FJWhQ57yeZ3n1fkx2Q6Q9I3Ear2xcIutRgYPLLgFzA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=Pxiovy0N; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1061"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1061; helo=mail-pj1-x1061.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1061.google.com (mail-pj1-x1061.google.com
 [IPv6:2607:f8b0:4864:20::1061])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39121409A7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:37:56 +0000 (UTC)
Received: by mail-pj1-x1061.google.com with SMTP id
 98e67ed59e1d1-3ac9f49b984so60614a91.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223476; x=1793828276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GfEMni0XRSQbWis9KyNWEw4OzVz9r0CUnmI8j1ftEX4=;
 b=Cojk/xraEf4RzgFEYpYW0m+fd5WMlpyHJuJtS8tj4j4BO5kJhrfp7jaVKHgo1lVhTq
 U+a0KfBJwn2se3WvxgfYbIztSCAxzr6Im5xOHSgi0h1k4vGrnyqz4e+WgTAMBPGPyefY
 wAxynZWPPhOX4WC+V+N+psMsZYyyWVu78iVPiuhm/bx4+cm7jGwe4/pzlcXfiTEJoip2
 cAzNinlLcZGIX/2K+cZlsoM+8YNARajCMtTy+0kpBcYLX442U4GMRKoEH2X9ePWnPQRC
 DCa5xeJDx+wG2Gab/ZOP56FSN6Is4e3wUxYy7Xt6RJeFgsW4avrTeT7HW23fcVblbScq
 PRyQ==
X-Gm-Message-State: AFq9FYLAybJw54zBjlt0w7cyuJuteivnIamxBtZVvshJSmuadb9tktYc
 vENI7ZzIDrPyhs/s+4jQ+x8NsTgBchBU0L7AXzYszr7ZC2fglWplmdEhoCgbGcHzHfxJpDdx15I
 t7JrX95CYmui88Uj/NEBC9sQxZ5P6++dapSuCSp4LFqZfxjkID8DHnir+/nwYF0tJjWkDUqMRyW
 Jal7AD4Wev45NndkPFwJmuPrsRgnw7qcl/l/pCNnKSkHcaQcZG143fBMttQsOPcY4v6+qGOXFhU
 22mdajMHfDH3JfQHA==
X-Gm-Gg: AYBFou26V7o7gZ0EMbr27faqnJl1Scu3VWHSITT17+wPWJ0Fu6clqDcHvOlP748rN1q
 UZGck4Xl80ygBZtZq5Knb9bbp9+Q41GEW2n3OvNbWYD1XE/4dU3HbSrbndLvEVl6BxMYbjq2MVe
 DWasoxIaTTfKXh/5nEE863RWTwGVYhhBV4Wz4fRBQgn9manCtk3HqurK/GDG6o4lbN84q3sk+n4
 6Fea7K/rlLzDwMd+CxE3HAv20egcntU7RCYITxNOHxIbNKiHKu27P6diWkwSrFvEIs8T/WsKVPi
 Bv1mnV2p0oflRTimcKPNtJrRImn7AXjPoeGP3sUnyBnELFrLCobpjMYeDO9zwQVfkT6R6Ezv3m8
 4VIIk608r1Bz2eRjJON409SkL/Vv7C9fhWQBdoWwSXfFxrvzsdr99mKZyClMABA43LaRI96iSz/
 JhzMqSIL4r6Hi+ECOas1CYqRn62hFsGbU3j0KkTPCd
X-Received: by 2002:a17:90b:5624:b0:3a4:b509:88bd with SMTP id
 98e67ed59e1d1-3ae6ece0563mr383475a91.2.1793223475907; 
 Wed, 28 Oct 2026 14:37:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae6e84adc9sm526839a91.5.2026.10.28.14.37.55
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:37:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91c938148eeso1733816d6.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:37:55 -0700 (PDT)
X-Received: by 2002:a05:6214:ccf:b0:91c:7ae8:fa2c with SMTP id
 6a1803df08f44-91c90431fcfmr13524926d6.14.1793223474761; 
 Wed, 28 Oct 2026 14:37:54 -0700 (PDT)
X-Received: by 2002:a05:6214:ccf:b0:91c:7ae8:fa2c with SMTP id
 6a1803df08f44-91c90431fcfmr13524356d6.14.1793223474041; 
 Wed, 28 Oct 2026 14:37:54 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47a69129sm139827476d6.4.2026.10.28.14.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:37:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:22 -0700
Message-Id: <20261028213744.511429-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 01/23] package: prepare removal of <pkg>_DIR
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

As part of the out-of-tree mechanism introduction, we want to get rid
of the <pkg>_DIR variable, because it isn't clear whether it refers to
the source or build directory.

Therefore, we modify the package infrastructure to no longer use
<pkg>_DIR, but instead use <pkg>_SRCDIR or <pkg>_BUILDDIR where
appropriate.

Since some of the build steps now have their stamp files in the package
source directory, we also adjust the corresponding make rules.

There is one single stamp we take special care of: the dirclean one.
This stamp file is never created; it only serves to have a correct $(@D)
to be able to remove the package directory. What is really important in
fact is to remove the build directory, so that's where we move it into.

Note that at this point, $(BUILD_DIR) and $(SRC_DIR) still point to the
same directory, so this commit is really a no-op.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998@free.fr:
  - rebase on master
  - change the location of the dirclean stamp
  - expand commit log accordingly
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit a1048c500d134df5ba3d92be463e190ce7768274)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/pkg-generic.mk | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4e2ce2e7a09a..fe5200475504 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -171,7 +171,7 @@ endef
 ################################################################################
 
 # Retrieve the archive
-$(BUILD_DIR)/%/.stamp_downloaded:
+$(SRC_DIR)/%/.stamp_downloaded:
 	@$(call step_start,download)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
@@ -196,7 +196,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 	$(Q)touch $@
 
 # Retrieve actual source archive, e.g. for prebuilt external toolchains
-$(BUILD_DIR)/%/.stamp_actual_downloaded:
+$(SRC_DIR)/%/.stamp_actual_downloaded:
 	@$(call step_start,actual-download)
 	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL))
 	$(Q)mkdir -p $(@D)
@@ -204,7 +204,7 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
 	$(Q)touch $@
 
 # Unpack the archive
-$(BUILD_DIR)/%/.stamp_extracted:
+$(SRC_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_EXTRACT_DEPENDENCIES))
@@ -219,7 +219,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 
 # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
 # used.
-$(BUILD_DIR)/%/.stamp_rsynced:
+$(SRC_DIR)/%/.stamp_rsynced:
 	@$(call step_start,rsync)
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@mkdir -p $(@D)
@@ -231,7 +231,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	$(Q)touch $@
 
 # Patch
-$(BUILD_DIR)/%/.stamp_patched:
+$(SRC_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
@@ -836,19 +836,19 @@ $(2)_FINAL_RECURSIVE_RDEPENDENCIES = $$(sort \
 	$$($(2)_FINAL_RECURSIVE_RDEPENDENCIES__X))
 
 # define sub-target stamps
-$(2)_TARGET_INSTALL =           $$($(2)_DIR)/.stamp_installed
-$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
-$(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
-$(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
-$(2)_TARGET_INSTALL_HOST =	$$($(2)_DIR)/.stamp_host_installed
-$(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
-$(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
-$(2)_TARGET_RSYNC =		$$($(2)_DIR)/.stamp_rsynced
-$(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
-$(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
-$(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
-$(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_DIR)/.stamp_actual_downloaded
-$(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
+$(2)_TARGET_INSTALL =           $$($(2)_BUILDDIR)/.stamp_installed
+$(2)_TARGET_INSTALL_TARGET =	$$($(2)_BUILDDIR)/.stamp_target_installed
+$(2)_TARGET_INSTALL_STAGING =	$$($(2)_BUILDDIR)/.stamp_staging_installed
+$(2)_TARGET_INSTALL_IMAGES =	$$($(2)_BUILDDIR)/.stamp_images_installed
+$(2)_TARGET_INSTALL_HOST =	$$($(2)_BUILDDIR)/.stamp_host_installed
+$(2)_TARGET_BUILD =		$$($(2)_BUILDDIR)/.stamp_built
+$(2)_TARGET_CONFIGURE =		$$($(2)_BUILDDIR)/.stamp_configured
+$(2)_TARGET_RSYNC =		$$($(2)_SRCDIR)/.stamp_rsynced
+$(2)_TARGET_PATCH =		$$($(2)_SRCDIR)/.stamp_patched
+$(2)_TARGET_EXTRACT =		$$($(2)_SRCDIR)/.stamp_extracted
+$(2)_TARGET_SOURCE =		$$($(2)_SRCDIR)/.stamp_downloaded
+$(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_SRCDIR)/.stamp_actual_downloaded
+$(2)_TARGET_DIRCLEAN =		$$($(2)_BUILDDIR)/.stamp_dircleaned
 
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
@@ -1176,7 +1176,7 @@ else
 			$$$${f} \
 			$$($(2)_REDIST_SOURCES_DIR) || exit 1; \
 		printf "%s\n" "$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
-	done <$$($(2)_DIR)/.applied_patches_list
+	done <$$($(2)_SRCDIR)/.applied_patches_list
 endif # other packages
 
 endif # redistribute
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
