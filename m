Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A9F606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MR73w0io
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C99940AB2;
	Fri, 23 Oct 2026 21:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7J8-Hbp4ho2; Fri, 23 Oct 2026 21:52:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2F31B40AB3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792326;
	b=IvarOGhM4VrbR/K2oluq4+7HutPc1uUS/ej4wfPIfCRLJWHUQRMoXmK8D/HYKnFijCFo
	 Qg6lp1sJp+UuPZPDobUvp+yMG0Opc4bwgjAHCN7rmBXt9C9pLHJ/gqwPy0+xanxmz0bTN
	 oFG1mUHpKEl/pSqBM2z1/XkUFPRRUQiPiycUASgx94GFAGD+bbVuI4q9xidoKgDCwn0X2
	 Gtw/6u7AeAn3LLozpPJ3D4Mli9lYShs0pgxi3NZ7vNuA/G4l7Gf5WcteBWyqUjuLqzhHs
	 2CMRjxAgTICNCXiitOR3UJWU5PzQqR4C/3NU+q6BUeM6hDpu0IJmcGbHohTDAQaIqdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792326;
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
	bh=X1YwXVFQagvJ/DILG309l/R+EfCde3T6rSA8QkOdy7c=;
	b=Y7gMVrqLzPIudeYpBKJAnHy4z+4r7lWmg+TQ2DQ2Ua+uX4nvM9bl9QRE+w4lSTAN9NYk
	 bTJx68Az888KB/r7+cSQgxpDC6UhLpIvp8+B+ah4IKR3vIFzY2CU64qaq+IjUp3LpQK0W
	 lRVb+wFuX0fUYfQ/0j4WC2sv6Vw/6OP+BiqSfARZl1bEraosJ7ExF7ZBa7jVVjeD8VxYr
	 vwXYVaM04PwDVuMVY8IwSYE8Uhj/cqgzHSUi+A/tHjhylYCT0sdVj2Zi0axbX62MLdAPi
	 zeJ1Kj8UFbpdMtFEqWbT/awCa+3Yu+jCYY1//pAvzuJzJUYnelc5Jc+w1f8gEBfrJWg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792326;
	bh=X1YwXVFQagvJ/DILG309l/R+EfCde3T6rSA8QkOdy7c=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=MR73w0iolE4AindEBrAf14PylV6jD843Yf06W5pejHbQV5eBFOjy4YaNlKxjmrQLa
	 Kqs+kmmRky/Zi/pM/0jbZNwY89GHsd5j4VSIP8jmg+V0zpojka8mv4R9vxRCavFuHJ
	 KAOLkOawmKj2nvEPSJBJSiIqkv7DhFU6HlYhNulWG8rfahR/3GcIul40OyaR8LzZM8
	 2aR+fTVJupBfBZcLArBlHf91rKzWLZMWYOR8aEqzRjS+HztCi4FzPbndwx+mINTjzI
	 AhFyuPg68M99hr0MRi5FbzNEmMXYw1ziAQqemX83QqktpGYYW2Qp0SeTAPLoraHk6z
	 iy4j27HMHJrUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F31B40AB3;
	Fri, 23 Oct 2026 21:52:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEE2B3D9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4B438168A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZBWf3A-2DCC for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C5C848168B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792322;
 b=PPfp0t18TXo7rYUPZQ06l5B2omGFAHTp4MXTbpOXsOBinT/ANsHhRiILhosouT47XON7
 Q8AqobWeoEwNUSlFem/6pVF1Emxl/h9Ga7xamNEcEdK3XoGA6XZDyHf4/616jLnoYZ+oc
 tBY3OZB5N7B/ACzC7c4Ba9FVRDBMsoaTXA2FESbbgAyRVn/9Lp12RnrA6qHU8LAhKKAUY
 ZLeNbWFENealTNY7UHcjibDOVtbFeuC/3USWj9N6xQdeIdCZcLNxuwtVVa4Js41JJJ8dk
 tuBxumeOag2aqICbQ8bPBOXMnECEiLKeZJewTlpxxqJKUg/DF0hCp0o0P7f7SNJM24g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792322;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=BRLa4Ph82sT8B51mrhqM6bVi9+vWHnch6wdQ9hS97ok=;
 b=S78QJZ2o43GtXeWpWNeU9LVMqeLQq4srZS4sxEoqEn5bO0dscX8fyUwGljNuDg7sZMYI
 s7Xi0cGw8oMN41ILBDa6bY84bI3z8nIwUa0QybYDWFqkZ7qKmzO4GfrT1ouqRILnz+6fR
 HTeXOFXnh4eK3hqfsgZZFnjNUoWE201SDP/yeWIo2NwPfZQdDSXkVBuG2/AWjmE0eYXnQ
 AHo2ZCXY4p/BqPmE00RNbKUFCgqhveLKPl6rEv4ahJgezrzsHZcOjMSnoSZRgCMDFb5eY
 5QkNRyMT5eQDKHoOakO8G+LOcdShDqrCGkMlCv32E1AZTtl13Wzy6zBOmZzZ8+UpFFQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b="HOL/AIWH"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::562"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::562; helo=mail-pg1-x562.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x562.google.com (mail-pg1-x562.google.com
 [IPv6:2607:f8b0:4864:20::562])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5C848168B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:02 +0000 (UTC)
Received: by mail-pg1-x562.google.com with SMTP id
 41be03b00d2f7-cd60c5da24cso768407a12.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792322; x=1793397122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BRLa4Ph82sT8B51mrhqM6bVi9+vWHnch6wdQ9hS97ok=;
 b=H1RwRZWFBsRqjfk4Nzu+LO5K7qeoxV4ULBgIexuZIjIUHSF/GA9W/wkFbk628D52Gv
 Ej1pJY5ZQINie7OmhEv1e9Ol3BtxGNlzw7p151wrUguhmqct6gm3qknOo/zOckIrn7H/
 jwK9DEoQzXxH9iV/4JPb431kjj+qswlYAewiMbNbHJhsw9ZL62flAN7f++eHJgeDt7JM
 EPpYrYuBqg9LUMH49ca+ADiJpo7g3BXOhmz2RAbtaMl+qDX2P3y4EZffUrxRFQY4E9pl
 VpQAuw5sFqjfQr9p0rtz1JWoq2b2FpeyJdNBehvRw0YOMC4bDLjQ33ePHVMMh7uzP2Da
 9LZw==
X-Gm-Message-State: AFq9FYI+Li8XbDyfQr7DojoEqSJf7g48HeUO2ZRSNQktsxfl0jOQna7c
 cuZZoZ/H4GTdvQQ/JAH7NEOYCwqlFBYvVEOux7yPLCBVo1gxELIbkvxgz5j6ZfVCTZrunovNraK
 XR+Tj1dejWE4/SfNZCC1JNspeY5HD2yYC5zoT2sDoq8VOACsSFClHcD3iTd08kk8m6MITnMf1Y3
 FTb7x+/rHP145q2hjoNAezN3U7fGjmndtTgUpuH1H8Cal0pplnue8wSK68TIZr3Nn2M9f9FE6cl
 NAFeBPlmoz2IxFhLg==
X-Gm-Gg: AYBFou3q2xfavmF8kgJAlg/CUtb3igsxn0wtzHfuBqM+VYXpC5mjhENYczo2rXN7OrM
 momkYltVROrpd6bp5lLd7OAdNOtfU8v7G+IQEmfR5nAilTdaCETrQhfo9Cqcpu4EkpvTTvdHHYe
 E7iDnczANT8wXmn1GDd7rwWXTwO5dth6ppchd0CBR866QgKwxbzmUne9jfy1q7aBB8OJymV8vtd
 O/wlbyOrw8HRBIh5aNYOQ4ZO3uK4ny3wzBVKEv8m33j9df8m2sU2ntFpgz4fSSvF6nTPVe29pNB
 Qpj4Jhi8jRzxe3USNAN8HqDQyQJkRmP4N8vA27cu8q5GacVu/P9p1tHn3hC6ar9c6qGDOwlMFq/
 9UN6WKsP5Tjkmh+YyolnVzbNmoSQMeo0pwY3GA1umtyzGC1ziZw5jEHsijwhfRU3WarqpvsVHSz
 k6SsskimrM7VU4LFYBMuTpLLT4pDgjlTz0mi5OU0kA
X-Received: by 2002:a17:90b:4d06:b0:3ac:7f4c:a68c with SMTP id
 98e67ed59e1d1-3adeb0ff8d0mr481333a91.49.1792792321614; 
 Fri, 23 Oct 2026 14:52:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebb0aec5sm356568a91.8.2026.10.23.14.52.01
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-341eff9e381so3405752eec.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:00 -0700 (PDT)
X-Received: by 2002:a05:7301:4543:b0:369:a113:7560 with SMTP id
 5a478bee46e88-369e86249f2mr711400eec.41.1792792309625; 
 Fri, 23 Oct 2026 14:51:49 -0700 (PDT)
X-Received: by 2002:a05:7301:4543:b0:369:a113:7560 with SMTP id
 5a478bee46e88-369e86249f2mr711304eec.41.1792792307983; 
 Fri, 23 Oct 2026 14:51:47 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:51:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:24 -0700
Message-Id: <20261023215138.2301146-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 09/23] linux: build out of tree when
 LINUX_OVERRIDE_SRCDIR is set
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

Introduce <pkg>_SUPPORTS_OUT_OF_TREE. For a package that sets it and
has <pkg>_OVERRIDE_SRCDIR defined:

 - <pkg>_SRCDIR is the overridden directory, used in place: nothing is
   rsynced into $(BUILD_DIR), only the pre/post rsync hooks still run;
 - the source-related stamp files (rsynced, patched, ...) live in the
   build directory so that nothing is created in the user's tree;
 - kconfig packages start from the source directory with O=<builddir>,
   which makes kbuild generate its wrapper Makefile in the build
   directory, so that all the existing -C $(LINUX_DIR) invocations keep
   working unmodified.

Enable it for the Linux kernel. The source tree must be clean (no
in-tree .config, include/config, arch/*/include/generated).

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 linux/linux.mk         |  4 ++++
 package/pkg-generic.mk | 30 ++++++++++++++++++++++--------
 package/pkg-kconfig.mk |  6 +++++-
 3 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a90e09afe906..ffec32154222 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -6,6 +6,10 @@
 
 LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPL-2.0
+
+# When LINUX_OVERRIDE_SRCDIR is set, build out of tree: no rsync of the
+# sources, the kernel is built in $(BUILD_DIR)/linux-custom with O=.
+LINUX_SUPPORTS_OUT_OF_TREE = YES
 LINUX_LICENSE_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_LICENSE_FILES))
 
 LINUX_CPE_ID_VENDOR = linux
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 138fe9ccef4f..c8f532e1c3e6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -221,11 +221,11 @@ $(SRC_DIR)/%/.stamp_extracted:
 # used.
 $(SRC_DIR)/%/.stamp_rsynced:
 	@$(call step_start,rsync)
-	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
+	@$(call MESSAGE,"$(if $($(PKG)_OUT_OF_TREE),Using out-of-tree source dir,Syncing from source dir) $(SRCDIR)")
 	@mkdir -p $(@D)
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au --chmod=u=rwX,go=rX $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
+	$(if $($(PKG)_OUT_OF_TREE),,rsync -au --chmod=u=rwX,go=rX $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D))
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@$(call step_end,rsync)
 	$(Q)touch $@
@@ -559,13 +559,27 @@ ifndef $(2)_STRIP_COMPONENTS
 endif
 
 $(2)_SRCDIR = $$($(2)_DIR)
-$(2)_BUILDDIR = $$($(2)_DIR)
+$(2)_BUILDDIR ?= $$($(2)_DIR)
 $(2)_SRCSUBDIR = $$($(2)_SRCDIR)/$$($(2)_SUBDIR)
 
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
 endif
 
+# Packages that set <pkg>_SUPPORTS_OUT_OF_TREE = YES can be built out of
+# tree when their source directory is overridden: the sources are used
+# where they are (no rsync), and only the build directory lives in
+# $(BUILD_DIR). The source-related stamp files must then not be created
+# in the (user-owned) source directory, so they live in the build directory.
+$(2)_STAMP_SRCDIR = $$($(2)_SRCDIR)
+ifneq ($$($(2)_OVERRIDE_SRCDIR),)
+ifeq ($$($(3)_SUPPORTS_OUT_OF_TREE),YES)
+$(2)_OUT_OF_TREE = YES
+$(2)_SRCDIR = $$(abspath $$(call qstrip,$$($(2)_OVERRIDE_SRCDIR)))
+$(2)_STAMP_SRCDIR = $$($(2)_BUILDDIR)
+endif
+endif
+
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
@@ -844,11 +858,11 @@ $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_BUILDDIR)/.stamp_images_installed
 $(2)_TARGET_INSTALL_HOST =	$$($(2)_BUILDDIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_BUILDDIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_BUILDDIR)/.stamp_configured
-$(2)_TARGET_RSYNC =		$$($(2)_SRCDIR)/.stamp_rsynced
-$(2)_TARGET_PATCH =		$$($(2)_SRCDIR)/.stamp_patched
-$(2)_TARGET_EXTRACT =		$$($(2)_SRCDIR)/.stamp_extracted
-$(2)_TARGET_SOURCE =		$$($(2)_SRCDIR)/.stamp_downloaded
-$(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_SRCDIR)/.stamp_actual_downloaded
+$(2)_TARGET_RSYNC =		$$($(2)_STAMP_SRCDIR)/.stamp_rsynced
+$(2)_TARGET_PATCH =		$$($(2)_STAMP_SRCDIR)/.stamp_patched
+$(2)_TARGET_EXTRACT =		$$($(2)_STAMP_SRCDIR)/.stamp_extracted
+$(2)_TARGET_SOURCE =		$$($(2)_STAMP_SRCDIR)/.stamp_downloaded
+$(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_STAMP_SRCDIR)/.stamp_actual_downloaded
 $(2)_TARGET_DIRCLEAN =		$$($(2)_BUILDDIR)/.stamp_dircleaned
 
 # default extract command
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 8a63d55be033..5e46c62c58e6 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -147,8 +147,12 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 		fi; \
 	done
 
+# For an out-of-tree build, the first kconfig run is what creates the
+# wrapper Makefile in the build directory, so it must be started from
+# the source directory.
 $(2)_KCONFIG_MAKE = \
-	$$($(2)_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_BUILDDIR) \
+	$$($(2)_MAKE_ENV) $$($(2)_MAKE) \
+	$$(if $$($(2)_OUT_OF_TREE),-C $$($(2)_SRCDIR) O=$$($(2)_BUILDDIR),-C $$($(2)_BUILDDIR)) \
 		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS)
 
 # The specified source configuration file and any additional configuration file
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
