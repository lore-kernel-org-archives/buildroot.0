Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C44B606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EqgrI2IU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEC8C40A47;
	Wed, 28 Oct 2026 21:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9khN1mee1Iq; Wed, 28 Oct 2026 21:40:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7E72840A8E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223624;
	b=NOUyzCjsiL3u78xJ5r3WdDdM05PIy5jtr8N7Uq3m2rOfPGBBVW5pkH0BfcDTp6Lpv0Ga
	 ZaRShvd6wY5N7u9plYN93qoKZfMgVXgLqkTPA9hMjBycHdyHAhdZ3Eut7CFVjy5IkK4IM
	 VVw6M4192Zl1xCtwz8mbO+rbnZStMnHB5WGewf9GY9b2WVAfhWrce+WstH4MYJUyyG8Oi
	 S1BRQ5DJMvGSiD2soJFBwMTSsTQxMpv6bQ5Tj6td999QQAJgr/N0rEQZvPNLHaX68sMnJ
	 b3zZAiD4nK9br4PNu0zxsqcAsoqjq8RmWlRPsmcKoMGydbcaNJvz/SDmbRpw4y04ckw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223624;
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
	bh=FqK/91o1jJfVL0pVuXHv4B12AVAr7Mj8qEGPhgZi7h4=;
	b=iqAnjGsZxSZJEvg64cOo5zwuGqO6XfzIJGqKZnoDsVK2LaHRha+QuzXW32c6dMvQOUeC
	 233wQQ/omm2waN2MwdtADYKCS/Ac6P54iMW1Ygb/o4Gw5qx5+wY3UjM9milCeoBgPkf58
	 z1+VJAS55J2U/QVXgTBpee/LpBqIUQ3VKkyzu6mKH6DblkoS4k1G8u+jaABNDezjbD0b9
	 ujLksKohNslGREhVKuN5HfmwWhc2cQHu+r98K8CreaocWHyK40IwOpmkDTk1SBRuWHvOV
	 FB1KbJ1PYN4+TXb0Ng8mk1MzwN+x40dNx/rdN5xcLAsvOPMdU0IFjeApSXth3b0tlow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223624;
	bh=FqK/91o1jJfVL0pVuXHv4B12AVAr7Mj8qEGPhgZi7h4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=EqgrI2IUBp429/dHp0ORFqZdbM49cJ2RWG6ojc10x1ku++uQpMVNExINmiYxQTAmi
	 oztfqUbvEL34DK636VrOipmjDSWCX7aFHtf2Rl1Y5F/Z9j1BoqQBDWeitMlO1F7kuR
	 OC7o+ytE9GTF/lTkUaxAm+50wYQ6p+29g+OrFDlyjNwqt6J2j2Pu6hB5smV+e/0PlA
	 EbANJNAM6KWbBWq3YJlvUdcNMXEDa91NU1NyZILVqhx+WCVt7gauK2BrpH1pYL4ByQ
	 iWSZ7K/csY/rncYAalTxDPH6T0P0lu0aHw+Ah8OZmFv9FLgAF5YWtkU8uHR0esMJSt
	 Uh0+1mh11Ma2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E72840A8E;
	Wed, 28 Oct 2026 21:40:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 006EB2E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6FFD40A2C
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0ulzmRsOaHi for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:40:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AC1D2409A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223614;
 b=VwAAEVcZPbKofKQicGpGgaPE16WoSkwB05Uz9Qw1VNfuz7wvWiRub8hdKkmYm7y553OX
 RkzWsDlbAYXms7wwm0M9bcg1YhXf3n6nPbLfrf92Q9AjkOECeVI3YzG5ADzOSRzjjs5CP
 3ZmrmodqNv2bSQZkzY954L8f45XzuPrIkdI6aWmxTh0LaOckDVOKuEWuSpfqBC4PKMido
 ppv2vUEbCDgB0BuLKNZJ/F/kBn8ejp1Vcpy+gP7WIUQX/HptiF4hPmeD5oXXaz5e+Tbvb
 Xb0uf92/m+AA+86VLtKGQxXdyoG2WkU/e951vXcrgmyvVLFP6oXnKIWZ1zjdERRex0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223614;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=XdND83dQH2Rgs7thsxMsa5mK2GFUP6VPRWm5/Lc7hzE=;
 b=nW/Fa09adosbZKLBpbTyzFlPDkKncUc8+qjR+TmQ2fgcQDLbSe1Kkd5J3heddghDycYL
 ChT70OxfB1ZKEGrMO6yJ197GCQv5+RFaEYeg5lrAyZSLQ0o1QMj9UmdadQNGKAkeCUkJC
 IGyfJdBqSEnaNqD4bAU1a0woVWB8TXHoYAg69vVHZ+fp07xEa6VJRtaCvdudNMbbu5/JV
 hQtkBlGBG5trLWrYhfl6BLLQkTEZLpIXDHBza4V2fvVFBD4NMoVSj0kLNzM2rneIgoCfH
 FCI2OLyLLa8XuTUyyJSHDt+I3mqNWGkqQcnz+ElYj6t+0HMIxPXurv/Z9oPmSJIlyQg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=KxmjciyE; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1062"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1062; helo=mail-pj1-x1062.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1062.google.com (mail-pj1-x1062.google.com
 [IPv6:2607:f8b0:4864:20::1062])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC1D2409A7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:14 +0000 (UTC)
Received: by mail-pj1-x1062.google.com with SMTP id
 98e67ed59e1d1-3ac91ac8924so943040a91.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223613; x=1793828413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XdND83dQH2Rgs7thsxMsa5mK2GFUP6VPRWm5/Lc7hzE=;
 b=jZmdtr3J5b/PdpXoaXFvvwdcOV8WCadEftZ+vaQRBh9pRbSuq3PzlWX4SPPwqSnvJr
 gPS3k80Fme9AfV1bF+hMh00Q1owmxE1OI/0OJdsHRsJXvxVogERzX5IWuGRoVsLodkY5
 HORGiw5/tqE07bjyRc6Rvxt4k5DugvoAStiobfsZlRjRE/LNuruuLMtzo6kvnsDVV/jR
 NkQsHf8U9pbu4SGMvB/QnpeYUkZmb1PMMzbhSRn3ef3wM2mCLBUOZTSz1B978nxnHr2V
 QnvZ3m7q/4K6zQ0vj6T1CYeLFExtnq73XrHYx5a56NpiHB1LWy37R0q1+Pz2M/oGqqEC
 AC7w==
X-Gm-Message-State: AFq9FYIPbj27b0klj4WwCKk57Op2s/lVPKmhV97czIaRv3jft1bhevHu
 7IXbCefQ1Ppv9UBZpcWHpB2GFiXYjji2DFJKIYC7+47OZnAEQMepO3Rp6O3HnVDsk/jCpqPDy2B
 ChRy9wfGSCIOJqZ4uZBfn2jxqLF5v53oKhen1O4agcSDGR02yWWho146vJMKG4uZnIUvjQ4Ut/Q
 9PHyK1h3cSw7kr5XiyZEb89I67ueZWgk9DgI7QyAcRVrMcB3C94XoR4CrZ6vUn7Gt901bR2Wzs/
 vfdEw6mfxJ5imEJpA==
X-Gm-Gg: AYBFou1/iRZzuScD+7LlvfzOwOMeTq5qFVypC2tblJTWVFB1pqbwPjjLsKjPeqIqLta
 y1bKLDSbBnEh6a1vu0nXp5hjfbFx3TAP7On/EjCa65QkBQnayfSJFvcR/1TV2qZQCjL7x9PM/2f
 YDd+31++0hcHXnp+TQmWJ6YLfC4hnfp/yRuX2ydcVaLHUuB4I8OdGjiysrpPX+2mI2Zw6f4fiZY
 y83UfimtYXvjkjTLTYTuA0oL51ob5LRBj8ilZ2YvBnyerwtcuq/6zKGPBPBvGjcl+ZrVuPdui3z
 +Qa3q/q8sW8Plry+kJ+ynr0hHO4h+J1jtaVB0HOi7FQaLRfFB+Ls/bfhTzgzp3PUoNaNWxFo3ij
 FiEonESNWkqOnpygwImnLBppnsqqVUpAQLw2AjssthPH+H8gL7N0ijBDB9vn1vaVrsaSKREgYxO
 7mYwxumGkRn7mZLMJ805GDyDWGMpwvOtX4M748tAal
X-Received: by 2002:a17:90b:54c6:b0:39e:21a7:5df5 with SMTP id
 98e67ed59e1d1-3ae580f1962mr2610752a91.24.1793223612945; 
 Wed, 28 Oct 2026 14:40:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae6e762f2csm572484a91.8.2026.10.28.14.40.12
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:40:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91c84af45c8so18509676d6.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:11 -0700 (PDT)
X-Received: by 2002:a05:6214:19ee:b0:912:488d:33ac with SMTP id
 6a1803df08f44-91c7cf7470emr55830136d6.17.1793223611353; 
 Wed, 28 Oct 2026 14:40:11 -0700 (PDT)
X-Received: by 2002:a05:6214:19ee:b0:912:488d:33ac with SMTP id
 6a1803df08f44-91c7cf7470emr55829636d6.17.1793223610860; 
 Wed, 28 Oct 2026 14:40:10 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c16569sm140994586d6.18.2026.10.28.14.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:40:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:36 -0700
Message-Id: <20261028213744.511429-16-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 15/23] package/libtool: also apply
 libtool-patch to host libtool
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

Currently, we avoid applying our libtool patch to the host variant of
libtool. This is mostly historical.

However, this means that the host and target sources are not the same,
and this is an hindrance to out-of-tree build.

It turns out that we in fact can apply our hook. We just need to do like
for the target variant to avoid building the documentation.

However, that has a direct impact on the autotools package infra. When a
package is using libtool, and gets autoreconf-ed, the libtool-installed
ltmain.sh is copied to the package source tree. This lt-main.sh is what
our LIBTOOL_PATCH_HOOK hook would patch. But that lt-main.sh file is the
one that was already patched in, and installed by, the host-libtool
package.

So, we no longer need to apply the libtool patch to packages that get
autoreconf-ed, as they will automatically get the correct, patched
version now.

Note that for packages that we do not autoreconf, we still need to
use the libtool patch, as is currently done, to patch the lt-main.sh in
the package source

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 70fa1fb72eef8325263df640f7781710875f6ad3)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/libtool/libtool.mk | 1 -
 package/pkg-autotools.mk   | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 45441e1e4676..98ca31d549a4 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -26,7 +26,6 @@ HOST_LIBTOOL_LICENSE = GPL-2.0+ (libtool), LGPL-2.1+ (libltdl)
 HOST_LIBTOOL_LICENSE_FILES = COPYING $(LIBTOOL_SUBDIR)/COPYING.LIB
 
 HOST_LIBTOOL_CONF_ENV = HELP2MAN=true MAKEINFO=true
-HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
 # We have a patch that affects libtool.m4, which triggers an autoreconf
 # in the build step. Normally we would set AUTORECONF = YES, but this
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 58b63317cb60..89894b9b6cfc 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -243,10 +243,6 @@ else
 $(2)_AUTORECONF_ENV += AUTOPOINT=/bin/true
 endif
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
-# default values are not evaluated yet, so don't rely on this defaulting to YES
-ifneq ($$($(2)_LIBTOOL_PATCH),NO)
-$(2)_PRE_CONFIGURE_HOOKS += LIBTOOL_PATCH_HOOK
-endif
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 
 else # ! AUTORECONF = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
