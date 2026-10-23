Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF359606A335
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IeSKZDwf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCAB960608;
	Fri, 23 Oct 2026 21:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mm_0mbpIEnb; Fri, 23 Oct 2026 21:52:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E84B360A66
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792331;
	b=I0Lk/gjlVSdwa3sKt7EnA6iWWic1HUx24cZotp/A6CzsOQHnynoZEC8+cU+Gg29aZERs
	 MDoDF+3lGZYp4KQdrSqdap895NrCyUKGbT9aXcbf/kVJN17joxS4dnDU4gXER90C3NGF4
	 eR5yD9agfPyMUiNpCb+Eer99nFjIlGsJFoKJeqpz/qKDq93k2p5A8EyIW0wYcupSc7R8g
	 CxblbnuNiDlFo9j3HsvVUG5eX72qL5HltUTn0g5yqnzcJ4eXdVH5FNZAWjVyAvVsx6jyv
	 IOC4mzNjyVAi0UixQJKE6bcCEUWN+sIIqGX+nP3imkPUmcxBKiKqp5svzBQONJFWzuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792331;
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
	bh=Bbiq47ON+8VBVpIB9NeeCfETJ+LofK9qlTZMk2zbVrA=;
	b=Q3z0TgqDHyyTZaUkCqHYR7rHYToMeu0albkj8hLvk3pnUHmLBoTNsLsjd4o7duUKylQz
	 Xwh8adWrGP9jaqXLcwQfLt9ANgB7j+TaC6XET0PY/NlECqUeoS4dQQnLTwLNj45J+lFu1
	 eCrp2OmgaZMOMReHCYSjyR8lrO9Dl6YYcTQ1UmRu/9b5iCiDAh/jtOOJPtBpQKV+tytY9
	 jUJMkk8K+fz9zQfYWAYJivyN6QdfHmrEM2EWorVt+sF+L2np02MFaJEmoSxV+8jEmPriQ
	 Av/1vd0sgl2NutA9NTnj3V6CLRBmw8Dxd1fbr3w4zLdKQ0YNRdBPSSrj62hz3G6wZwA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792331;
	bh=Bbiq47ON+8VBVpIB9NeeCfETJ+LofK9qlTZMk2zbVrA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IeSKZDwfyS/3B3Dm6Qu0iucQxu+krT6NaTHeVJBfpcq7s4/npuUViASyhLbJSnnMo
	 7VfCgGY2Sqi2uSglcOiCV66lbWZI0nLDVJ6mht9fNObpjZljrrp/Qs8hX33P45h3XO
	 e8tjK6fQHEx2bKoGPCzWjnKWwM6bBt+ow8Yi7O+LfatVK2ye2fZXKcOBVXO/5qQ+sa
	 P3QMYgCmqf8YBeUvI/tCP1eabwvGfod9poYOnWdQhcw3Y7+NBqUSlU4EDXZ2XbluBi
	 HfgKiCNqATqRFDVZweX1vk4//UdCRmGXxxikzPu14L0M5GSnbxtN3y25knac+NdTlu
	 cVXDHOlox8N/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E84B360A66;
	Fri, 23 Oct 2026 21:52:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E8C579F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FDC88168B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 000LgEGrzn24 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B2B28168A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792325;
 b=MN4gmroPwSmaAkFfArsZeFCecaDykRjItCPCyEjhApc3R1O7sLuFjSzjQpX3kJI/AnQX
 9tivw+91iIlXfJs2l8oCPw36gIVK01yJ26yXBEZPYC9zVb9f8WPO5QNd2Fy9yX9C+BCRS
 twJkiKUMpNrO5UOTna692T6LL/cDRBW74ksWB7zc4SA0kmLE0cPq0pB5ehiqU6ACiHZQo
 12cOFDcv7Prp6Gei99CZoHTCI21NIYEA98eWpz0nCuvuyAiA4psl2hQXFg1JuePBtK5dC
 muFX/l7xe0N4/HbqKvni8rqcj8pW66qB0JzcNlND/RFETUPIFTAXhurA93FwyDYTbNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792325;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=V4xeKQq1oy0P20f2dq1vP1ChiNYZt/CQik+/CmaHBVk=;
 b=bmrz1V5CRlJr4ew2LWE97Gj+CltvJY9FAo0DkFiiafLBLFhRc+DrPNurJdMWGhyLA2kT
 Vvoqzdkfi16Cr2jqzthE2IIKi067bP15t6xuvAU+0BEcKsaEf6sEja97D/IurcBK6/Hmn
 sesgMQIy6EyXFOvzKKKPoNxS4fX+oIK8l4HQ2GKLlXORCdjMxBhM7dLoMFtb/BXy1T/1m
 inD4KzHQeIby4uBBAeiwuojEpAjniZcdrpey4o/JSy6bGQRDTVjo5ZLiDkVGb5lvwyoZA
 CA9LZlzT99tlu3duNpU2sVADWUuJiY8VY6XMD9WltTtr8LhLdwoYz4HbkZUKUlNEQlA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=eFIfjG06; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1063"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1063; helo=mail-pj1-x1063.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1063.google.com (mail-pj1-x1063.google.com
 [IPv6:2607:f8b0:4864:20::1063])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B2B28168A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:04 +0000 (UTC)
Received: by mail-pj1-x1063.google.com with SMTP id
 98e67ed59e1d1-3acd21ba21aso1045322a91.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792324; x=1793397124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V4xeKQq1oy0P20f2dq1vP1ChiNYZt/CQik+/CmaHBVk=;
 b=ypPgjnv6QojQlgj6YLgBq+Ozv+jk/8MdkCwSyHCpVAdWw9n8kYg5fuq/pth7KSylTj
 B7NAcw/7y3RdL5AaAcH7Jlea2jsDt1VkMQZ/tV5ZgbiQG3qtdJyzIN+N+OV43X/ax27X
 Meduf1IrDpMpT/iKmlU0rVqbyYoxmj6+vuTF9A2hkbMWwGlDXrlsO39uY1eja3RnGymw
 AU4FvNlzaT7UySAcywStQ0HJTYrEdkhyK7M+OUvLqSzVEI7bcwyZo8rMjzjiovhUeWR9
 yjplkAdI79+5BirjU9J8rsjG2pnUjeG9UdJamsL4Mf7iZM9kuMdPolXwYdLR/03YNckT
 y1Kw==
X-Gm-Message-State: AFq9FYIaSELZvM8vrzdWmBdsXGLKkzXS/R5CZmZmJm7PAaR4WsCyh9Z2
 6ZG8yquF9DXofcvVdT9OdRKShqkvg/gUzzQ5qZGwJEXPwHf1tgOFXEtuOFL7mTJrEjR7qoYmrpN
 xz+ka5gWgkBGI+LAP80OveFW12i+EHXqUtiEtepBSHC+5nviu2RavQLvXOM01y4f5NkdfjDwDXD
 1HEdqyaleXYIRGkpnw9CkKNv5aqAdBluMpNa0erADlw7J6LTestOS9uEss6iTi5yOgv7DiuO6VZ
 8HrH/WbjENCCO/7LYCs
X-Gm-Gg: AYBFou0tP1m7XZnhCr1kGEKoKp2zWE6vfALKP9tCh4iMMA1i5io6LBX6prEK6WGxzbT
 PTX7lHn+WXPZelK/kqhGBuV4yOz73s7ieyB8wjcpWKyIc03INee5AguvPLCP5g/2i+Eu/0Y29lP
 rJFO0CK1qhLFjF655MZBWiPdly1vKV+vKFIPYiFDFsJ3mFGqsqI8kScsvZdbsqNJN8F1/HZMBCQ
 qa73tOLivhsp/p4Prr31hWe10xFbO7Ux3CRTffbLK1tXExQd2m+urhrlgCvO3nzLvqVn24p9Joi
 fYRLiq8341XlhhnJcWC+/qkmFJCtsW4kPgwFL9yGJye/OSyALIeW8ViDCu6KqFyDpmXfhWewnK8
 cs+q/Le9kfp//hJiAMn7c5dt1NobOIC6JXZhok00Z4mPCqogMN7ujR9ap+Qg6VXVVzh/avNoOU4
 G8OpVqIiOzjeIy/8xyWIaiFFkEC+S81rNIvYBMXFPs
X-Received: by 2002:a17:90b:35c4:b0:3ab:afca:1d79 with SMTP id
 98e67ed59e1d1-3adeac05c8dmr419744a91.21.1792792324182; 
 Fri, 23 Oct 2026 14:52:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebb37c12sm170831a91.5.2026.10.23.14.52.02
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-33c35f5ca6cso2282211eec.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:02 -0700 (PDT)
X-Received: by 2002:a05:693c:8642:20b0:35e:9c54:d41b with SMTP id
 5a478bee46e88-369e85004b7mr914843eec.21.1792792312577; 
 Fri, 23 Oct 2026 14:51:52 -0700 (PDT)
X-Received: by 2002:a05:693c:8642:20b0:35e:9c54:d41b with SMTP id
 5a478bee46e88-369e85004b7mr914735eec.21.1792792310825; 
 Fri, 23 Oct 2026 14:51:50 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:51:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:25 -0700
Message-Id: <20261023215138.2301146-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 10/23] packages: sync host and target patch hooks
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

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

In preparation for the introduction of out-of-tree package build, it
is important that we don't do different things in the patch hooks for
the target and host variant of a given package, because the source
tree will be shared between the target and host builds.

For the gawk, icu, python and python3 packages touched by this patch,
there is no problem in running the target-only post-patch hook that
already exists to the host variant, so we simply do that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit 7d6a8f1ace39bbc96a1deab5c5c41d6c16ebf36a)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/icu/icu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 9b97011f5587..d17b610aeea4 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -67,6 +67,7 @@ define ICU_COPY_CUSTOM_DATA
 	cp $(ICU_CUSTOM_DATA_PATH) $(@D)/source/data/in/
 endef
 ICU_POST_PATCH_HOOKS += ICU_COPY_CUSTOM_DATA
+HOST_ICU_POST_PATCH_HOOKS += ICU_COPY_CUSTOM_DATA
 endif
 
 define ICU_REMOVE_DEV_FILES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
