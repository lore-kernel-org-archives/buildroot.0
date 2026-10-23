Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E387606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rLcWIpIf
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5197F40A8A;
	Fri, 23 Oct 2026 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt9WffupQFGA; Fri, 23 Oct 2026 22:00:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 60E2440A8B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792830;
	b=h1Unevu7rRLZd8V+O/PnWtR9EaoxXYy/47lI6m2WqTGdvPI3nBE7Y+hBI5pqUEEMdjko
	 BnU57JSeSnnf90j3Ipzx3kXzCcYjGuojiNnL2pNSq15dwx1ynhA7yWC4TCwOp+q46kOoX
	 VBF+r46DRMP9ZtHZF68sDYb7tleOizcCoxd92DUFH/xdfHmtcB3GZg6Ud6JE6GHVGTBX+
	 SjbtWVeFmqNlrn3TTkBQeh9U9k2za1553Uc1K3GrKFInP5PNXT5fFLXYbF7krFmIdffoZ
	 nxFpEk9geuKryIc1pw+auauoDmlBfuqPfx1hdoMcJywHiF1mdSOBcpSdnDk4SIlvwCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792830;
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
	bh=aBnCxTTmB9amfzDlc61qF/9baNGpILEuAV9frJ4XA1E=;
	b=pAwNfB4W8O1xUkjxghz8IWhGQik26qdshv27UlNj0g4l2onjVC/YKUdFDex79r+OmBC6
	 8e79yBBJ6kKyHlGtFCaMpqQM5TnZR8hfjyz07SwRgfJDOlgMM5QIgf5XxAIE1rN49dnRj
	 FiJ1uUyTFrxTWomBIh1VwGg/xWjohUZ6l+1D7Q1WGNWMRxiVMIC9pDhZ9ICGN3kjJxnWq
	 1vs8Vkv8TJjE5Yei2Zey00CI4x2rbNY3X3LDk7XxwMilRQCtEgavtiUbPiDrhZgn6zSGq
	 Tpf1IiCiPPD4PnA3HfTNRaHwaUSsuwiT1LHC8R7QYlLjL5htxeQG9SIxUz4167FwZpw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792830;
	bh=aBnCxTTmB9amfzDlc61qF/9baNGpILEuAV9frJ4XA1E=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=rLcWIpIfk8c0XsmVWzo70mlaE9L29N1O7PryiO8GpOV1tAqEnhUeYZRFHtndslFEe
	 RSgKT6RSxqbq5NGSUUJFoaAWRAXrPuXPLIyNE+NvWYTOk9Mmego2UrVhA/0rLvX8zy
	 8YGtln29ZQZnZIecIekTeyIRTgJUN0eRcy/LR5HdhMMTTCOl1XvtNBRV/ricF8oMRC
	 kaIc4OGNJCBKg+CnN47AtE2IpZVCAwZMD8CORt2zRfqoMGqr1tWmzqjYzX75IeZhEY
	 HHLc7GEoiqQUEu9hIsa4gmZvRnE/OQHE7eMUdxoxfVFa0fSkqob3Xs7r8e+L9xCI3F
	 4VO1sJKiFGSOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E2440A8B;
	Fri, 23 Oct 2026 22:00:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11CB979F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0380F40A8B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHjeQXmL7A8k for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 22:00:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 36ADC40A8A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792828;
 b=Nl/MptzZNJGWujyg937Y1oy/tserP64FD47Apti33ulV5pJJXlqhmeUJn1SgrTzvOsnO
 9/qW9cvwDRd6n0vlqZH6/t0ekAhJ+8UqUik2okVwR50SzsJ/FxY4mE6FH3yC6dMbk+UUf
 qu+fSFwhk7um1SZu1QxFWr9PZNDXgsrJlz9/u2Yqb8y8EHIJk6oFR9jDcxLAIJ+z1He0b
 CfJSZcUizRh1Uue30kR8BJMYgTP4d4WN0XOFk2VgkfjwAmgP3q1x4pNNLH0lX3Dy0YkWI
 dCKw+vLZe/C93xBcgKyN2Plli5jPox1jSf6spuoBzB3q4RQFei6+McwDPqRlv+QE2Rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792828;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=cdJueYjSXw7ABmj5uDwRhBX74NDbYR/11JH4WNqR9jc=;
 b=SGGyTHoLqitnYyuxRV2iEGPXFRQw2G9KvEW3obo2Ja5mQcGuXdfYHo2eiTEmT2DuT8cs
 sLw9eZ2hEXqNEbqiPY0lqB4sU/YH2x+LoQogxtJ6TXMqb7MVuXPxf0s220b2JqAC6T2Bm
 /Qj+rkIny5ZkI+oVpyFVHmIVUgl3Xl334dmIm0V1+FgysfOJhq00d7rcK6x7LjyKL6xdg
 Z9+6aCU13+8igkZlJ9WB5wqIrsVjJ1NIgnUCKQYd17ccjJ0shNDwe6B9VJMs+YSadZ31P
 FcGXH4beXarLo65GUA8slxRuV8eOR41TwYvgBXSh1bybyARYVamYgqeWWwprWwKHLKw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=Hbp3gDpR; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1062"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1062; helo=mail-pj1-x1062.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1062.google.com (mail-pj1-x1062.google.com
 [IPv6:2607:f8b0:4864:20::1062])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36ADC40A8A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 22:00:27 +0000 (UTC)
Received: by mail-pj1-x1062.google.com with SMTP id
 98e67ed59e1d1-3acdcfa2bd3so1046510a91.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792827; x=1793397627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cdJueYjSXw7ABmj5uDwRhBX74NDbYR/11JH4WNqR9jc=;
 b=pn9r6FqI1O3iC8c1ILrFMn3M8Ct6HUY7lBrAcP7MK+BnVTQxSMLeCoZDqIYZfXzP0D
 59xzL8iRM1wevkknz03RXhXcxSGhG6AwXsDUtEbcBgnTgCweRkcC2iIcDcRfsuh+Zhbm
 GGuowg48XMZ4O5e+nbI921oe6LOugsIVmDTp8NJKKCq+PR+Gou+Ii51fEdHL7MEa+Vim
 w8I9wf6cQsqQUah0+nhEh052/inVVrh133x2D3rtfiPV2j5YMttemz533NycaLSDEqey
 ylEFJc1FyAKwHsFVzYGLsbjW2k1yWWPUaYvDI3r2l59Xnw+v44kAxybCGy9xQXFQODXr
 R6ZQ==
X-Gm-Message-State: AFq9FYKGsBcBdiezPdQ/bdLEWGJ0mbOELwIvT1cbQbYfjty1lsbtxUMT
 NGMV0TY6p4cx1ZZvST8ShfYi8VFUtoQQQIQOvi5yDaRbZvvst3yyg9dXFF6Y04kmXz1PRPN7bRC
 6ScR/IPwaTA02NUsK0Yb5nkRzkGeSgoXoKkK/esWj86LxVXZ6BFzjqHDLR4GiFQ5isl7XJ2U21H
 yC8Fkx/wnJeztK53NGE8M8fT0XfNKyV596FA2HWjE/LT2fO+00CnvUWbXWkV36qOyKUu4d8tc8Q
 winLmpwh2dAx7BhAQ==
X-Gm-Gg: AYBFou0RzU5ZLT6/wiXL34gnZ4u3DZ4w9lL1zI61o3izXdAcTqPZY6XgfGx49QUCPst
 0Ni0ofGwPg50onoFJBpNhTb8iTyIjkiCH7IWYeSUhUGUb8unHvizhIniDzVgJMlYP8G/NGvWSLh
 y9Uu1fcoDdXvrsvYA8CPHlGPA+6sAZRzOeiDfHmklnWldVqP701YvkOBN5TiK+UfsiscBJCu89j
 +HJ2v8pZCApuO7QTe2j6S7vVwQZWu3DdWKModVzXbVIMgHQ70EXKeFJDiFtGjmfm/TskMUmmhtl
 bUqBry7usfArYyLStftV+8/XJEJ79GZzIrwNPWCPy4aLFQ9cpgG2sT8Sh/0OqTLq21N2J8ljIGl
 JIGqTPp4wi6gZF5J7iUV3akT2F14Hre0/GoIue1BBeJmKi3VQqKlQVxjmKAJ7tUSI3KDTODYnKw
 mevnNZbt6HchRJMX56f8gPaTCxpv09EnWkIxSl/JXUm2w=
X-Received: by 2002:a17:90b:5105:b0:3a8:49f2:8ddb with SMTP id
 98e67ed59e1d1-3adeafc9a9fmr489332a91.60.1792792825548; 
 Fri, 23 Oct 2026 15:00:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebb97dd8sm380895a91.2.2026.10.23.15.00.24
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 15:00:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-8210034ccc0so1900039a34.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:00:24 -0700 (PDT)
X-Received: by 2002:a05:7301:5511:b0:339:7b3b:236d with SMTP id
 5a478bee46e88-369e84b8e4fmr740670eec.15.1792792317337; 
 Fri, 23 Oct 2026 14:51:57 -0700 (PDT)
X-Received: by 2002:a05:7301:5511:b0:339:7b3b:236d with SMTP id
 5a478bee46e88-369e84b8e4fmr740527eec.15.1792792314674; 
 Fri, 23 Oct 2026 14:51:54 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:51:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:27 -0700
Message-Id: <20261023215138.2301146-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 12/23] lua: rework post-patch hook usage
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
 Francois Perrad <fperrad@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
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

WIP: YEM: try to see if we can make that a post-configure hook

In preparation for the introduction of out-of-tree package build, it
is important that we don't do different things in the patch hooks for
the target and host variant of a given package, because the source
tree will be shared between the target and host builds.

For lua, the post patch hook was modifying luaconf.h before the build
to get a 32 bits Lua build. However, passing just -DLUA_32BITS like we
do for other Lua compile time options is not sufficient since
LUA_32BITS should also be defined in the installed luaconf.h so that
other packages linking against lua get this defined as well. So, this
patch changes the post-patch hook to passing -DLUA_32BITS in
LUA_CFLAGS *and* changing the installed luaconf.h in a
post-install-staging hook.

Cc: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit 827ed461ba2b00acfebcbd01e53d93a148594833)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/lua/lua.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 6dbdc950021b..92910f8fe746 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -66,11 +66,16 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_32BITS),y)
+# We adjust the CFLAGS for the build of Lua itself, and then the
+# installed luaconf.h so that package using Lua also see LUA_32BITS
+# defined.
+LUA_CFLAGS += -DLUA_32BITS
 define LUA_32BITS_LUACONF
-	$(SED) 's/\/\* #define LUA_32BITS \*\//#define LUA_32BITS/' $(@D)/src/luaconf.h
+	$(SED) 's/\/\* #define LUA_32BITS \*\//#define LUA_32BITS/' \
+		$(STAGING_DIR)/usr/include/luaconf.h
 endef
 
-LUA_POST_PATCH_HOOKS += LUA_32BITS_LUACONF
+LUA_POST_INSTALL_STAGING_HOOKS += LUA_32BITS_LUACONF
 endif
 
 define HOST_LUA_LUACONF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
