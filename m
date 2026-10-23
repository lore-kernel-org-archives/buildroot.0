Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AE4606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZVgjrTP3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 560E540AB3;
	Fri, 23 Oct 2026 21:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLlaBO4pZ3Uf; Fri, 23 Oct 2026 21:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5833E40AB4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792347;
	b=aeolYM0Vu5Qb1S0j9R5Ewk2KC5ablBnsgGAH/o4tr08V5J+vxm+75yfywx8iN/MY4Nkr
	 fz9dznWXSuPJcWSV5rECmpnOK1/jW9/Kcnclw1rZ5FC9252oQ0RVVq5EyX8XCWGm95aHz
	 hzXSJl8y8CqOr1p3Mcdi98HKQJyzwOlT6C6FmDki+53Kxnf8i6Po3PIUY89kiwoMJyJHU
	 yNe5MUCaSf8t7yl6P5PI817acjq1OQwGCDGIrYRkJFHCIdZa8XfCMOgIf+moZy6qCROd8
	 +iClNww5+e7n+jxGEslkOTjyk3UtJ2FANn3jRWd+n4bS+1ZFVEmiqZUg5cUM0W/K2yA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792347;
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
	bh=uGxXFhnM+Ltx444bLeZz5PG8pE7CItX8TCIZyNOgyxg=;
	b=W7NDN3vNy7LEk3B4Gmgenh5a+ukPJ+RaD7t6VXccCeY93vNEJyKHxR8kw8o1fYNeXd6m
	 rLwzUACJQlGin9hmDaLiG0JYJhDW0nkIrmABYEvTVoCmLJZTATp+UakcZsEOJ4/N2jB8U
	 P6al/VBqVj+gVbawmyk+hUgEXkgOtxnfT9HybStPxyMqL8RR4/St+82QjdNgIYCwjKYYY
	 ODfuWRk0uFwVTFxtRZmSFrMeyUB9LwxCCX9D3UyRCl1hf6/JUvtqCeqaUzO8segWledmA
	 LOFYrhePNRk0H/6GShXFXpXXrjT5LapCoZSBjgBbQms9o9W+4kY8etE9tbzJkMPvtXA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792347;
	bh=uGxXFhnM+Ltx444bLeZz5PG8pE7CItX8TCIZyNOgyxg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ZVgjrTP3y48F6huA69DcEi0vRPiJemOflpctfwueErBM+LXkabEQtxfb3RqLSIql8
	 +38xvDwjZeyYomkiT6dc+d1Gcc427HQChc7Ky5jgVEFc4LwiJlvYTRRchiqgRUjl1C
	 JDtDQRow1g/xf0G12r5Q12pDYooNp2i3PDsJqhI7TxU9MMGT77Ce6FotPKpTcy6LNW
	 +aSEx4Vy0J3gbEXB6wxjo0JOpKBDf5BQK+Kb5mKx7BV4zKKVu9u7p78nUXy4dx3uEe
	 lZdc/JLPDb6AT8A4ZN8d+cBSU8hCPSgaR0i9AeoJ7ax3QagAGODl7F7lk5NPJLOk7O
	 QtWQHPUMiVcqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5833E40AB4;
	Fri, 23 Oct 2026 21:52:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 883A379F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79E9F8168A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KT8f-_aNdQS6 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D7C248169A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792343;
 b=lZ57+gIDGbzPtiSC/R165XSZmnRzHl+iMNWvhkRyc7IohhuYukuqV541Kicih6o163q/
 kxXCr25retQKAl8hjh/XMuduLpDO14JpHXzdl2HeoOvRcyYb58xoKVL3BHLwjOO6jxY5Z
 BBRFf0+yHxwZqXYk7NHznHivIg0B9w+aanQkYltBasMCLqcoum7HtZ2IQhrJiw6SfuFWE
 U4+Sq7Yky2KHoOAP+peFxjK5PUgaKq1wDtBkakyRDCq3DmiUIZ5/nO+qoqDSE1VK9rPiL
 MV82/FM4GiJ4D8gTcVzYcwrcUyY9JNVmcvRvmaRI44zb2vXvq4u9L0Va05YZt9ICS2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792343;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=iCzrS0gpTvD1/MWNpXmrknF/EOB7KkXJo8x6hbjxSBA=;
 b=BLAivpGhqbRdanPtBB6qLbYq59TO6+yupwzgnb6kUSU/WGMGVfX4+rWS43MhlSJoPzCB
 sGExiHtHmwzH1wiSfD+Rh10Go1o8ZLgZ2w+PzJJu/6pexFxxaHjSfsqQXRSBJMCuh5a4B
 cpwpdEEiw6NbFJ8yvruzOG971yxov4AVCwmwBb5Iuc/E5X5p3MTqiLI0byaqe12FHZq59
 MdD097zd99LLR9BfLsMjFnJ1DJaH2TQmtZJByDgei2+Zhc7M/NBRX14JJR1+vf0In2sCW
 oGIooll2q1ykBoJJkk2+qf5Grb+kMbGX0gkphyftsmLixv89XBtZobSWlR54wPUmPCw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b="UzMF/XG6"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::562"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::562; helo=mail-pg1-x562.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x562.google.com (mail-pg1-x562.google.com
 [IPv6:2607:f8b0:4864:20::562])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7C248169A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:22 +0000 (UTC)
Received: by mail-pg1-x562.google.com with SMTP id
 41be03b00d2f7-cc4dbcf2b85so537450a12.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792342; x=1793397142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iCzrS0gpTvD1/MWNpXmrknF/EOB7KkXJo8x6hbjxSBA=;
 b=zjGrjOShAaMQ2ti/jmqMwdgUnFMPcIis+l/G9e3glXa4g/u0o54xLgyAmyX9V2Yrf3
 kfkdCZahndW7GUjmUjLlhniOB9IrzbTS5Xp9VVfvn4Jq/LsZxr8RVFFqOCruzwo4FaHy
 wkdDI+0SOSS7o0hjg+6R9+ElPpepqo3p0sB9i1+svPZr4pjjMWhc1QpoPKdYnV0Dfo/e
 IId1VExcTE0MeBvFhe/4Lee0aneLKGNxUD9F7NKFwV5QwPrzll4jSJBz2NJpIL8rkfi2
 7bdcaGYmeXn0V2mjxP74XgRp5DuncUm4QqPwuqU9uoG9ltSs3Ry32ZBMr7BBaTew0aLJ
 t99w==
X-Gm-Message-State: AFq9FYL7pFfLyZWpDYEimP3WFoEznL/8XuJautmPfAWu/3RdRWcjT2WB
 qYiDVGAIJuSSrjCV4eIu9FJK5TjhLd82ZpKUj0XMz8IRaUOgUdu1ixjSTi9u/6ulrVaWkQao7OG
 kFoS7UTkRRAUXD9IU8YIz/gglUH19CLLJh9LlUuroDk0cOR5tSjm2125YswexVQdDdJmXFYpWXR
 ReF47ciTjIH/igpZ8F5hGf88GWp13dQK39UP6YZzTIisMs439c1O4nNDZTz5GwNqHnMzYIxmXLz
 yy+0XFb82GswKQdyhuZ
X-Gm-Gg: AYBFou2gI/bQ3x+Pp/VrjflitwZhf1SX5ZvjfmCbnBa4XpChOu+gpgiCGqjrsBuqe3F
 iKEObEc0QcdHkLo3jpd40uerg63DtmsfKQt2OTfoabdy8wkIeSE9EA/e9YKs/rfeRz+t+/7eG+Y
 uRlnd3CrmbsSgCLrkPioZvbNglbo91W2/RYrQ/LOraQCvB0hG38UnWCHFWC9coviHtsLZuSVYvy
 HsgAlgiX4DnvSxDofEM7MKqPBiJRsdgR6yAAdnFngVL8ru9WkvKYj687bFNA4vbKkhO6Ndozdu3
 WDNVpYkJitlhXr9SNHODvIjlrkc7pXSqjnWy1MtdSOQzmUu74WVIxAruqkQvM54vPw3ZJ9Or+B8
 LJvufMAS6vz8wjBdFbXVm+JfvXjMwI2RDSbjHQ5jrkkVTiI6qtyggx2YDVLVldCRPTzdSTfb+H6
 EeQJMdVuS1K9jFBS5io9pqIvi9TimRl3JZNbUfCZwb
X-Received: by 2002:a17:90b:48c5:b0:3ac:b048:fa13 with SMTP id
 98e67ed59e1d1-3adeafd1108mr445844a91.67.1792792335743; 
 Fri, 23 Oct 2026 14:52:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebb97dd8sm364444a91.2.2026.10.23.14.52.15
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-36998507c13so1434699eec.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:14 -0700 (PDT)
X-Received: by 2002:a05:693c:2804:b0:351:1bdb:e3b7 with SMTP id
 5a478bee46e88-369e84559aemr666167eec.15.1792792328557; 
 Fri, 23 Oct 2026 14:52:08 -0700 (PDT)
X-Received: by 2002:a05:693c:2804:b0:351:1bdb:e3b7 with SMTP id
 5a478bee46e88-369e84559aemr666080eec.15.1792792327047; 
 Fri, 23 Oct 2026 14:52:07 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:52:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:32 -0700
Message-Id: <20261023215138.2301146-11-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 17/23] package/perl: apply the perl-cross even
 for the host variant
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
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

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d2ad97e0eeff39fc89a58b589f19094824402756)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/perl/perl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 43820cfcc33a..e5d8689776f4 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -31,6 +31,7 @@ define PERL_CROSS_EXTRACT
 	mv $(@D)/cnf/diffs/perl5-5.42.0 $(@D)/cnf/diffs/perl5-5.42.3
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
+HOST_PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
 # We need to patch perl-cross, but perl-cross is extracted over the
 # target perl sources only (and not the host variant). So we apply the
@@ -46,6 +47,7 @@ PERL_POST_PATCH_HOOKS += PERL_CROSS_PATCH
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
