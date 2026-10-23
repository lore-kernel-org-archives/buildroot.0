Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D8606A324
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YaQoKNOV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A16960618;
	Fri, 23 Oct 2026 21:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_NXs6iCCKsL; Fri, 23 Oct 2026 21:52:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E6E5C60A4C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792325;
	b=ADeTbwtV7OOcZXRpnWEBgHz5rGDJksFlIp5K/NIOU8KZWaO78mZf92fz/DFEvLKW9nPH
	 DNqC56dQSpIfuB+INJYdL6SP3mvi2f+q6KYfX66V9Bhk/0V+pVmfveZQEvoARYZrRQ4wt
	 gR+gyBCPZoe1GFtd5iJ0YiT2J9/uP3soK/Hr2iKaNI/eGYK5hL+g6sSh66I9xrSldbjwz
	 eook1l/oBGIU+oKM/LZnpH27XN613dNFJFECN4gr8H49+MD6dScE1zMtLLqdbPhJcohU6
	 rn3Z0QVXfiTvaaBietxpqcN9kuSI4HXPpLf7DN75QMOAv22HEck1mWqR45HyvgUKIBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792325;
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
	bh=fduObpJNMJUox1CI4Dn1JnzEv+0ih4IhdXwLhwxcOaw=;
	b=iAAz2PfqoIahELspB9dp0Laa0loiMugDwsbQ70CHrYiw9BMczpYJjOd2wDGu/7miS8cg
	 Mj82fW4xlJCb+YL0S0W5ueodAODS5nUBtjkIKH67+jxRYxepkcWetisUnBNgyrYX1hRZP
	 WMmSBtdsgEWip5lgqAQYRG1WsnfdbvHX2n36aqfJXlhgLgzHJWZpWqE7Uxanf0EYoro8U
	 0f4Ch/IjPk1yvA4b3XAnMMmpvZLfK+wwtjvQxZUgeGxstFxWYzLvWiuI72shtRMnJP7Ak
	 +zCwGf3e0/ua2HawCwN8fu1a3uXJ/R9PO7+O+enW+BdYOEcD7CpTx5gMpNt53ehrmmg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792325;
	bh=fduObpJNMJUox1CI4Dn1JnzEv+0ih4IhdXwLhwxcOaw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=YaQoKNOVDzzxvYDl31Y0uYXKtPP2mNNE/Ym2tuXwaldCFxI6yBo+gPlBLGMBfe/pm
	 YZKaWGzkTYn0RvtLrLmlvkjJRa0FOOoncJqysB6C/UAVxlZC29t4wdBqJFreG916b1
	 gU1MmyD/S3GGDH3HpEpsskwpuzbce6xqq2a7FdQpe7VUMpOn0NAbT6XH/LkpKtKxtf
	 rgmSk2xAo3zATHN9mkLEmjDPw+G2Q6/Pi9cHcNBhd1l2R3gjhAjxZadWPSBnD+etAC
	 R/ZexSj5I+dX/89ZyH0eRvSKbBv8pCU5R8u3wMIjq/+ehxb7/BeItEmxmdUbtcKBn4
	 meD+xsJ1RT4ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E5C60A4C;
	Fri, 23 Oct 2026 21:52:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 511F53D9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42BB28168D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BveRofmHI8rQ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 016608168A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792322;
 b=Qbw/9qDm9F59vIbEufPn2d8Xm2CLElhTaw4qUFiToa/Pacmc77LvSTBHa9I9I8gPwh53
 sU8ytqQs7e0kh3UrWYS40MBCm09naH7AfADoEsxz0y2MdHttu70eiCeS0zAOOIccbmAHH
 Q/hrX5Ol/ApRELxDW/zuC+zhWAxvcjbrSU8I0/EXjA4v7g4t8ynwwa4kFTVcOnn/d2bbJ
 FJ+P1dEe+DMesk5lm1s7JOKeTQkWirrFLevNc/5HGvdHn8YxNFMXC/zdG9/HiGhGvuREm
 D30Vwy66mr/0ggc6PBfFI+rtYmwg0tm7SbRRPVmyxlJOnDtVGI9Dd6n/uCxo4x/dyJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792322;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=7s3crOcm0cO9txhsfULW544AM2n12I26TXaI3fPK6fk=;
 b=JEGcFFrPAky4T57x7Rr+Jz0r8RAUiXR/CG3uvZLDBe0bBcYjWGQjVRFrhboXMfA0MXwD
 VwCoA/7+N4kjuObubBAtons9Qg1ERPAr+s+fJzQxB/3b5YqAjU7qXy8yrzLQDnUqFa9qa
 7ixO4vbLFjYOk0nOp0nC9csU64OlCHfeQwbsxkcY7s/+557dtShHiJCIfG5cvEmhMGz7b
 9cFujerf9p+x4Ag/J6SkgChw2Zc7+BA6bNyBnMHrGrsYQyyVexJor5t3+WPpFeo4fzmbN
 JQ2Gjw5/azzt67f2jbq7dvpZawwUPZTm2Ao3t6zdloYSRr3mgB2mIXE5wYHrRzcONbQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=YDnnrsk9; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1062"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1062; helo=mail-pj1-x1062.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1062.google.com (mail-pj1-x1062.google.com
 [IPv6:2607:f8b0:4864:20::1062])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 016608168A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:00 +0000 (UTC)
Received: by mail-pj1-x1062.google.com with SMTP id
 98e67ed59e1d1-3ac451e128cso959523a91.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792320; x=1793397120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7s3crOcm0cO9txhsfULW544AM2n12I26TXaI3fPK6fk=;
 b=Xe4BKrOdgs9va5YHgFcf2yUnXk3S7QIJXUe6yMhmUBduSOnzQmrbx7qPjD0A1zgqDF
 j5A9xwobKAz5aLxKVn2A7VcP0V3jUYzW7/Ebi40JNi8Td20zajCOrkj/OK/DVdavRveG
 VBgzA8dUTvSS95xi1kZjKaWTCTHH/hdA7ET3Jaox5MIUe5D4X5osggdj5Hi23UEa1MBz
 aTjarDFKyMxmMrdfi2nTTNi4JZYait4duoUymLFexcM4WqkILFiV0NFkomUCTf8i+BHN
 /+jB/OtOkLy9FK2mb4+o3TX6ACwrerRWeiHrqh8UiFEVSDVyt78EbypW1+C2Zr3L44mR
 IN6Q==
X-Gm-Message-State: AFq9FYL6WLEPteKCZkgcAok6ewIEgZsSF0vmtsIGUbrlS6Qk1pxzKRJ7
 f0wNLd5hdNHZ9qdPQV96+QePBZpN6jAqsKww31M6otkAeWkqxQ8ElFbWkHr9t/ojq0cfiSrkyJl
 gVHI/nooLgrt1LZV0GAAXpCfqutVfRK6YEnlWie/0JHTw8LXDrkckGIfulh6NQYCpO+cDL5z3n9
 bMdnlYQRAnlyoNwI7tnEZ2Xz6P6QP1NVbe91QrBoMjbSvfcRm3ki0zjOm9I75GpaPyzBrGiydwS
 n8Eaqv05wVu1LA33DW+
X-Gm-Gg: AYBFou01dw054/10MGnKWVf0OkaspYi2bQFxAo1toXDEnoOB8Ljr4SA+BMv2dXG+r7W
 9K8Zj2xC6qPcmcXVSx9Mni28qkTtYGIs+XUL2kKBzFKb+gl6B066/LmQFsk4e2mlhaMZKT2++QL
 j260c+f3guzWve+oplLmHTdgCNkknMzB3+cA3XWfsvGpx3IF5tbYwI8kAD+HI3N3hOdCsYGqgeC
 PoG1syCvj9FtM0et7JScz7Zm+vgozwtcCu6Bko0/P1Ln76oVmn/ZWp9V4nW2wCdwzantG2BkjRj
 PtNm9+pSerrFLY/EABxllc9g6EmXG2xRuhWL/xjYhJf1klbKIbCl31IV0M+IwzVVooLKKhT+PJl
 Y4UU8OeQJ/3jxnSxpZj12JsUB6NC810HbFV5JTUfSzSTLB4Pmqgi5dPHT8BQVLHkNVrrVBa1pkc
 ZccS13YItkzdow1xXfE8esLU8h8/w2r/h/s67j5sry
X-Received: by 2002:a17:90a:e705:b0:3ac:a11a:7c7f with SMTP id
 98e67ed59e1d1-3adeafa85b6mr405261a91.23.1792792319865; 
 Fri, 23 Oct 2026 14:51:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adeb83a327sm190345a91.0.2026.10.23.14.51.59
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:51:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-33713e5e6daso2175227eec.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:51:58 -0700 (PDT)
X-Received: by 2002:a05:7300:d10a:b0:365:d42a:f415 with SMTP id
 5a478bee46e88-369e847a90fmr719116eec.12.1792792307830; 
 Fri, 23 Oct 2026 14:51:47 -0700 (PDT)
X-Received: by 2002:a05:7300:d10a:b0:365:d42a:f415 with SMTP id
 5a478bee46e88-369e847a90fmr718988eec.12.1792792305848; 
 Fri, 23 Oct 2026 14:51:45 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:51:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:23 -0700
Message-Id: <20261023215138.2301146-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 08/23] package: use <pkg>_SRCSUBDIR where
 <pkg>_SRCDIR used to include _SUBDIR
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

With <pkg>_SRCDIR no longer including <pkg>_SUBDIR, convert the
infrastructures and packages that relied on the old meaning (cargo,
hare, luarocks, meson, perl, waf, gcc-final) to <pkg>_SRCSUBDIR.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/gcc/gcc-final/gcc-final.mk |  2 +-
 package/pkg-cargo.mk               |  8 ++++----
 package/pkg-hare.mk                |  8 ++++----
 package/pkg-luarocks.mk            |  4 ++--
 package/pkg-meson.mk               | 26 +++++++++++++-------------
 package/pkg-perl.mk                | 12 ++++++------
 package/pkg-waf.mk                 |  8 ++++----
 7 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 97a64ae2fabf..570636a81dfe 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -51,7 +51,7 @@ HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 # So we must completely override the generic commands and provide our own.
 #
 define HOST_GCC_FINAL_CONFIGURE_CMDS
-	(cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
+	(cd $(HOST_GCC_FINAL_SRCSUBDIR) && rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47a6353f2592..aae6eb9b61aa 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -234,7 +234,7 @@ endif
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	cd $$($$(PKG)_SRCDIR) && \
+	cd $$($$(PKG)_SRCSUBDIR) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
@@ -248,7 +248,7 @@ define $(2)_BUILD_CMDS
 endef
 else # ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	cd $$($$(PKG)_SRCDIR) && \
+	cd $$($$(PKG)_SRCSUBDIR) && \
 	$$(HOST_MAKE_ENV) \
 		$$(HOST_CONFIGURE_OPTS) \
 		$$(HOST_PKG_CARGO_ENV) \
@@ -269,7 +269,7 @@ endif # ifndef $(2)_BUILD_CMDS
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$($$(PKG)_SRCDIR) && \
+	cd $$($$(PKG)_SRCSUBDIR) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
@@ -289,7 +289,7 @@ endif
 
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	cd $$($$(PKG)_SRCDIR) && \
+	cd $$($$(PKG)_SRCSUBDIR) && \
 	$$(HOST_MAKE_ENV) \
 		$$(HOST_CONFIGURE_OPTS) \
 		$$(HOST_PKG_CARGO_ENV) \
diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
index 15dc769311a8..a263b4d42ef3 100644
--- a/package/pkg-hare.mk
+++ b/package/pkg-hare.mk
@@ -48,10 +48,10 @@ ifndef $(2)_BUILD_CMDS
 # https://harelang.org/documentation/usage/project-structure.html#makefiles
 # but in real world, the target "all" is not always the default one
 define $(2)_BUILD_CMDS
-	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
+	if grep "^all:" $$($(2)_SRCSUBDIR)Makefile > /dev/null; then \
 		target=all ; \
 	fi ; \
-	$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" $${target}
+	$(MAKE) -C $$($(2)_SRCSUBDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" $${target}
 endef
 endif
 
@@ -61,7 +61,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$(MAKE) -C $$($(2)_SRCDIR) PREFIX=/usr DESTDIR="$$(STAGING_DIR)" install
+	$(MAKE) -C $$($(2)_SRCSUBDIR) PREFIX=/usr DESTDIR="$$(STAGING_DIR)" install
 endef
 endif
 
@@ -71,7 +71,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$(MAKE) -C $$($(2)_SRCDIR) PREFIX=/usr DESTDIR="$$(TARGET_DIR)" install
+	$(MAKE) -C $$($(2)_SRCSUBDIR) PREFIX=/usr DESTDIR="$$(TARGET_DIR)" install
 endef
 endif
 
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index abcd525fcf8a..9c12ed627b60 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -108,7 +108,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$($(2)_SRCDIR) && \
+	cd $$($(2)_SRCSUBDIR) && \
 		LUAROCKS_CONFIG=$$(LUAROCKS_CONFIG_FILE) \
 		$$(LUAROCKS_RUN_CMD) make --keep --deps-mode none \
 			--tree "$$(TARGET_DIR)/usr" \
@@ -125,7 +125,7 @@ endif
 
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	cd $$($(2)_SRCDIR) && \
+	cd $$($(2)_SRCSUBDIR) && \
 		LUAROCKS_CONFIG=$$(HOST_LUAROCKS_CONFIG_FILE) \
 		$$(LUAROCKS_RUN_CMD) make --keep --deps-mode none \
 			DEPS_DIR="$$(HOST_DIR)" \
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index f2efbae2eb72..350f597b7018 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -147,12 +147,12 @@ $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
 #
 #
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
-	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
+	rm -rf $$($$(PKG)_SRCSUBDIR)/buildroot-build
+	mkdir -p $$($$(PKG)_SRCSUBDIR)/buildroot-build
 	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
 	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
 	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS,$(2)_FCFLAGS) \
-	    > $$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf
+	    > $$($$(PKG)_SRCSUBDIR)/buildroot-build/cross-compilation.conf
 	PATH=$$(BR_PATH) \
 	CC_FOR_BUILD="$$(HOSTCC)" \
 	CXX_FOR_BUILD="$$(HOSTCXX)" \
@@ -162,21 +162,21 @@ define $(2)_CONFIGURE_CMDS
 		--libdir=lib \
 		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
 		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
-		--cross-file=$$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf \
+		--cross-file=$$($$(PKG)_SRCSUBDIR)/buildroot-build/cross-compilation.conf \
 		-Db_pie=false \
 		-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
 		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
 		$$($$(PKG)_CONF_OPTS) \
-		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
+		$$($$(PKG)_SRCSUBDIR) $$($$(PKG)_SRCSUBDIR)/buildroot-build
 endef
 else
 
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
-	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
+	rm -rf $$($$(PKG)_SRCSUBDIR)/buildroot-build
+	mkdir -p $$($$(PKG)_SRCSUBDIR)/buildroot-build
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
 		--prefix=$$(HOST_DIR) \
@@ -188,7 +188,7 @@ define $(2)_CONFIGURE_CMDS
 		--wrap-mode=nodownload \
 		-Dstrip=true \
 		$$($$(PKG)_CONF_OPTS) \
-		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
+		$$($$(PKG)_SRCSUBDIR) $$($$(PKG)_SRCSUBDIR)/buildroot-build
 endef
 endif
 endif
@@ -203,12 +203,12 @@ ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build
+		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCSUBDIR)/buildroot-build
 endef
 else
 define $(2)_BUILD_CMDS
 	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build
+		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCSUBDIR)/buildroot-build
 endef
 endif
 endif
@@ -220,7 +220,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCSUBDIR)/buildroot-build install
 endef
 endif
 
@@ -231,7 +231,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCSUBDIR)/buildroot-build install
 endef
 endif
 
@@ -242,7 +242,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCSUBDIR)/buildroot-build install
 endef
 endif
 
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 1ecf31eff9ca..1fbfb00e3796 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -67,7 +67,7 @@ ifeq ($(4),target)
 
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
+	cd $$($$(PKG)_SRCSUBDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		$$(PERL_RUN) Build.PL \
@@ -118,7 +118,7 @@ else
 
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
+	cd $$($$(PKG)_SRCSUBDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		$$(PERL_RUN) Build.PL \
@@ -144,7 +144,7 @@ ifeq ($(4),target)
 
 # Build package for target
 define $(2)_BUILD_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
+	cd $$($$(PKG)_SRCSUBDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$(PERL_RUN) Build $$($(2)_BUILD_OPTS) build; \
 	else \
 		$$(MAKE1) \
@@ -156,7 +156,7 @@ else
 
 # Build package for host
 define $(2)_BUILD_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
+	cd $$($$(PKG)_SRCSUBDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$(PERL_RUN) Build $$($(2)_BUILD_OPTS) build; \
 	else \
 		$$(MAKE1) $$($(2)_BUILD_OPTS) pure_all; \
@@ -171,7 +171,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
+	cd $$($$(PKG)_SRCSUBDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$(PERL_RUN) Build $$($(2)_INSTALL_TARGET_OPTS) install; \
 	else \
 		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPTS) pure_install; \
@@ -185,7 +185,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
+	cd $$($$(PKG)_SRCSUBDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$(PERL_RUN) Build $$($(2)_INSTALL_TARGET_OPTS) install; \
 	else \
 		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPTS) pure_install; \
diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 0529bb6ddaf2..c41d7314a132 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -65,7 +65,7 @@ endif
 #
 ifndef $(2)_CONFIGURE_CMDS
 define $(2)_CONFIGURE_CMDS
-	cd $$($$(PKG)_SRCDIR) && \
+	cd $$($$(PKG)_SRCSUBDIR) && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$($(2)_CONF_ENV) \
 	$$(HOST_DIR)/bin/python3 $$($(2)_WAF) configure \
@@ -82,7 +82,7 @@ endif
 #
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
-	cd $$($$(PKG)_SRCDIR) && \
+	cd $$($$(PKG)_SRCSUBDIR) && \
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		build $$(WAF_OPTS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
@@ -95,7 +95,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	cd $$($$(PKG)_SRCDIR) && \
+	cd $$($$(PKG)_SRCSUBDIR) && \
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		install --destdir=$$(STAGING_DIR) \
 		$$($(2)_INSTALL_STAGING_OPTS) \
@@ -109,7 +109,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$($$(PKG)_SRCDIR) && \
+	cd $$($$(PKG)_SRCSUBDIR) && \
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		install --destdir=$$(TARGET_DIR) \
 		$$($(2)_INSTALL_TARGET_OPTS) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
