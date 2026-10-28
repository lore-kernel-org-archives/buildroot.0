Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2352606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WhifisWn
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A346B409C2;
	Wed, 28 Oct 2026 21:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7wt3wNcvsYY; Wed, 28 Oct 2026 21:40:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8ACAE40A9A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223629;
	b=VmU4LGuyHIZ7bNcLnG8wIFSA9Zv39mFLtiYBSEOZoPUvDCGxkqWnkDrl27n/owM6y4N9
	 QltHq9I8DusTehSnoywd5iElHY1tq1OoI1oFuNXonqRHI16804M4QXSIL2FQOO/AAMxQC
	 BmiaMcyI2f9uHXXUQq/Elmb7kjVZ7KdnvONPmFb/nTFnbLrkBq2mcjVscKKo2wMS1w4HZ
	 6/CyQV50iBDqca1Cu6i632nRGx7b/XZbL0YsbZJRPGAQLEYuptTnIf9BTq/1vwNYGi7f+
	 woksuPoqE/lTRJOVVeQn25W48ZDKetlQCEiwz7YLQp5b+bkkv2MSdp86C3+ExsGYumA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223629;
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
	bh=t7pETImN3mlKDajJ39nsYmxqdfIgHKvSI77kwQM4v00=;
	b=DE08FgPZFaba+I6WKwXG5O7W9mbLQInCmaVKPs9R9TejW2BZZHPc4x3smqwML+f96LJu
	 sMJEJ6msX7pOP9Y+w/f46k3G2VTh0z1ZqjCfP1LeiR2jq1gvlMXa0ZOO1L+aafuhpcynE
	 uvBKroEhzbajf05cxBg64wBh9/wgZrtaJhPIldB6ZTmxgSHMwk7P72bc2wxeWshbISLzQ
	 iXM2zmQ0CF5IUhCMfNT2OOPyQOwkVa+LeEakrr6eRyaxOGeonsW+DtIuxRStAbuYwtV8g
	 KWzC4FRA6zRlkxrqAozx1JEiD1SSpopUYPGm4E9tz0qMfemnYTr4MxWwJPBksFQp+ew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223629;
	bh=t7pETImN3mlKDajJ39nsYmxqdfIgHKvSI77kwQM4v00=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WhifisWnt5FVM1ig2zbDh/Xufo4ob0zT39UpEhecatMn2eUswVRGKplAGkBv8cwtg
	 +97p2KNIPKhhjYxU/LwMCf9QWFjw2ISNETbHegCK1O3wRoH9RCpPqYk4xKnL7/qaOd
	 65XfxmbBuZh9L2Tl1HvDPOPwhzzPjT+abb9TGHT8gp9tSVPqQ6E2dYulczRcZXch3/
	 9NahnuMKH2j9fcJG1xQeOmcmZLx6EIQ0Ftl5Tzw0Hn4QvNyl2g6XOrFR6S0qkajvUu
	 8E2AhxnSlG6JdwCigF65YSGmvv/M/dba6wLTGqnxD1kjEVT21JU4jPL1gzyqWozkkR
	 z49z5h6TimEKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ACAE40A9A;
	Wed, 28 Oct 2026 21:40:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44C3F2E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3889C40A2C
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pa74vDkyPwFA for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:40:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 39DBE40A16
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223620;
 b=eByztFXuVsurK0BV6pm50Bw1sRFCnyZdePqmJMTgMKMD8QYNrgC1/DaN4orssX6+g1AV
 F5euAfl/3QXSDNpFN6yAbABJwtyeLI5UkEUGIfKX1mL1emuoxdVP+S1OYi1/w2oDKH06D
 IQx7wt/lpWpIHOVXjXEAwXWQRUI/XZ1i0QDbzzllDew4Lj/OcnbdQaaP1c2ePodnLUyN8
 dtnWrEmeS/2iliLn9dZfBlfuSS0ifZGDFe7+Jt/lKGvJfn0jGDvx/PUdNUFPRVUni6hH2
 JfSIQYbq4J5lQNTtouDa5RbtZKwcIJPRprtYuDMfutdZMiUk7gxZMb5akbouS9QzWsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223620;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=SCDZk9Zs/UJzdTVV/SyqpSQF3PXgPM4HTHnym3C7ITI=;
 b=QAt9rM56TmbI0HPcmB7RJYDENsUVSE49iDIOVBrTaWMNSVCcMrodmn6UgfzwNJmdrRaw
 0W1na2GLr7e11VS2p/buFtA8Tozw9WqwWRM5qyy+hmt2H6neaWuTPsMVZyW31xVAUoAlY
 maFlXI4FtQtcnbi3dtI8oPR9T0b6Gg7qc/Rc82kMxW+2FtqDE4+xte4GYuL3x4ERhva+d
 M6pXrAsPTXiSAmkiNwCgvXGkF8VhAeIxavhnqgUUAXyWgwzySVazXQy3mGCsBEKeBMFIf
 FM+tmBN5+dcAf5sKlHDMeoiVffBdES2GwTnL8GobohqpKUvue0kzdNkTR7OS/iLxOAA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=GVNAaoGG; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::761"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::761; helo=mail-qk1-x761.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-qk1-x761.google.com (mail-qk1-x761.google.com
 [IPv6:2607:f8b0:4864:20::761])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39DBE40A16
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:19 +0000 (UTC)
Received: by mail-qk1-x761.google.com with SMTP id
 af79cd13be357-93e515769d3so121357885a.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223619; x=1793828419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SCDZk9Zs/UJzdTVV/SyqpSQF3PXgPM4HTHnym3C7ITI=;
 b=reUeZKN192KGrdqBeAgw7xF0/rX6NLaLg1zQeFxFzmLT9W3eG4DIGJ3bdjas4DqRgJ
 KecB+c3nLaIfDW5le1YHBXx30+qXOtVXojEANdJtrvqnza8ZxlvX8aRKOjAVYbJoeHwn
 tDKdnibqUB+gGPAeiFDysFrqMFc4GhFUsj12aOg6bXHe/kOGFrwM47gHD1DdcGFosQiP
 nUOTTV+DMkE4i+9wDTQLQvIjgHbHkdL4zKrq89wSmL/N9+bS5nn762oaSEqARg1fvntq
 4ig5+V6Ymqb221bxFC/auY9wUcYCSH58/v/7BugOj6LdXTfxQ67tnQv4uiDEjcGFCrj/
 Ei2A==
X-Gm-Message-State: AFq9FYKqCuWnHiDeteJ7FJ3fD+tsojcLa7d320ZEPDJpqAoGKZsflWnl
 mralB54tA+d3j0+kAYGQtLg+aSdcJek46CwvrHyKRxk1HeT92TTXzfSb2CBw7eh1Oki9cIRugzo
 UcUgdkunVkk+NXEWrH/NggFLhq0FXV0jiw2BgdYvTeuBjzZkbTh1VUsSrL1o+k3rkqjSsFdtXuT
 H0QOJxRacUY/VwA/8XMMdX9VYjoMCBMOi7D5/DUGoLUcJk8I15EMVebgagXl+z12Ee3V6jksHSL
 3t1bW9iwS5/beopYQ==
X-Gm-Gg: AYBFou2SYX/yW4PzFxDstSPmfropCt0d9IbbIqYbYaVl/0awPJ3DiD8byH9eRGe366X
 INty1nlRmk0rf4yrPx9yrD2u584vJsG5OIUBFWuJtBpbw3kEnOupFDGdWSback5eV0FukFd2FhK
 B53WVbJhaUUZ/Eg0fu4wyh8zQRH83mkc7g53mIvzDUqtVQAD1M172P5PpmSUWpJJD9LlKEAsxkO
 9aUWA7kZAMbwniYiTHh/WWSbf6/gfzfzlC0G9x9KV/iUCYh5cW+oCz8spyqdCCWwUULASBDc5RL
 QhyZTnZBHP0cVacs3nU9SzW8FHNsx4r9441sD5g3k0piHxoptzMFvknXKc+sfhoPBLWP1aDxzWN
 KZZZJOhoq04fBovY6vZWU5Igf1kvz2jbdGkZDwmh/vJTaecqoVuVCfFaqmTYnVNM34k8wiJJwE9
 5oQwjjvdI+V0LrqynVEy3hRWrHnXlwWhI2Z6Hd1DU5kGo=
X-Received: by 2002:a05:620a:371e:b0:93f:309a:ba5 with SMTP id
 af79cd13be357-94408cbd0cdmr592806185a.47.1793223618602; 
 Wed, 28 Oct 2026 14:40:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-940f0a75602sm200788585a.15.2026.10.28.14.40.18
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:40:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-934963b2bc0so259296785a.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:93e:c12c:4402 with SMTP id
 af79cd13be357-94408d65c91mr543563885a.79.1793223617713; 
 Wed, 28 Oct 2026 14:40:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:93e:c12c:4402 with SMTP id
 af79cd13be357-94408d65c91mr543557585a.79.1793223616987; 
 Wed, 28 Oct 2026 14:40:16 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c16569sm140994586d6.18.2026.10.28.14.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:40:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:38 -0700
Message-Id: <20261028213744.511429-18-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 17/23] package/perl: apply the perl-cross
 even for the host variant
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
 Francois Perrad <francois.perrad@gadz.org>,
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

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, ther host and target variants have diffeerent source tree,
because the target variant extracts perl-cross, while the host variant
does not.

This goes against having a single source tree for both, to ease
out-of-tree builds.

However, extracting the perl-cross archive has no impact of the standard
build; it only ever adds new files that are not used by the original,
native-only buildsystem.

So, we can extrat perl-cross for the host variant as well, by re-using
the same hook. We also need to apply the config.{sub,guess} hook.

Now that both variants extract perl-cross, the patch for perl-cross does
not need to be applied by a target-only hook anymore: move it back to
the package patch directory, so that it is applied for both variants, and
drop the PERL_POST_PATCH_HOOKS hook introduced for it. This reverts
8dea6e7c089c ("package/perl: apply perl-cross patch only on target perl").

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d2ad97e0eeff39fc89a58b589f19094824402756)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 ...01-configure-keep-_GNU_SOURCE-in-build-flags.patch |  0
 package/perl/perl.mk                                  | 11 ++---------
 2 files changed, 2 insertions(+), 9 deletions(-)
 rename package/perl/{perl-cross => }/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch (100%)

diff --git a/package/perl/perl-cross/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch b/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
similarity index 100%
rename from package/perl/perl-cross/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
rename to package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 43820cfcc33a..0892299ed00a 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -31,21 +31,14 @@ define PERL_CROSS_EXTRACT
 	mv $(@D)/cnf/diffs/perl5-5.42.0 $(@D)/cnf/diffs/perl5-5.42.3
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
-
-# We need to patch perl-cross, but perl-cross is extracted over the
-# target perl sources only (and not the host variant). So we apply the
-# patch only for the target case using a post patch hook.
-define PERL_CROSS_PATCH
-	$(APPLY_PATCHES) $(@D) $(PERL_PKGDIR)/perl-cross \
-		0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
-endef
-PERL_POST_PATCH_HOOKS += PERL_CROSS_PATCH
+HOST_PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
 # Even though perl is not an autotools-package, it uses config.sub and
 # config.guess. Up-to-date versions of these files may be needed to build perl
 # on newer host architectures, so we borrow the hook which updates them from the
 # autotools infrastructure.
 PERL_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
+HOST_PERL_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 PERL_DEPENDENCIES += berkeleydb
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
