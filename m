Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF99F606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UmBMGPzv
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D9E40AB1;
	Fri, 23 Oct 2026 21:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5AzlYpV093L; Fri, 23 Oct 2026 21:48:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5F1B040AB2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792106;
	b=rPRL55yc8GaEkzVBBngXB4YHoUvYmXG9wMxI1r+/WswymdnFc6ggeT/dKBnwny1wcfOY
	 rnibd+C6hNh5t5GOH/stjlgQM/giZBeMDsJuLJQQhhitwOyUY2qqYkMo86cdyI6xEjcL8
	 DRnSnacFX1ePXaTneZp+32uwVRSDdtIbSu3kPW/JVWCDsWATjjqwI51Hc0/IrV0X8aXFi
	 BxlaKBZG0dtukLDOZGwRGMZ0IQafJ+qvI2fpFw71sMt+u9C+l4Riuya0S89VNR3cUuf9w
	 bV7hAzUcqtwTBPpymw/cDGTmKvUNKc6UH8dYj1ICNyeReY36/YKI3wdzG4LqdQ28U/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792106;
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
	b=m1DvN0igVVL9u/n9xP1zeCjdwteSiuTPWhwsN/iSeMTA0qvcUfEGi9cpyCdrB1+vwPtS
	 eJA4LPMeB+juhhhcreXNZoznZ6hSmlZ8VkASrPGqBTXj7bhmsKENwnMbG+QoRh+EgCz4n
	 gnHRf9usaAZBQI2AWRWt3DE2RzJtzORVKJoAtPqBA7nRxFAHWbCd3iF+1gqrLQJTJk0O8
	 d+CNl6UpgkfZS0HPj2LbhFRNEEmIp1BNJSDe0frdZfoXq1Zqo3rdsG2KG6IffVrRRLoWO
	 90pjG6twvk70NaavnNNPgMK3/YFreFtl1oJhD9Lju5kR+bfSWbUAyEMMbqMceLhdDbQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792106;
	bh=EVfR14hsNO8wDVfCTaBChoo/+U5Ti2Oq1LHMi/cnorI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=UmBMGPzvzkDljTWl3Pc+v00ou0wnwDMk2hzlO/UhAVlq9GZb8+6U9WlD2JFT+DZ2Q
	 kHHXkGbtSdzM44z50pwxNE+6BVgH1e1MFLIUym1p+iGjl6gaAd6mPDTQaRLrmp6Gaw
	 AvUm26q9dZGkyMup5oICccqLfxVLjDO+s0BwkZ2TE+yBEaFtzthQot/+L+5OEJqB/E
	 2LfQz1X4RotN39SCcgiW/3e1tGS1L8k5MnHhyXLHd03Vkn7NrdI7NLZe//Pz5phYxB
	 mvs9FzdUOPGxSxGvS+EYSKhmOg896aAkeJCQREXd7LAiutNUO/TmImZE+ToIUWrYPp
	 1vx0sHSaAKuLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F1B040AB2;
	Fri, 23 Oct 2026 21:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9169C79F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ECB98168A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKRm2rfMrpVO for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:48:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4BC9280AC8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792102;
 b=SDN566z9IxXLhizAUBruIQE+Z+cZC9Wb0gNSuCdNCbzlgA6dG0tp62tcWLSd45zVcOBa
 g6LZC6ALEFWe9jtTtN7RoxKVHGzlNfSzzMwhELjNvS6oP15r2/7uTDIDgDDx1DR0ORZHc
 DqT7mGLMNCAiP27NqmLW0xP1pEfQtY/hyLs9fFl/v6H9XD6g4dbIdLbffp8ad38Vck58I
 fjptsP/vQiEupWR2t4kiJxpty2qIrHm2epZLD4DIZSFKetaHN0tFK/S08eyiGkcjDaQMq
 ovHpvyRRaCNks7I2iYDUIHDJf3/gIYlOg2rbtVXNBQLrjeg1eNC5Jf9apwC2GOhb4pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792102;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=GfEMni0XRSQbWis9KyNWEw4OzVz9r0CUnmI8j1ftEX4=;
 b=s9B2AAfEZJUclsPu3AuS9XG+AXOz+35irOT3mkzqNKCqEGR3XpVIRkHxpYzi2WdUEECH
 HVdGmxiTS0eahFcoeA5qyjjcJH6dWorK5ua3l/fWM3P0mlDwhkotVJl0emLMCWc7J4tGx
 6LNRznG4qHi8lrkJB4gGyvL5GYKg+W91iI7KoScQGr3TrjZBXAw6SStfnLXGI3H7NSw6P
 wwz9bsrgO3NS+92o3JuyWgIM/ebUZmYJUyOomcIAU17jOhH2VLyxfVD9Wvt3ZT6iovK+d
 6O9GnibT3v0qswE89EO4qFFbS3S++5vDN/PTIGNYkxlU5rD3Nhs+YsujhAJWge6IAXQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=UVorwEgc; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::562"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::562; helo=mail-pg1-x562.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x562.google.com (mail-pg1-x562.google.com
 [IPv6:2607:f8b0:4864:20::562])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BC9280AC8
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:21 +0000 (UTC)
Received: by mail-pg1-x562.google.com with SMTP id
 41be03b00d2f7-cc1c9879395so503646a12.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792101; x=1793396901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GfEMni0XRSQbWis9KyNWEw4OzVz9r0CUnmI8j1ftEX4=;
 b=KO2smGa0vFJZO8Kf27rMkkhOsMn/tfosQyrUGLQFkYdLhuPtm51otLzhcohbw2P382
 n6FDEI9gD+0+5HHZogw3aEcJEp2/qgk2ZRBM/1Ls/HwrcwO6UGHKWR3H0CxJRUD3QCon
 uloD3QkDCHbPukV9OTd9RRE6FVjhtsbIaFvrJiMSpGbQRB0tsKpzN3JIkQg3WdU6E91d
 P2fcu/OzJNWXdQaSgAqdTjkBb22QNYvtRANHzYReOGo1oEmV9OcRv+oPifITeTkO76CI
 6SpzsO7HgWA0+aF6gLXEOXbEG5ThfqMD9Yp5EwKs5Eh3gx0YBTlQW7L9tkKmKrG2hcDS
 gu3w==
X-Gm-Message-State: AFq9FYITSSFuV3bn7D1LoeoJ/Cs/3lIHVw1g7ZEwSGfGi/LIslzQ/sFK
 +t9tDWVNKK7kQx8op+maimQUU3SJX+xXpKWbllG78cAETCR/gQJKUZcBaE+0wUyJUyjofG6iT9+
 Y62OwhtjxceT8GL0eeL+7H374UlpcdgAMi81gzTVjqXiVjIqJMoqci35sE1rKGO+bbnvR5Y6s+g
 KwRMLdQWeckdNQyx7KRWoHxbfGo8EpX+h+Oww7DMo9MWy/nswK7fg4bklZdciTSrb04KN+RtDMD
 ca0KttgyxGjjvwd0gT2
X-Gm-Gg: AYBFou0eFobKJ7DupSMRkLlddgDHJP9h5jbC/G9cph3R1bzugnCU3P0jw+yQmhm/ENj
 imXPZbUrb45ZyX+UpxSssmpI2CjneFQqjfo8i6C2ztcYa657LUypVPvAerdxLSb6oftA5vw2sxk
 49Nc0mOwFg9Qij+EKl8/n05aUzz28cmcSx0A36mM8RPwZlPXOpjy3XHAdk4EAxtzEAu98GYMGn1
 KsxN378AnUm3Vg0iN5+Hgxq5ckHF86FpR6gqTU75f+2fxv5KmYxjngkozr+veKrV81goMol//6j
 gi6zYE6m4Q64e2zuQAWu5yC85dlfolm8GQBUgALfZZGnnTozstd6hdPCE29bSIsNG40ZR6MaOGd
 +Pe0L71k+FUh1Ht92ibJCefnSX8CSWC553qySGYoB0EsYZSidne9Y7WkMF5MybBMSO7+QYS/zdH
 P6l3vPCgU3KU6hleWt+JdZ/kb6PoqU3C5VeZdbEwAM
X-Received: by 2002:a17:90b:528c:b0:3a0:e4ce:31fd with SMTP id
 98e67ed59e1d1-3adead444ecmr442011a91.10.1792792100919; 
 Fri, 23 Oct 2026 14:48:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adeba1bd56sm360283a91.2.2026.10.23.14.48.20
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:48:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93ca9b53afaso406050785a.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93e:c12c:f149 with SMTP id
 af79cd13be357-940ef95fa20mr51537485a.83.1792792099523; 
 Fri, 23 Oct 2026 14:48:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93e:c12c:f149 with SMTP id
 af79cd13be357-940ef95fa20mr51532885a.83.1792792099043; 
 Fri, 23 Oct 2026 14:48:19 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f066a5bcsm16398785a.13.2026.10.23.14.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:48:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:47:45 -0700
Message-Id: <20261023214807.2151753-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 01/23] package: prepare removal of <pkg>_DIR
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
