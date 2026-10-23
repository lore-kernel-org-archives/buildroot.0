Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF0606A328
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iRLV5yuL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B39158168A;
	Fri, 23 Oct 2026 21:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFAbQQc2EaqV; Fri, 23 Oct 2026 21:52:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 921AB8168B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792329;
	b=ZrZXR6/o0+kDjf6JCP6At03sODLa40tMS5XxmzkI03PaT3MSNa9zJVgh0uvHfTIH9ExX
	 q+rz89wtUayUnHeFYFo+SyaMq6hIRhHG5elEZxs9YputdQgb8g3MKIc4NN24szdC2TaRY
	 LCyps8pT4v4qPM/vP6Mn8MmQrk/4p7Jydj2HkkMA9SyoS30nkYNRISF11MZw7O0NDdjrT
	 O41D/x9H+XIkRTLY6IdVxDDWkQuxoxr+VQDL3QLMTPuNcaUgjXiZaAnYcKsn4aM4ZASkI
	 bTo3KKf4ytHA6v1J8CGHC/f6k5uZxbKjAj3GZv8Jbkqtc/wkjid3+tWAh2YnD+i6MCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792329;
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
	b=nolnFe2OZPHbuSV8cSLiQ2TDZsgPgWRkShE5hJi4JcicURSN1zoDCOIL03uO2kr4XF8D
	 TbZocjPM4cZ6jgDKh9erscDDn/IWAWTbi29ByY3NuA18sSgrmQ5u1CVpnaAj30o5ExGOY
	 yHL8kY7T7UENvTWiH3FzN4xfUIUy/GEXOmXLYxJ9yAgnmpXNWUS3csNl53vmHA15NY3UQ
	 PqtR1StDVFWAtkj6PS47CnsikQ6xHSpy/hDTqi69OtXdudIQTFd5RHyXnPo0lqqKJthmF
	 wcb8YyOXxRwwRqGLzcSYDdGmd8suV49kW/Gpd9b7yt316O6+Mkc/llVRSL7AByDhzkg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792329;
	bh=WHItOhBtwjyUoC7QWogTcco+HVuaglscfNud/7ON43E=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=iRLV5yuLBmQV+2HZ2WV7JcQJQcoSAJY7XA+gI7EuWgZJp+IJerZfR/cXKYJ1nMQEi
	 E7Vg9f/2ifIDoOCc7ud5+hfSMapewPWP22+aNpFMqpOldb0z9euQx28VZOT/cAVguk
	 LMNJnvUyIskFlRQHlVx1rs54DJNvQ6t33R4rfYKVlEMluS0af1y/iBV+HxnH4Rp1XM
	 44OcwCUQ3fpoBMvaKca9IvwWdbe+7jI+i8y2jJfquaR1VCtQHER2lZDB/YOu0gz5C6
	 RlQ13ShL0Vh6o4VyOLWGsGyy2BMQ6MP/X7Sg3OhC3WuaF9KolqmtIibynw1v5V50dx
	 BFLh8mYev0i9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 921AB8168B;
	Fri, 23 Oct 2026 21:52:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C8A23D9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7270F40488
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQD_HYk-yHte for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B48BE404A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792324;
 b=JDicwjsXGhGERudej4ploV8z7zcSmXvdgo1J/rfYlObrLyH+G08+1rvCyB9aJYJEm4i+
 yAv1DO0Fhnrr8yWaXQCFqipsYsKYYIwHcWVnqwoQ0gfYF+5NKyYiK5cL2hKRt3Hi+BzDb
 BUU8ybh/HbHPlUhduJy9tl60ROF/End2VpVuseepTkmpRPGWR6vWRqxNqj2YRlsudEdOW
 GDC8S7Vu0mW7YRg4sK3iT4AUchWGOA2eMLALyfcQaJvK+CMcCKdfiduL1doSD/c/PrWgL
 805ZrVBqXc62p+mZ+F8r7mM0mFxYu4EHlnn57HOctnsUZ2opStuwgc3yL9npHLFr4Cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792324;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=Egz+iaMnbx+00tqZgFKg6rKeG8W4/5R1KHW2qoFE/kQ=;
 b=MzU8DnRvlmdVhX10rslMZ1oTVGOKjJO1ulDnXoYoughnUt/+YOtQlp0I/lv/zpAcI2hK
 tr4DCawmchviPefSqhOdefK12hQr+ruv94bOYOsEiIRg0+NxkHcfZeP5dksjqXEYSRpwQ
 kaZYAFHwLjUZhNRoqDrDspnHoBlj/NF23+3YYABXyFHeW3fMH+/ejvf4R1BUySXhYm2kp
 G+kzIfJ7j6airmUebaDLTw/MlpdppHEmNdQJIwmJgTkXTaY0DAdvlnUm/Ez98X0tDezRR
 PFRYVhw1hARM53XwaatzybP8vrfai5H/SpUZsWm6x0B1YErtdLNK5w4V93FH4NUc7bQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=eAo9dY1V; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1062"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1062; helo=mail-pj1-x1062.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1062.google.com (mail-pj1-x1062.google.com
 [IPv6:2607:f8b0:4864:20::1062])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B48BE404A0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:04 +0000 (UTC)
Received: by mail-pj1-x1062.google.com with SMTP id
 98e67ed59e1d1-3ac91ac8924so772684a91.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792324; x=1793397124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Egz+iaMnbx+00tqZgFKg6rKeG8W4/5R1KHW2qoFE/kQ=;
 b=BK1MDqo2PLR615w4cgGi0P/nmWGvGxjLwvc3pdxBjFhFRCKfs0zvE2Pk/dy8qMJ0cD
 H5dhcngTT52wA9ZeE35L45p6M27PGm0eeASJ/EYlt364NpCvPvsbo77QnTcGK1udcw9J
 GesqWXvyXyaZ7zx0bMIyd1gikBsSJZfTOn/CD4t0h0f6nQ7h7scz7nrLJ8cetmoCxAgG
 6GJSATBY2iOMb5S7ZjnxWZdcLyfJDE1QhlAH6EPftOweKCk7dzevbNhkt2CLGHE/8dtc
 wGH9hoOICG+uFO546i3+s0ISXP8WSmIZZe1Kp5G0l5YK2dFsFVkFrNGMOunEZkSoXI7p
 E6YQ==
X-Gm-Message-State: AFq9FYLqD8ZsRhwv/IQMlGjzb+f7tlro9lvQ+As8FzVR2OI7DEvd4Cwq
 WN6VSOroE8RtSW139/P67hkhx2q6HfnJXPV3hmddJXRaaAcHZrq227HU50O9t1aIqcBrWRuaWDa
 iagEPSustENVxA+sgQLABCtwb9/4jw/fEnP+L/d0roWkxVfvC9R0+V5owu8ETHpRMBbIsRUkemv
 OQRruvhTOXddSv1IfWVBYGnWKD8AqXmPr7JM8RLVe5Y7p092qH0Y7XuROJibzEJgFlJsCJ+mbkt
 wm4JI1qhueXTaeK4A==
X-Gm-Gg: AYBFou3CHh8goffbU6rMUG5JrCDAahi7nVAMDRSZnp5H37/DXOOM3jXsTkhNKlqkNfD
 MegiJdaqd5LaEUAOgTa7PyzZJhf0BOyE374/FATWpKdyY0nug4e/KZhFXTs1oDntizRckoagEP2
 bfnQM1tVX4lE60yxnig9eqQ6KTN461U6T33Y0QH68kD3Q2mpcplLkYyhn2bf/LZqeGmaSLt4nww
 o4Y5YYH8HYInKPd8OOfIGOTZQx000pBJGoj4dPeoli0qGuEFVt3IvuXl+3f9gKAjgLM/L1CTFz/
 HYScXRcngl8WJEq45WLsY9yHatnIkLJPiP3CXpL0vY5IOU3C1wywdP3SNm+yVwmDSXABCmQPPRL
 P0lXR3UU8ZZ9Xf9KGWSfE2o/w2cBd/bYy+VF6bY2+kN7Qqq5eXjDFnZFhl1gcnqAY2X68IKSFZN
 epjFPMW7eI+16h3aayCnhdF/PGqpvtZOWoB0dq3jLL2K4=
X-Received: by 2002:a17:90b:5786:b0:3ac:8897:7ba5 with SMTP id
 98e67ed59e1d1-3adeaf9cf41mr408442a91.59.1792792323615; 
 Fri, 23 Oct 2026 14:52:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adeba6ac8fsm176172a91.2.2026.10.23.14.52.02
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3510d0baf63so3211451eec.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:01 -0700 (PDT)
X-Received: by 2002:a05:693c:2802:b0:367:41d7:9deb with SMTP id
 5a478bee46e88-369e84bd8bcmr704429eec.33.1792792314239; 
 Fri, 23 Oct 2026 14:51:54 -0700 (PDT)
X-Received: by 2002:a05:693c:2802:b0:367:41d7:9deb with SMTP id
 5a478bee46e88-369e84bd8bcmr704343eec.33.1792792312632; 
 Fri, 23 Oct 2026 14:51:52 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:51:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:26 -0700
Message-Id: <20261023215138.2301146-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 11/23] omniorb: avoid target-only patch hook
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
