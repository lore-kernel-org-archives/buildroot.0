Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88192606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lNyg+CUi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5670B409D9;
	Wed, 28 Oct 2026 21:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sh0Cnk6_nXEU; Wed, 28 Oct 2026 21:38:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 656C8409C7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223485;
	b=GWjCpaKW8/HcReABTl6GxPBKpawwr35aFOOsFtA7TIdV+MB6/WheOt4+2MHheSYUD6ew
	 0Qdvtw1C/lxTCi4rSR/+8SIa+UbXmrCium+pqFGLdnYgVQPhnTOFloCjSe3blfuQhkv8t
	 iimAZpqUT0DIqd9xz5Wt11gdXjoPGDfIxOdbHVmuupdMzwPljsVz1Czof4gDFbcQLG79E
	 rsH//EN6Q7FWdF3NwmsSHdEsKXSX2RSGLP/w3Wj2hmiTItKJn2v5cQfuljp1SDb0MNjZn
	 OMYH9gIWlDn0hLajp0tTQpByTU2MoJpYKOkdzZNtybwJJReoM//6HRhzKJPCGxWDcOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223485;
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
	bh=fvWqMFyqklWDeRyyvBVaHBfqmsjO8OYcbDmMo4X9FUI=;
	b=ebseyPaG6Lbwo/0DHuB2t3/ZT0+WAfRlMm4GYCn4rFAsOxQZinUYeYKFVd5UqW2KD0LN
	 Tea5f+UT5NKkX4OKt9327IIo6Ki2TkQGQ8bK/WOQT88YsrUsDJsw/KYdvAQltqphFiJTx
	 SUJnaPuJe3PNdj9W1Mohyru8T/HqFRalsdv1MXAv82if5xX+Fvf57UqOms0Mp7YZ1pIaI
	 887XM4zOgdz2q+WrjAvEp/jm3KlTSBBvncNgBhWQ3v1WN2J2TmgHnQ2QDBkL7MGDSCy6i
	 YzYpSXI/feHpYiDWsWHLv+0iYkqSReU6J9e5XOZ/rRonAx9CgnlhW6E1IJ1RR0ap3Sw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223485;
	bh=fvWqMFyqklWDeRyyvBVaHBfqmsjO8OYcbDmMo4X9FUI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=lNyg+CUimQnugW6Ohb/yZZNWbgpKwJBVOAq+BlEIL4DHRFGk1CA8hxeNq0dzSH3Eu
	 Lab/fzt1hG3RqkevltiinsxxNpODczs96P8zHuF09SsDLSG9aykezxgAe8P1N5UN17
	 3sABRcayC5i2ZpSZUPy5UmRqnRp5kbBY6FV2kFBic4L42y6oL/gW2aNriCH6raLHnK
	 nsbQTbbOPBys3aZbXdrvIotZbD8eW2g1LfaiF/RbjFiFIQGd6bs61GDGfJGeXBFLrg
	 NHBT3mg+AS1J3nflfbDKgLMBLzGOnxkwvgS9yfiXIYLHQBhcnmqbiUvzi/3xGqIlq1
	 Y4Ug+zThc+Ilg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 656C8409C7;
	Wed, 28 Oct 2026 21:38:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F6C02A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3535560748
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fKhnE8LTc3O for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:38:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2826C60725
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223480;
 b=mJ6Z6qSJYejjYuzORfVDM0NOgmjRKo9fwHvWAFxJ8EKcZ0eyg6v1yTbAkrLtsKbFrwk+
 kxlAnBVvPaX/Q2+rSxys2Kd50lGDu7GKWPxQ/3y8IWIQf4+I+GjfRpdI9JY7o7rLpM6xm
 1dyyMRv8K3thARfo8oJ3YX9lnEfOIKnZIWLKZQ7lpzJUgbWb4qkY4ECeUEHmowWEk0xXK
 m9DYiscz+0QdsZAqCAyKIBUTx9GHdlkM1rshZmXOeZ/5ryqPFpLvHKEW3IiW3wkePVwFZ
 1T1EupuFFsu3BA4kgRSu050nna3dSmpverJhirqy19uohHLsF6kfLXGbrshyl2pkd4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223480;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=hwIEBEa8Un+wP5fcgCJDVfrrM8rNnrFhEpqRy5mfUoM=;
 b=Mn3As3bQKPHtwkXDdpEm/AeDtR/+msh7rIb8tREQHeya/lE/x8+YB3skLzuudu6NnmIV
 KhA9+6LOFUt82RHWwvIQducaMunAkXlMnEuDXZ4f3Gp3Bs1O2pO2M7iJdk0FmLE/jUWee
 f/Tw/PjyFogTocQHrzc326BgxReoa4zfA3CofLVOl0GIPngrBw0i5WcSeHuOz4kvJORGC
 m9nJdifo1fHfl2OjnQSWd1wP53AGmciz9q1wPXhcxSO6jSawphBor6JtJ7Z568ZnDqtIM
 3w8XkRMvyssKJ/cvt1sett9WygQbZXSDWGFgaw/LUCrFt5q53kqxmPfnvyMqKC//s4g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=fBZaPZgr; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1061"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1061; helo=mail-pj1-x1061.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1061.google.com (mail-pj1-x1061.google.com
 [IPv6:2607:f8b0:4864:20::1061])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2826C60725
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:37:59 +0000 (UTC)
Received: by mail-pj1-x1061.google.com with SMTP id
 98e67ed59e1d1-3ad41b47541so1226046a91.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223479; x=1793828279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hwIEBEa8Un+wP5fcgCJDVfrrM8rNnrFhEpqRy5mfUoM=;
 b=V/y41icS1vuz52UPk+lqkzpoQVJcnX62trs2iLG9u8vS6YAov4UhBBqXvzGIGa9CSV
 dEK6yk56G8vjajoC7ZKsWgRTl7dVvc0xdNx7Q1zb1GyZxKV9MUD/I01b7WK5Xpp0xF6t
 /LAnzN494xU0XiO0FH8CTMNkC6c2VWrGid/NJ041sOR1ePIe9RUkBwT4vnyUnI21Bf7l
 yDUztLt8xCo8eVJLezUTkJTMeckvH0Lo9ctmPAxi2WrzmVsMjrqrRTIiAQO2/qDkb6F3
 jRN7P2EPYjHznq+TAvcFL92/CHNi7MLWm6tXA+2OA8qxN2+W2dvVm02FsAvWL68E3+WC
 0qnQ==
X-Gm-Message-State: AFq9FYJC9zuxFLVAEldBrIcPSp6rD66W8FTlNfSGEdLQQzwjx1z0s7PV
 g8x5eljGGlrVsq6mV9L027cedQ8Aq0ukRXCwuzz+sA+O0JomSvfVzyTU74TiZD098JHrjUYvAX/
 3mTUVevPqaQSZY5sEUOmPulevwi2ynatUd+Cyqzj/rLKGeXeQHKsWjjZBdfUY2HrCqyqfB90Qk6
 rwSJ3biRmh1hAANfS+328moC1TIaRZSRxGJBAfHkNMScS7POjKnOGYnK5PRcInBMkeO0Nx4xRCh
 KhYBKchvrEReEzO4Q==
X-Gm-Gg: AYBFou2NYiTaP9ErvlNDpDH4ivGFbU+DOXV1tf9YzGR/PT46B6+tM0/6Z9h9daXVLzX
 spOJdvE30zrdqod76sIBN+wqxKLDNKvAimRrstv0VAIr27sQk/GN53IIheuhQpAw0lKbl49Y8Wh
 WzcxkIVDspTPGlZ8w0RC3+Z7P5E8B/w550OD/98VdaVGL9q8bLOBFrr+RHddPtQGxjJRSKGMnwA
 QdVKzNdZbuPkC3vv4fT0f2xumzKz38vWgz0yNkQGIHHUfZFFg3PCZYDE9xkdonyCBMDqs2EBswv
 yAv4tlteoSEM9QaFjy+snqrLvO4Ux/ELt1LH6QGa0RNYTHnBzDhDXMjSei8d3JKtpah5b0rtqK/
 qRtmCVy5Xl4y6G5E1je55UG+6KnuiyfLuYYcfVr/7ns3wCkzgSR1OP67bxyMVHRH0lgFrpFFgr1
 A43hPauKp9y1aBP6LLmXzMuaGq+tf6HituBVxGv4MUadw=
X-Received: by 2002:a17:90a:ec84:b0:3a8:5cab:1009 with SMTP id
 98e67ed59e1d1-3ae5829a864mr2776279a91.46.1793223478840; 
 Wed, 28 Oct 2026 14:37:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae6e88749csm536066a91.7.2026.10.28.14.37.58
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:37:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91c7bb3e2acso28395906d6.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:37:57 -0700 (PDT)
X-Received: by 2002:a05:6214:29ec:b0:91c:1fdc:467d with SMTP id
 6a1803df08f44-91c7d1c8f93mr59396036d6.29.1793223477491; 
 Wed, 28 Oct 2026 14:37:57 -0700 (PDT)
X-Received: by 2002:a05:6214:29ec:b0:91c:1fdc:467d with SMTP id
 6a1803df08f44-91c7d1c8f93mr59395386d6.29.1793223476877; 
 Wed, 28 Oct 2026 14:37:56 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47a69129sm139827476d6.4.2026.10.28.14.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:37:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:23 -0700
Message-Id: <20261028213744.511429-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 02/23] infra: introduce a global SRC_DIR
 variable
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

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit introduces the global SRC_DIR variable, to point to a
directory where we will want to extract the packages sources into.
For now, it points to the same directory as BUILD_DIR, since we
don't yet support out-of-tree build of packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998@free.fr:
  - rebase on master
  - slightly expand commit log
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit 3471f1620f8d78c5533d16d1c6d73b58e3e69962)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 9b62da3e4065..c1f12a4bfc38 100644
--- a/Makefile
+++ b/Makefile
@@ -211,6 +211,7 @@ endif
 # Avoids doing the $(or...) everytime
 BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
+SRC_DIR := $(BASE_DIR)/build
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
 BASE_TARGET_DIR := $(BASE_DIR)/target
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
