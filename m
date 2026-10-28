Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCF8606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s12gAEWJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1BB3409D1;
	Wed, 28 Oct 2026 21:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZVM2ypDp3UL; Wed, 28 Oct 2026 21:38:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E95D40528
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223536;
	b=eEdPv5NWQE3l+v2wT2IyqCrnv7xofko3RdiLQAXh9Tx4Oyc/ALx1Qrcvb/FIPs6/miIm
	 AJtkBzBUULILir/SjOe4+rkcwx3wqJP+4bdy7LBUkkd0kWAekOuLY2URu1/2B2I3OOIc8
	 asJa8I3hjJXf2YPLsdw5Iy6uxhIwzIW8SivWHNkALvGlmGsptV+nswj0SDXTDeF4AXQtn
	 e/OlAIr8EE8RHqDEYMenxah1iOGJO0dXhEV8BRxxitfkFT52t2SpF9iB1jhP4H/zDCsgo
	 JCi1dnOK3mb37c+gnre4WckEBQL97aVLwvfHfJi1EpqP84riIsZUo6lKRaazvhWeotw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223536;
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
	b=OLPlMrqgdIwHvS98y5WA4vcI3K3oyyzHqhE1CiB7psaaI43WlfUkTQrQ1NQ+X4r5iwpY
	 l12OvsTq5hJPjYUWvbS1RLY8nTQPSVM0VrgXcTV8yLJhO7l/+toVk/QoT77lPqEmFh2zX
	 mwkBYt8bnVRba2dWyKeE/Tr0bb7Z3v9kQllljb5QABp13uLR7HJKOGbfROmJU/Oqw2Q7A
	 vfbZ+Jgj8brup4lleWmkPn7bGdGXeAeQubJjdu2ubUjl7PMMMuAcBRjz6cAA6NFfn2l9b
	 2Au+v3cndlsyYaW/tqB6mOAM4wXScoc3F//5aVn/zJY1a7CPWl2f1C7sXs6klgX8QHQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223536;
	bh=fduObpJNMJUox1CI4Dn1JnzEv+0ih4IhdXwLhwxcOaw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=s12gAEWJ0B0/g8lpnEDl09TNOGxi+nTlfGjR0EWGRLfxN2wykumuozO51CcZXWy7K
	 uYaivvLHWsj217vxgFxou3tnemPY34XVluWdOzhRMkcuO2dPoU4dE9oDFUGqgf0Dam
	 u35viH5y88Gpfl+Y4wIPryh/IX98lVwm0LhO/eX1vzGJm12FIFjUNNcEDJOLrgKPCc
	 +xqR5fO2p1fWjeH+0OS5n6XvDDA+JyJ5c9jeh3+aJUECvLhPFSoysEnyJx7xrl7cpN
	 taY2ZZ7Z7Lj22ICAwezBqxWLknNgsTOmkFQDHpaaTM0x05xLlOh/cV7sg+nlrvWZFj
	 IuSwOuikOSe6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E95D40528;
	Wed, 28 Oct 2026 21:38:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F48C235
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B4F9409D4
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tk244mX5h6O for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:38:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 41BD1409E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223530;
 b=SZjFWgVhreoZ+V2MHbbbNpxooN3pkklw4yJkj/88mlNlP/MRfdL41sYmtZxOfgSpa/al
 xn6f3dbH8RWYaX5E5JgHLWbV7bloXbneK6tdlMYqzlWRPJK8RR2eTfQ9l88HPIBI3b30S
 TMD7j5W/24PZTQZPjJaiISE82cE+iCqy90eJieEkwCsYn1/fjHY3/kOnCu1iaA5Xv7ba2
 GbYBZeQJ9q+bzivhS1SlaxUMmW8huKk35KNB3eEF5QxidkgJj48z5gqbJOH/4L7pzCvPm
 2urRh5ZZA7wGib2mt9urYT/N/CErIevinYmICTGoQxi1B/UfX0PqpfFlNIqijG8ETvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223530;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=7s3crOcm0cO9txhsfULW544AM2n12I26TXaI3fPK6fk=;
 b=XrOegsBOIbcP4mmqm79c340AaEHJM+Ba1g0xVSZ4WL3Hgybr2E2HA/dxed9F/G9t0UWf
 X/pHco7uLRq3KaPPvyxuxcrTuEbgAGgPdzLo3RL5kPyDzAx16T+eAfYLdXrDGyfi9YuYp
 DTvNQ49IReoEnCvbJ7s/z5LEtqNCv5HzXsenxjETntXiQv9E5S6pVByF/7BS6oKZFkGGv
 O0VYudNlBqSiEq+tnaS6LgHnF8gVC2qDaCQ7YgQ8BthXlpfmylp+x9hDLPwo7bIsCe1gR
 zDBLkh35yotJm9Sr8D/y/5ybIOeXk+yg2tuL+dSINj1U1ZpJQGdZDnZvl0ZspkWKVBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=BkNZRws3; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::764"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::764; helo=mail-qk1-x764.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-qk1-x764.google.com (mail-qk1-x764.google.com
 [IPv6:2607:f8b0:4864:20::764])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41BD1409E8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:49 +0000 (UTC)
Received: by mail-qk1-x764.google.com with SMTP id
 af79cd13be357-93f079a63b8so130837185a.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223528; x=1793828328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7s3crOcm0cO9txhsfULW544AM2n12I26TXaI3fPK6fk=;
 b=bD5RFPH8CqGMrAiYcBd4xkmjxQVc9uPsUsqmjhChhIpgtHtfEkoeV+WC2IsXCjoBo6
 0U8bZgmn9W20AzRnYVy7nsfgEZPFlGS/wzDPEyLbtvNV4GE5bfel0LlT0UuP+4qZtpAd
 /gQSrrkDrb7U6m/CAtzlk8m/leZS92aXwTclppxdykocQoCu+q3WE7jObLiVW0tQlOq9
 CdO/qzA1VPvVBgdkezqbJDKvcOSe3U5uo+++7In1/JIKDwB6qk5EukgrxBro8LDgUx3i
 UDYr0aYFj67DqDtEJk4U5HR9VlcMc0ZD9xXzbXi74AChuIkbtpznZohq0Io9k+Ha9C7q
 i6sg==
X-Gm-Message-State: AFq9FYJO7I4b90+vkMUHPyHXRa8PwpWP2gEj6HLC1iFYlIfirNXIkRRy
 iV0SaJLOue8lLIvbDfr1JyUztX4mQxMbkUHifAZduLaM87c4oTXo0fR2xphhF3ha6n3lpQ1mDfR
 Pcyd+Qm0oikGZPNlgwJyPXdLOj3uo7/+DG1vIUku+8IU95gLnKO5TvGRUddPPPey5zs4oEQltHy
 ZRva81Zg1OdYjn3KgiacMIyi7zAk6eLnXd0QkdD9I5WwFPvAN/OCxTVs7oDOFmkl5WWl/09PGXV
 VZ5O1lmNN1OIBv7Iw==
X-Gm-Gg: AYBFou0cAfI/aArEq9oaRI5L+YldlZfQ+LrPD/X7z9ASNrsgacvmS1XwpzERJnxRwjU
 zO4gS+1wWOs+DHAgP6SRy4HobSogGSIwqUUnrQM6WpMIqP706yrv5Xd+GxArNNoKLP5bFPs0VEq
 dZgVXft7fcDjC+QA+ttTSXYfzdLMYCnQcrZe/kvefSxRlIJlNuu5albDnP0nBl8iB3zLclCQLUh
 Rm4R/bd8cul33zi49btu+dJAJWwJ/7cJueDQyTuS/dyx8ydOilN+y8rHzs8kTt+UERP+ZChKOpl
 B9yakMmx9NFCqnIiSSlhwudWZY2cv+hjWeNb/+vTDf1imEArs7NoFNr8jhtnNWF5F3+rc6GS9FJ
 jNk1r7796np69HSXR9VTQxkzLp3bUbaTaFvJUsfW6R8fdCusUoTU+bDJ8XCcDSHN0FrE6Cdjebb
 hIGmoKXw5tuAck1cCOKOMtIqzxTAUsIqBhLq7iX4Vg
X-Received: by 2002:a05:620a:170a:b0:93a:14c:32ad with SMTP id
 af79cd13be357-9440884465dmr568583685a.0.1793223528496; 
 Wed, 28 Oct 2026 14:38:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-940f06747besm198091885a.8.2026.10.28.14.38.47
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:38:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-53639e47be2so31166631cf.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:47 -0700 (PDT)
X-Received: by 2002:ac8:5f8c:0:b0:536:2936:6ca3 with SMTP id
 d75a77b69052e-53fcb117393mr63741921cf.14.1793223526715; 
 Wed, 28 Oct 2026 14:38:46 -0700 (PDT)
X-Received: by 2002:ac8:5f8c:0:b0:536:2936:6ca3 with SMTP id
 d75a77b69052e-53fcb117393mr63741491cf.14.1793223526142; 
 Wed, 28 Oct 2026 14:38:46 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-538394c38easm114397821cf.7.2026.10.28.14.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:38:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:29 -0700
Message-Id: <20261028213744.511429-9-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 08/23] package: use <pkg>_SRCSUBDIR where
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
