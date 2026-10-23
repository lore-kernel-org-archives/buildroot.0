Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE068606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IZZ9SQpk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C4A60A6E;
	Fri, 23 Oct 2026 21:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOMNxRW21Vtz; Fri, 23 Oct 2026 21:48:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 23AB860A77
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792113;
	b=DIiXnn6UaBxAZVXzzkvjyth1HHEyh23oSBBAZfqq4Ug10TOWb5CkMcy7WhUcTQMr5q5s
	 J4fHjh+CxCj8tutStM7LQG1QovzAAO//sZSf98cYUdhLjD7PvBOScsZx2Pjkonx/wNFN6
	 ydgr8TjRr4/3ucPyJrqBjWuYdQxEL+DmyWgX3gNHpx4t2G9W0yVaApv5W7P1CnqovRDOB
	 e8M+nBfnVZaGFcPFa9ApOouL2akVKWWeEDGCK9jcg+EncL3mK1QsQCRLgBIws6T4tRwV1
	 BNv8Qedw3zCptLMJbAj/qEv8a7rn/ZjhQWDJkAIeL2rjlOzNAePDaAWaefzycgCTEjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792113;
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
	bh=60gA6RBFV7W12dRyTJ4A1kStM1xOFgOEYemf6WUgvJg=;
	b=BOyu5z5PVmxpxyA/PEjqf10cUhpqAsY33X20QOUZHSJN3x578IaSsksDaPnbwfEWpYUs
	 89eEQjOfq+YByxFk4nvz6lEbbGJxEfzVCqqzPAbeJPEhbTNEHzJlpswgjGeHbx3bbcgcf
	 SZOjdtCsZ7msmxGCvwdrld8nHmNu4iAd7SteygDWzO+5AijOfxK/yRn4BCPGiR9LTbD8S
	 iZVYedVlW9GxRR8yWq64l4zIA4Xvz3xZ8rlrBUx2oUIZGHJ2T6Yh1A1P5ZvSo00NDiURR
	 dB8K7+n+Oc/C++VTnG12zZvU45U8q7a49n0hHasRvM7p4nWVB2504DcfEA1u2uhrMQg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792113;
	bh=60gA6RBFV7W12dRyTJ4A1kStM1xOFgOEYemf6WUgvJg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IZZ9SQpk6BV5RT46CxxdqiG2CgePrW9pi9NjlMRlqAnOjZoTxOb/viY+VEE6pojYN
	 UDRBtwgTOuRjAx9milA0hwCq/jpr5OxZEuGWjN0lSrpQ1BgtLnSoBFBNp5ebtXwa1u
	 4GjAu5q9sMtOHPE8fxHh7uv9poMiIb2H1FzKOfauQIifNWTTLV/8mO957eBQbl3s5S
	 yEfeLGBxSZciKwg0aLnU91B18erVoTP2VGkjbuyScDAwvcVhTJYDfmyZYlvGmfu/u8
	 QXFNLLVMDZsKNBA3LJlQBRQjXZ+ujNBsJBhDlCzWF+ux4/mdlrCDi3ud4A80EazSf1
	 xVHc+f+sLgnbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23AB860A77;
	Fri, 23 Oct 2026 21:48:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9D1D79F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CED540AB4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GyhHy3FA-Cp for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:48:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF76840ABD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792109;
 b=ZMGO4OKYN6LTOat0psQiJACyl0Js5ZgixIMrCwqX055lXs4l6oy/CrMM7WSLN0ynoKva
 N+chHNRx0vklnuxsqch0h6IrJE3nTJ3EThn8sn3kyjcxnmebk5G4RYL5/wWzvbCGngm6j
 +qF6PQKhSvGA6PuhoimFSh7rXP2tl+mXQuog+dz8q/ibLvaphl9LuPGD4KjjbIiLoPHv2
 9rEFMYK4yGnDEL1wE+q3N23PdGZ/w4ei012WLIGQeVF4wB4fXeYBJ6GWKFYB0OiKsv4e1
 97nNb0gyT73JlM1VjhLc8aQB3tFMJvmf0AoJMBAKhOZafsbf7e/I4RrZlZQgB0QM50g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792109;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=HkyVytjLpMAteehR+/x/lAqx7WSKmrLN8OxCDB8zAtw=;
 b=j+jK7FTSJyv7M/d39t5cSXzDNwCvS0wIM4uVk3ZDOYux46MqmEktG3vf7YDHYqH/Nvo8
 ChJpR9HsRoK8kksIiD9/GPk5Bmh8ftv9tPSB5Pb2ieS0fQopF0A5Mdwg5on4Gpzby9QVr
 u4w92LeCvpVwvpISru/vT4fhqgspXUbjfoDn3ZA8CPbi5CKPbHCS7RxVIkAmgCqli2gfC
 PhlKsh5lClgGoPhi/zSB7/YK4PiE/J8WYvmuqAwp6Nq+vTzV8G3MweFCifWyo2McMu0FJ
 BA/r4+wZ41ibtk+O7vyW3tcZzDnF+uW8M7psRucF5ZbkHc/CoFJh2KjZRWbQwPi6pXg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=MA46trJZ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::561"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::561; helo=mail-pg1-x561.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x561.google.com (mail-pg1-x561.google.com
 [IPv6:2607:f8b0:4864:20::561])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF76840ABD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:28 +0000 (UTC)
Received: by mail-pg1-x561.google.com with SMTP id
 41be03b00d2f7-cc4aa0246b7so602244a12.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792107; x=1793396907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HkyVytjLpMAteehR+/x/lAqx7WSKmrLN8OxCDB8zAtw=;
 b=sehBi2gmoezPO1QcvHWYARlgnWMK1ZGjZLq9KlVafAbZvMvr5kKZ2KcF5646tJYXZ9
 TpcGt6S+YsC/Azg6D1OhrrisKrmbZKoCZ0HY1guYqiz+79/mQqSFrDanmc7xBX1UpmB9
 Zur2iUkjHCgWtOGCDzpc9LjOUYvLcLlYEu7kMBW+Y0S15oq+mG8hGjBbsz+hiaqg8vX8
 n+LmZYP7dYu/FkjqC3B2zrq1+UE5gFgLDJ5YSfcMSEfgDV5Ep4R1OFOaGYIESoZqd+bZ
 8wciGRR/bfgXBjqoox4mC+F4BMM7+M8g5qgRbDl8hhoMlhpLpSrmp49AGtFfIa0LBm2t
 FY4A==
X-Gm-Message-State: AFq9FYLv8dxK8VSTmEYpNJw0MXSeOvLBMfKNCr3G+UaRmI2lwzBIiVhf
 xXr5ZFUNKxSgvJDJb1QrGN1k1xoXQnYWuSmtxeh6isOuohynWBfBV4LUgkhgjVtW3gv7Anyb0eU
 Sx2FgfOgqpz565JQOXyXhINJe+4/FdOPRDerOGNEy/V898vm4VM1xf+Y49f+1QQW2Q91aZViOHG
 q9r+fXTDJWZnhFQh0OotBqpPiaamQ8TdCRfJE1yMCZsoVmGaKn4IhTyDmiUnh9DpI53M3VAL8/m
 +z07s2HNNDDL0Ui+g==
X-Gm-Gg: AYBFou0jrZBqtxvZeYXkPDmQrSZISfvKccCbquWo+XRnKh3xJBKwIE2zpyvbk36z4zO
 1DGeZB9xp92e4BclZv8qAiMXWuaQP0N5htSrQyuSkkTK6NiZO3/4S9JphvnicJyaJKI9khduNjY
 vhU8UIMfw9L193ePOLcHQrr461oTW9GAI1QnLhqtT+wDsc1CiL8UxjetBnntod0cP4w+Tae7pIX
 4Bcalojtv4PnXDVFhTlg0VzElprjXAfTVZJC+WzL1Hh5GZ0BEAgFO10yYe9kP0HB2CyzeBaNtII
 rDfWRhU49NzhOd+Mg5NumjwvS0q4L/bCGQUB4trzRQwUn65fufOMBkIwsMKlJeXgaky076RefwN
 9o2IlzJkOJ+Sr2UWs0CdADUGavGa8AgQwnHcRM1ZsE727WZ84I11BVY9FL25Sx00W+IrH8/12n9
 o4EaKXkGpyVRLW4pB1HIQh2Sptw05b7h6yKfVjW8lMB4g=
X-Received: by 2002:a17:90b:2e10:b0:3ac:7c52:faf6 with SMTP id
 98e67ed59e1d1-3adea0b18dfmr334792a91.1.1792792107259; 
 Fri, 23 Oct 2026 14:48:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebaca71csm350718a91.3.2026.10.23.14.48.26
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:48:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso178260385a.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:801c:b0:93a:13aa:1b9 with SMTP id
 af79cd13be357-940ef939302mr50866685a.30.1792792105894; 
 Fri, 23 Oct 2026 14:48:25 -0700 (PDT)
X-Received: by 2002:a05:620a:801c:b0:93a:13aa:1b9 with SMTP id
 af79cd13be357-940ef939302mr50861485a.30.1792792105283; 
 Fri, 23 Oct 2026 14:48:25 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f066a5bcsm16398785a.13.2026.10.23.14.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:48:24 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:47:47 -0700
Message-Id: <20261023214807.2151753-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 03/23] package: fix <pkg>_SRCDIR and
 <pkg>_BUILDDIR values
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

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

WIP: review and complete the parts about the individual infras: cmake,
     autotools, luarock, kconfig...

Until now, <pkg>_SRCDIR and <pkg>_BUILDDIR were taking into account the
potential <pkg>_SUBDIR, which indicates that the configure script is not
at the root of the source directory, but in some subdirectory.

However, in preparation for the out-of-tree build of packages, we want
to get rid of the <pkg>_DIR definition (because <pkg>_DIR doesn't
explicit whether it's the source or build directory), so we want
<pkg>_SRCDIR and <pkg>_BUILDDIR to become the real locations of the
source and build directories, respectively. To do so, they no longer
take into account <pkg>_SUBDIR.

Instead, a separate <pkg>_SRCSUBDIR variable has been introduced, which
points to the sub-directory in which the configure script (or
CMakeLists.txt file) is.

The autotools infrastructure is fixed to used <pkg>_SRCSUBDIR instead of
PKG_SRCDIR.

The cmake infrastructure is fixed to use <pkg>_SRCSUBDIR everywhere,
even in places where it was using <pkg>_BUILDDIR. The reason is that
now, <pkg>_BUILDDIR doesn't take into account the <pkg>_SUBDIR. Of
course, later patches will fix the CMake infrastructure back to use a
separate build directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998@free.fr:
  - rebase on master
  - cmake already has its own BUILDDIR now
  - also convert the extract commands
  - also move the filelist step-hooks
  - convert pkg-kconfig and pkg-luarocks
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(cherry picked from commit 49b7c84d4a23fd562c0e054acea4e8ebdbd8cb41)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/pkg-autotools.mk | 20 +++++++++---------
 package/pkg-cmake.mk     |  8 ++++----
 package/pkg-generic.mk   |  9 ++++----
 package/pkg-kconfig.mk   | 44 ++++++++++++++++++++--------------------
 package/pkg-luarocks.mk  |  6 +++---
 5 files changed, 44 insertions(+), 43 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index bb65d639dff1..58b63317cb60 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -59,7 +59,7 @@ endef
 #
 define LIBTOOL_PATCH_HOOK
 	@$(call MESSAGE,"Patching libtool")
-	$(Q)for i in `find $($(PKG)_DIR) -name ltmain.sh`; do \
+	$(Q)for i in `find $($(PKG)_SRCSUBDIR) -name ltmain.sh`; do \
 		ltmain_version=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \
 		sed -e 's/\([0-9]*\.[0-9]*\).*/\1/' -e 's/\"//'`; \
 		ltmain_patchlevel=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \
@@ -92,7 +92,7 @@ endef
 #
 define CONFIGURE_FIX_POWERPC64_HOOK
 	@$(call MESSAGE,"Checking configure (powerpc64/powerpc64le)")
-	support/scripts/fix-configure-powerpc64.sh $($(PKG)_DIR)
+	support/scripts/fix-configure-powerpc64.sh $($(PKG)_SRCSUBDIR)
 endef
 
 #
@@ -100,7 +100,7 @@ endef
 #
 define AUTORECONF_HOOK
 	@$(call MESSAGE,"Autoreconfiguring")
-	$(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
+	$(Q)cd $($(PKG)_SRCSUBDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
 endef
 
 ################################################################################
@@ -171,7 +171,7 @@ ifeq ($(4),target)
 
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
-	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache && \
+	(cd $$($$(PKG)_SRCSUBDIR) && rm -rf config.cache && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$(TARGET_CONFIGURE_ARGS) \
 	$$($$(PKG)_CONF_ENV) \
@@ -206,7 +206,7 @@ else
 # because it often relies on host tools which may or may not be
 # installed.
 define $(2)_CONFIGURE_CMDS
-	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
+	(cd $$($$(PKG)_SRCSUBDIR) && rm -rf config.cache; \
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) \
 	CONFIG_SITE=/dev/null \
@@ -272,11 +272,11 @@ endif
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCSUBDIR)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCSUBDIR)
 endef
 endif
 endif
@@ -287,7 +287,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_SRCDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_SRCSUBDIR)
 endef
 endif
 
@@ -297,7 +297,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_SRCSUBDIR)
 endef
 endif
 
@@ -307,7 +307,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_SRCSUBDIR)
 endef
 endif
 
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index f572bdebb3da..d0dcdfbd50fd 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -57,9 +57,9 @@ $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 $(3)_CMAKE_BACKEND ?= make
 
 ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
-$(2)_BUILDDIR			= $$($(2)_SRCDIR)
+$(2)_BUILDDIR			= $$($(2)_SRCSUBDIR)
 else
-$(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
+$(2)_BUILDDIR			= $$($(2)_SRCSUBDIR)/buildroot-build
 endif
 
 ifeq ($$($(3)_CMAKE_BACKEND),make)
@@ -103,7 +103,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$(if $$(BR2_INSTALL_LIBSTDCPP),,CXX=/bin/false) \
-	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
+	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCSUBDIR) \
 		-G$$($$(PKG)_GENERATOR) \
 		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
@@ -135,7 +135,7 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_LIBDIR="$$(HOST_DIR)/lib/pkgconfig:$$(HOST_DIR)/share/pkgconfig" \
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
+	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCSUBDIR) \
 		-G$$($$(PKG)_GENERATOR) \
 		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fe5200475504..138fe9ccef4f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -558,8 +558,9 @@ ifndef $(2)_STRIP_COMPONENTS
  endif
 endif
 
-$(2)_SRCDIR		       = $$($(2)_DIR)/$$($(2)_SUBDIR)
-$(2)_BUILDDIR		       ?= $$($(2)_SRCDIR)
+$(2)_SRCDIR = $$($(2)_DIR)
+$(2)_BUILDDIR = $$($(2)_DIR)
+$(2)_SRCSUBDIR = $$($(2)_SRCDIR)/$$($(2)_SUBDIR)
 
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
@@ -854,7 +855,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_BUILDDIR)/.stamp_dircleaned
 $(2)_EXTRACT_CMDS ?= \
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$($(2)_DL_DIR)/$$($(2)_SOURCE) | \
 	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
-		-C $$($(2)_DIR) \
+		-C $$($(2)_SRCDIR) \
 		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
 		$$(TAR_OPTIONS) -)
 
@@ -1141,7 +1142,7 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
 	$(Q)$$(call legal-warning-pkg,$$($(2)_BASENAME_RAW),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$(F),$$($(2)_DIR)/$$(F),$$($(2)_HASH_FILES))$$(sep))
+	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$(F),$$($(2)_SRCDIR)/$$(F),$$($(2)_HASH_FILES))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 8000de16c49e..8a63d55be033 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -23,8 +23,8 @@ define kconfig-package-update-config
 		exit 1; \
 	fi
 	$(Q)mkdir -p $(dir $($(PKG)_KCONFIG_FILE))
-	cp -f $($(PKG)_DIR)/$(1) $($(PKG)_KCONFIG_FILE)
-	$(Q)touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_STAMP_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
+	cp -f $($(PKG)_BUILDDIR)/$(1) $($(PKG)_KCONFIG_FILE)
+	$(Q)touch --reference $($(PKG)_BUILDDIR)/$($(PKG)_KCONFIG_STAMP_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
 endef
 
 PKG_KCONFIG_COMMON_OPTS = \
@@ -117,8 +117,8 @@ endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets.
-# Note: this must be done _before_ attempting to use $$($(2)_DIR) in a
-# dependency expression
+# Note: this must be done _before_ attempting to use either $$($(2)_SRCDIR)
+# or $$($(2)_BUILDDIR) in a dependency expression
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
 # Do not use $(2)_KCONFIG_DOTCONFIG as stamp file, because the package
@@ -148,23 +148,23 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 	done
 
 $(2)_KCONFIG_MAKE = \
-	$$($(2)_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_DIR) \
+	$$($(2)_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_BUILDDIR) \
 		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS)
 
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first.
-$$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+$$($(2)_BUILDDIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(call prepare-per-package-directory,$$($(2)_KCONFIG_DEPENDENCIES))
 	$$(call kconfig-package-merge-config,$(2),$$(@D)/$$($(2)_KCONFIG_DOTCONFIG),\
 		$$($(2)_KCONFIG_FRAGMENT_FILES))
-	$$(Q)touch $$(@D)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
+	$$(Q)touch $$($(2)_BUILDDIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
 # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
 # it explicitly. It doesn't hurt to always have it though.
-$$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): | $(1)-patch
+$$($(2)_BUILDDIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): | $(1)-patch
 
 # Some packages may need additional tools to be present by the time their
 # kconfig structure is parsed (e.g. the linux kernel may need to call to
@@ -176,21 +176,21 @@ $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): | $$($(2)_KCONFIG_DEPENDENCIES)
 define $(2)_FIXUP_DOT_CONFIG
 	$$($(2)_KCONFIG_FIXUP_CMDS)
 	$$(call kconfig-package-regen-dot-config,$(2))
-	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	$$(Q)touch $$($(2)_BUILDDIR)/.stamp_kconfig_fixup_done
 endef
 
-$$($(2)_DIR)/.stamp_kconfig_fixup_done: PKG=$(2)
-$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
+$$($(2)_BUILDDIR)/.stamp_kconfig_fixup_done: PKG=$(2)
+$$($(2)_BUILDDIR)/.stamp_kconfig_fixup_done: $$($(2)_BUILDDIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 	$$($(2)_FIXUP_DOT_CONFIG)
 
 # Before running configure, the configuration file should be present and fixed
-$$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
+$$($(2)_TARGET_CONFIGURE): $$($(2)_BUILDDIR)/.stamp_kconfig_fixup_done
 
 # Force olddefconfig again on -reconfigure
 $(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
 
 $(1)-clean-kconfig-for-reconfigure:
-	rm -f $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
+	rm -f $$($(2)_BUILDDIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 
 # Only enable the foo-*config targets when the package is actually enabled.
 # Note: the variable $(2)_KCONFIG_VAR is not related to the kconfig
@@ -236,18 +236,18 @@ $(2)_CONFIGURATOR_MAKE_ENV = \
 # with a stamp-like file which path is in the package build dir, so we
 # end up having a valid @D.
 #
-$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%
-$$($(2)_DIR)/.kconfig_editor_%: PKG=$(2)
-$$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
-	$$($(2)_CONFIGURATOR_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_DIR) \
+$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_BUILDDIR)/.kconfig_editor_%
+$$($(2)_BUILDDIR)/.kconfig_editor_%: PKG=$(2)
+$$($(2)_BUILDDIR)/.kconfig_editor_%: $$($(2)_BUILDDIR)/.stamp_kconfig_fixup_done
+	$$($(2)_CONFIGURATOR_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_BUILDDIR) \
 		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS) $$(*)
-	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
-	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
+	rm -f $$($(2)_BUILDDIR)/.stamp_{kconfig_fixup_done,configured,built}
+	rm -f $$($(2)_BUILDDIR)/.stamp_{target,staging,images}_installed
 	$$($(2)_FIXUP_DOT_CONFIG)
 
 # Saving back the configuration
 #
-# Ideally, that should directly depend on $$($(2)_DIR)/.stamp_kconfig_fixup_done,
+# Ideally, that should directly depend on $$($(2)_BUILDDIR)/.stamp_kconfig_fixup_done,
 # but that breaks the use-case in PR-8156 (from a clean tree):
 #   make menuconfig           <- enable kernel, use an in-tree defconfig, save and exit
 #   make linux-menuconfig     <- enable/disable whatever option, save and exit
@@ -262,7 +262,7 @@ $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 # Instead, we use a PHONY rule that will catch that situation.
 #
 $(1)-check-configuration-done:
-	@if [ ! -f $$($(2)_DIR)/.stamp_kconfig_fixup_done ]; then \
+	@if [ ! -f $$($(2)_BUILDDIR)/.stamp_kconfig_fixup_done ]; then \
 		echo "$(1) is not yet configured"; \
 		exit 1; \
 	fi
@@ -316,7 +316,7 @@ endif # package enabled
 .PHONY: \
 	$(1)-diff-config \
 	$(1)-check-configuration-done \
-	$$($(2)_DIR)/.kconfig_editor_% \
+	$$($(2)_BUILDDIR)/.kconfig_editor_% \
 	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
 
 endef # inner-kconfig-package
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index fd798558785c..abcd525fcf8a 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -96,10 +96,10 @@ $(2)_EXTRACT_DEPENDENCIES += host-luarocks
 #
 ifndef $(2)_EXTRACT_CMDS
 define $(2)_EXTRACT_CMDS
-	mkdir -p $$($(2)_DIR)/luarocks-extract
-	cd $$($(2)_DIR)/luarocks-extract && \
+	mkdir -p $$($(2)_SRCDIR)/luarocks-extract
+	cd $$($(2)_SRCDIR)/luarocks-extract && \
 		$$(LUAROCKS_RUN_CMD) unpack --force $$($(2)_DL_DIR)/$$($(2)_SOURCE)
-	mv $$($(2)_DIR)/luarocks-extract/*/* $$($(2)_DIR)
+	mv $$($(2)_SRCDIR)/luarocks-extract/*/* $$($(2)_SRCDIR)
 endef
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
