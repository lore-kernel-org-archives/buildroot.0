Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694BD606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cJlAWPup
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4049540AA9;
	Wed, 28 Oct 2026 21:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7w3VMBpYTsn; Wed, 28 Oct 2026 21:40:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 01CCC40A98
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223628;
	b=bPevkzj99LwsKsGWqZtFyQDXL3wYb6QPvj0ZM/wcHpIeKpg5QDP5imC8othFXXkAp9YQ
	 wKSqT19kXg9nGByogNjPnJM7OfW12hMO+Rk5Nxxj5mLhOAFdW/HnO5YiCRqq7JvV8qQkB
	 LAKImS9uhl2o1MJUErtVnZsWprCr+6tv2gQBhAZnRv2X4j6CBVO/N7vugmdYVcEY9R5GN
	 YyJ3MUS0K3CVPtyW1/4gcq7hYCnNWiyGqp2edZg8s75oWnuMHmRnVCxZDSWq0f+ZmZIg8
	 GUz7LNzn25sTMEQC5JSPc+tjGXzTmS3tqX0x8I/vkuQ/X3cA6BNH/weQUT3trHVPjxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223628;
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
	bh=FHLPC7IS2/POlxHL4koNLgJNfSVSCodult6qlUB23QU=;
	b=n/Y0ilwG3xdI39a5HpZRTrAvMnSYNu82PtexucpGBNIWA7CAeDLF82qqvgugDHGD6Lvu
	 V4jzTX0yY9qtHM7sbalFIy/Low1eRdyrLi7P0kQtVVxFuDdR4Oe7jmmWY/FlYnR1BGVRo
	 U6Jk2PcTbuhP9YPp2m2nSyj3aXfszC4d6OmhsuVROscbJYeennhwLuC0RjQ1xBo0QO43a
	 iPAos8ff2M9UNB2VhakCszROP6GCUnaxzdlYpAdGKaRYo5/fS8aq3vaDYNyXLILjvzbXF
	 5rb2Dm3/NSdHt2iHUHuoDPv/5VFZU+xRwH8UQI86ca4IxnPqWLvaCX0mjNSwgJX88Qg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223628;
	bh=FHLPC7IS2/POlxHL4koNLgJNfSVSCodult6qlUB23QU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=cJlAWPup6tQF8u7Rid73EubbGIGwGuL6Ob2SpTYvMFxlHxjI7Xd3gTeNXCfI7epiY
	 Auy1ZAOIVE78UnU60/xzmUTxEfmaqmE2no5iD+/8c/y4IiMzUHqd4EPFxFv9nJlQrU
	 qecjDCYmGYtBoJ2FUhvZaXw47LQtP8tckv6z8AJ6HQstMGljSj7jQRvSxn0FNGgvYB
	 ZTNvJ38wOeFF8ja4GmmkvRYs1wyI8R6dYVYtrO3rqQDiVkacZNNnMXx4jyo2RRjXdN
	 L4kQYqJmYN/ODwwr+VmqiQhhJ4KTQSg1gVHA6sg8ZFIMKe2r0zDc32xhL2uQ36mOon
	 uwPBmIdla3gAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01CCC40A98;
	Wed, 28 Oct 2026 21:40:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E3AF2A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 701FF40229
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcMMgei-BVVS for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:40:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CED2E400B5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223623;
 b=DOgSRQejeI+hJeAyg1jaAsfgSNZP2c5Bn8k+raa3FNcOBMM5Vwtpb74IaqIOoQNv4bRj
 Hj6l2XnQ/C7zbMdyM3PGr2f5JYgxmnjOMfIBCN+W1TuCtXQR0sEqbTwiABb8rm4jl9L61
 KeBuXW8Oby2bfXaSfY6n0VorJmEg4Pafzswj4YXxYD5o0Kki5+CzsQbsyIBuaaIb47nwX
 WmnJLrC3HSa/D20GECqOVTeVBHvRn+tKfrxZurRRvhf7kx+W2zSAy48DK8VNKtrxx/LHa
 nMExjfX7pbiO0ORFJ3iJdU2PtCXGorwvlasMfuseFsh8/W8/2hyJGRgUVNRA1HHdk2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223623;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=fDfqmKdnVAt9cLjLpG63RhgYIhl44GJBMMKvHmjxo4U=;
 b=HoX1OuzFxznR5HxnPbdU8WHlhBq8FFc2G8WzHgxfnQzWirjowpVAoqulnpka/d4NRpEc
 TujUClKydFj6M7ZuJ4zyhz54eA0yebXGRcdFijuro8Jz0nf8N8XAkbckY61mWT4cyZunx
 /P23V41q1OsFz575fXb5+FkRURvVd/lnIDkhwFEUH1pMMqMHDaLt+y0ZPj0vNP4HWWit+
 TCTf/Xe8bSSACoFxhX+4PKXnVNmNBlw1Bu46umVoqziVIeiB31mMbxt/frvJA6CCOE5MD
 MQ/YqKFG+u/JwVwAzHccWUgaEpjR/mniDdANw3Jllx6XX+NjhGIVNE5uYUy1ZjimYZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=SBFGi7LC; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::563"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::563; helo=mail-pg1-x563.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x563.google.com (mail-pg1-x563.google.com
 [IPv6:2607:f8b0:4864:20::563])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CED2E400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:22 +0000 (UTC)
Received: by mail-pg1-x563.google.com with SMTP id
 41be03b00d2f7-cc1bc88a20eso939631a12.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223622; x=1793828422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fDfqmKdnVAt9cLjLpG63RhgYIhl44GJBMMKvHmjxo4U=;
 b=fKePvC/Lm5bN/F1Z3++a3MoYb/h+Fn7k+aHZ22rxlHyZm58c00aPpTEeFEqJqnNr49
 gJNhEehuEdQV1UUNVkKTPSF/1BalOgO+mez8iYVqOXvFcApLyJUEsw5zNcx6xrbhAzTr
 04WVKhT+rQvn+DGNBNEFfbDbi7ReXqdEnijqtka196HLFdX0kQ6vhJkhdKo+IfzyMoKS
 B8Nc4qR3fgSmEC2p7tXy2kKrO1KeFI3GNQfx5B84l8lOUjYs21jOQyBfqrVTTl4g+qK8
 XFelxVo9qOtIpMxT27xo2mRPzl4coQQ2SkgU40YRvMl5FG3QUDZPGXMgeJ3667NgsD3X
 9ViQ==
X-Gm-Message-State: AFq9FYL538nTEjiDxQ41obJs5tFcTvYM1iAz7nhW1cOVTd/9zCLzsG2G
 bSeDdOzBjQE5lrTyLFN5SO7TFkVxjSBMTURc4XzYOAlvru/R12LiZ1I6QQD7SoR1yJ6LK5I/73F
 i2wdgFyBy3IHvD0XaxpG1XTPheqsYn0PumkhO3WKUKizuFn/q/t64/zjxlzav55ClhMoQQl10ba
 kfRzpl+VPKtqJAjyzu1RVeE71yCE8ddcV+iXTcUJgjjq6R4z3hC7ZOKlv6/yzkGPN9VdeGEMbl7
 TMpWfrs548zzA9x0Q==
X-Gm-Gg: AYBFou05bL8ILB62/Fev7m6cxQW5pEexPysGJPl3PWX44rPMUyxZW+gA2k6d+FekM4S
 u0AJwuTGaLsXIjfLm3GdmYGIPLmg/716AZo1s44ZWcwzfEZaInyIfTBtmScwXyDwaiBwN0wHUJI
 8ujfp1ifLeFD6v8fxnxkh6jrDoQH0uJZLHZsNLZKWpe4BuDz4ZhKWScErkljZeZYMKmWOu84/XW
 deOr8IbojJCVQ4qTKSGEA/vo3448cKIQO7jYm8/1alxkRvocknbkmF1YcNc9fyECsVrgA0gMxGP
 7iHKa/vF6td8OpNPPzpbKRYg2GC3Qj1xj/TEIAa24WloAg26RUfnAPiSuftlYQmOjorIZdiVulw
 DvRZKZZo6b+G2umxDn5OPcA5dsRiLV6T2IMPqp+fEUmpVHLou46GzHXJlQaPziqe/2rX1s8iQG/
 baYzassP/9X5Py0lomZx+s45b2RFodo54mSsQWgjLm
X-Received: by 2002:a17:90b:4a51:b0:3ac:450b:164c with SMTP id
 98e67ed59e1d1-3ae580dfd08mr3009090a91.47.1793223622186; 
 Wed, 28 Oct 2026 14:40:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae55d66953sm1276845a91.1.2026.10.28.14.40.21
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:40:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91c70349f65so32598706d6.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:21 -0700 (PDT)
X-Received: by 2002:a05:6214:484:b0:915:e9af:3145 with SMTP id
 6a1803df08f44-91c7cf27e84mr57934326d6.12.1793223620632; 
 Wed, 28 Oct 2026 14:40:20 -0700 (PDT)
X-Received: by 2002:a05:6214:484:b0:915:e9af:3145 with SMTP id
 6a1803df08f44-91c7cf27e84mr57933766d6.12.1793223619968; 
 Wed, 28 Oct 2026 14:40:19 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c16569sm140994586d6.18.2026.10.28.14.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:40:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:39 -0700
Message-Id: <20261028213744.511429-19-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 18/23] infra/autotools: warn for package that
 autoreconf without libtool patch
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

The libtool patch is now implicit because it gets installed for any
package that gets autoreconf-ed, so refusing the libtool patch in that
case is moot anyway.

Error out when this is the case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 59aeba1caa1dba75962726904fe712aa6c3e9146)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/pkg-autotools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 89894b9b6cfc..8e1b1b6d40a4 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -120,6 +120,10 @@ endef
 
 define inner-autotools-package
 
+ifeq ($$($(2)_AUTORECONF)-$$($(2)_LIBTOOL_PATCH),YES-NO)
+$$(error $(1) must be autoreconf-ed, but refuses the libtool patch)
+endif
+
 ifndef $(2)_LIBTOOL_PATCH
  ifdef $(3)_LIBTOOL_PATCH
   $(2)_LIBTOOL_PATCH = $$($(3)_LIBTOOL_PATCH)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
