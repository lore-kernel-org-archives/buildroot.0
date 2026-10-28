Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE21606A31E
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MJydJwfC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08E14409C2;
	Wed, 28 Oct 2026 21:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-bwDgYWQDfn; Wed, 28 Oct 2026 21:38:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 09285409A8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223488;
	b=o6EfX2hLImDqqA6JxieXc4aV+AlJOgKgw2KoLI3279Q7uQCG/y468k5Vv8EStbZi2OYG
	 4GK2a1DF1/qQpGU4JE88OqGUKIADSs7vZzkY/jPMWl9WBJVtROULp9X0KTf65DhEuBOfS
	 rXXUxZwjURHCntNLHdAsRMsRc4ily46FuIH+SquiLB29ndo6LgZSZ01bYEIzm5C4ACIOn
	 Vax0d1MgPc2kL6i4A2wc9CZQOUD/29LdgKlN1QreclbRWs7OJSCPflKLRUjDdZDciExuD
	 giUziy6nnwEt0DNMCGmfjEHwnCeNUiE976QBQzhPJEk4aBQMNas6NamvifxkCQXcygQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223488;
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
	bh=GZrYUyvnQMLFDc0HKrd3MUiL9+6DiglT+8XREjA5IwE=;
	b=l7b4Gvn2wWtJwQQiGdzjyXwRJfCqvNkIVvymyP/vz8lZR/+EijRLjhL7zMSURZcanw8a
	 OEKG0RbyPnTirBmzvrSmRxi+NvviKhBb6KjJ5Tj6bO5yJbrTgi1vGmtJ9OnCDN7tNiWdl
	 VaK8q6Rf6bCbh8iDR3/Dj/z+0Vq6Nx/t1cdLxt0HufrJjqESFqbyWSXXXa+hhCFu8Tcw0
	 /cfmMwHjfJcIz5ysaQz8hyfhOn/GFLOS5se+Fk7zfaqXiFgQfHEEx2w+EXIbGNUQMABzj
	 EIX/O7lt5YXjPikaBbad5tHLq/5pnI3pgE0ZRGTa1LHMyJqU8wn3oOoX8Qqj2B/TkEA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223488;
	bh=GZrYUyvnQMLFDc0HKrd3MUiL9+6DiglT+8XREjA5IwE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=MJydJwfCOpFcR6/e4sTgC5HbcDjt60zcwapC/4SuaRRcyQpAdJxoq0ZwcZE6KFVuo
	 4GO3qE0Nv/AVQaPqEk7pTh7UcFqOIgHTsKnOYXmb/IV+Yiz3cgFKAsXRlsRbVeGHyH
	 Moocgxfsjp7L3ruIcK+BlQMxDFZj3U4gwKwjZg7lfw/NivWWSoK90ykmM3EwR3fg2C
	 Dcp6HjaeNBugckbTywBcPv6HQs3l2GVxPxSEG5iNZnmxhtbUMIaW7NWpkSoQvym4VE
	 y7CkFUzXmmPV9mQh8uYplAWFPYgIcPhs/r3wcXpVN33QeGh25kvRx0gwAjGVVLXpJX
	 NFRp87i0M2Q0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09285409A8;
	Wed, 28 Oct 2026 21:38:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CEF3235
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AC30409D3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXIJtTUl_Xwk for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:38:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8D81D409C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223482;
 b=QXFwcHeZsCElSf2aP9u7Yx0aWEJzG1oMwmeQg36nwWwtHUL5g1aogvttUC+5BXFA9t4y
 BnNiEggj7eF5cZZQB3pRBWWj4pPel8ZR3hnijCcdiYFzGfx39JQnuYXvUSPPxw8yHq9Pm
 jA5Ko7doHQgRVCdvm8J3YnkqElHARRRoSJpZSIqzSCtluuaCfuaIB6kAby7gGsPXUdBXx
 zPx/Izn5MjLnSQ7o0rij1KZLbAiTN8Ip+psAKilSgUtUuJFSarRHq5THjk18YXYlGjC/T
 JJdv/lospn9VTiyYHCfgVf81W2caqRnx4ZRr0K+1GIPzOZwEw9+XK5ppC2NQiahL4Nw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223482;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=ywN+NcZULvrhNfnQl0EVdZWUbXu2hPd+qgHupSTw9nQ=;
 b=YKQQy2CxWIZlABVRqmcO3w+Qkh71SfZvAOQg6v12dG1zf97G9Hk36BYv+VBkmh/E7GVD
 hXQhvFz6YGlancRmnrhxRT8CpjQShKxcxoaqFKXigCGpdXorNeGlkmekwxNzOfYULUREd
 XJMuRsDDTFaLE63Px6BMkEn/q8n2gb25VY9+ZCwKW02B6gERWNkeYa5+y2oqlRu8Fd+3W
 P02fdsmdApJ362BtCnFxt71otuwpz3UdN2PMoyP1CgWV4/3ZbpMLj0WHHat1DoN0bEIap
 hgII6QfLuZWsKoL+vs4MOz7eEF5yIc+b5cWjMUOGzv/ohRu2wnE25Txf5sbGkv6fdqQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b="Moq60f0/"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1061"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1061; helo=mail-pj1-x1061.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1061.google.com (mail-pj1-x1061.google.com
 [IPv6:2607:f8b0:4864:20::1061])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D81D409C3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:02 +0000 (UTC)
Received: by mail-pj1-x1061.google.com with SMTP id
 98e67ed59e1d1-3ac451e128cso1067638a91.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223482; x=1793828282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ywN+NcZULvrhNfnQl0EVdZWUbXu2hPd+qgHupSTw9nQ=;
 b=lExHNC5iPSXqWnWwo+6gF2Ml043PEwEYRWD2+9776lW2KWU22dJyFnqfRUiwBNsSMo
 gg7K+sgiGwcVr8K09be0LpXCSQhO+Ixy+RPrzMajrn9xXo9thjsdPw8upjxOqLtajLfw
 TKtMsdfUhYALZ9SZYG0xM58SyoNFNN2ZOrVC34dBeg2AruDK87sUvDYSmBvE7sj7N/xo
 16Rcg8WUzPQWAXr9Qn4y/L33x3it6C9+WdK7WvrCATcw9LKnd8ZCUWM/HpCM1zC7x01p
 1eZjvG6ySzKIy/sWB60dcUXsnulWA8z88nDFD1zfJCqbs+gyfJICw+GtV04R3DbeiLtx
 Vqgw==
X-Gm-Message-State: AFq9FYI2CK6WOijjCqwxvtx7DZVW0Nq/0L8sXuFr5cnq/tFU+Be7+HDK
 a3uEPbASgJ1ZqXjsWh3NajFsOpzsGYbmEWmCXIAAuWGouXtp62HcSe1giMQp/1EATF/2cy9H9S2
 mZ+5jZzbMLlCH+R2AMdtWUtCbyZCPaQKxkGwwC11W/ygz4KNhLGRo/UqkOvEDaZ/4F7c/HFlcua
 JhUbkAglwGGFcZUqrxIdJeToNH7FsIJZjfPYfhrZIULfx5ZaaczjrSoE09xaQhFKuPZ2Efe8Gla
 z0hXb+sJeo0HbXJ8w==
X-Gm-Gg: AYBFou38FDAM1EWI3ddbyt3XniFkRPMz5hbK4OUbnVdXf8Ok4CBIBKw6RD13Rly4xdi
 Me6A6Rk6ktTXsswM0Y7quuD/8amja4cgnzGDHpBzKnaSxz9t/ysO8+xmqpuARkJOHVy7Z8Rybfa
 g3+aUhTSLNlvDnX98N39ONPhnDVjyg6+eWfl9GGBjqq19L/P5NztclqkoqfgZbv98qiz1dwe6SD
 n+NKYh300sYzKREsxBdCfcRAfgkwIjNA0WnR4qWJyqVkwKHQCQSn5GhskyacvLPo0eD6OlsMCjg
 McMPV2cvpgy7/h4/dO20Ngo2u9sgCvPMql5Al7C68oApwKgU0SyfNqTXeg+3n0nHz7UXlYcsjpJ
 eB9LwSsxKCPSI0Ras7tJAhW7y6R7lnqMTdmWroyRwdke6WEKeiUydOZ8JDjJoQq5EKPXopoAwFa
 iZtNZGRvYRNKYMziNNhM97eJcD2uSEiZ6rs69QHV9e
X-Received: by 2002:a17:90b:3c8d:b0:3a8:f70f:2437 with SMTP id
 98e67ed59e1d1-3ae581b9e1fmr2340914a91.50.1793223481779; 
 Wed, 28 Oct 2026 14:38:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae57bd2cf2sm1184005a91.5.2026.10.28.14.38.01
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:38:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f2005ce21so206440085a.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:93e:71b8:584b with SMTP id
 af79cd13be357-94408a5cc06mr558590285a.34.1793223480212; 
 Wed, 28 Oct 2026 14:38:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:93e:71b8:584b with SMTP id
 af79cd13be357-94408a5cc06mr558583285a.34.1793223479602; 
 Wed, 28 Oct 2026 14:37:59 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47a69129sm139827476d6.4.2026.10.28.14.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:37:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:24 -0700
Message-Id: <20261028213744.511429-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 03/23] package: fix <pkg>_SRCDIR and
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

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
