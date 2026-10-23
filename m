Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24E0606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Psn1FEzS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A32E660A7F;
	Fri, 23 Oct 2026 21:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ssS2BMEbRsu; Fri, 23 Oct 2026 21:52:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 537D560A66
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792337;
	b=d5bMqfjnqfNUlFiS++A/ba6M4lOG8+TMqNFn++8fvczBsagQHoHfW4iurqywrb5YgdSF
	 W4rvaUSQO0vJWB7VTF6+vlIyxs4kZ68L17pm/twpE61cI5XSi2Y0b3wLa2qtiolfSjDv6
	 o3mGaiZhjiaLAN9OzvkEbAQ6Oq2sOoi47l9dH1ABm7e0F52tjNsjPPRNhewBkWwD9kj0y
	 p3llbrTjoYCxsTvASOTZE+ouxX/JbS50/BET7OubwqyVqi/4YRwb2ErEOehnytaoYLSWg
	 EkUPoYXBdnA8Z8I4b4YOqR1Kos35W2sNJrh6dfXYF+ug5z8wmmf8SoE/gtkY0vWAKGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792337;
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
	bh=VGimlgWLuyhh2IfLYj5akhZEGmfkcxGazRTBzo/RHXE=;
	b=ssu+QsR+JEE9Pnf3f8gBOQUkDMbje0/5pN++hoijUkvEhcV9OLBIUUan/xgY5gnazmlS
	 XNdWtI4V5r1tjp83yVbIVjB5qyAnZbnr8A+i4z7+rhn0YD/Yjsv8YUedFgHlEgbuEI9O1
	 7huQzCp8//pheUZmh254+mYwmFHsmviDVeAEP1XLaGqaxY1YtyagFe1MdUNgR+vqT0fz0
	 UwGnJO184ZIWpDQ8Xsi/oOs3MAV86ubXV7OGgSRv5spY5LBVmzSDk1uAM/fWq7SwnLir9
	 oZAPwG/cGO7LMsUgc0ozC9IL9P+xY/fUTSIPvWDDIbzTPhonezHDEN0oW0h7RAMQMkQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792337;
	bh=VGimlgWLuyhh2IfLYj5akhZEGmfkcxGazRTBzo/RHXE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Psn1FEzSsh8FxvnAeZ9FMC54DkQM2A87sclJ7caTcmauRb9pQZzVHLux+MfFz3I31
	 J28LTGYynhTUhw/GeLVn6v/ZQsg+1wmpW1vWMOcTGZFyvcnalJclrzMC8WRIMVuwd8
	 VS2hbEAbv1WJoCu0o9dyA/DDfr3vfb5xCmlHq8b/+jRGgDGzkNtyvdWL9byeLFokhk
	 0jA9X+KCG7SEHcgtS6XaRGIkkp5NrJiXCqC1PmI4EFFhhBteTxgbBtkivZFrbCp1M6
	 zBzpHAlSyK8Ezxyz0ifuUD7sCwKlO8vl5CU0l3C9LF6IW7xQJV5tsOh+6KOAzShBty
	 GzQ8NN+6GNi9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 537D560A66;
	Fri, 23 Oct 2026 21:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7DFAD31
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DCD260A85
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbJ-_5xpykhu for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B1D1960A83
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792332;
 b=ZcfG1Z16Cyq+vlDDn4pGOLspIZzcarB6BuL2hTNeG9T1BIRVLc3seqUGNoWHDBZNk0jg
 hhN7WGB7ArjiMMRhMOxatrura35/n883IaSxxsDiqYx/8W7bzCzM9LF1rNf01+QDhvVbY
 e4VTIEdmMIl7b/mCUvUvOfy+/xRJZWd/5e1PmTH0TEiHd16xT8m4mdOoGANooSwepLSDY
 O6xnNoBScXAma/uFSvqTojQXiFjZ5qClWsDZ7xpO/RiByI32YA1KMZOyAEOl98XDyhUgb
 FJE3HvD8OQ9mtuQ8BR9c6OzeZYdvSe/yhqzdhyPBTmSz7DgYmb49DJs6c2tZyUz/mQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792332;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=9KoqE5jxjBfbjL+QU3JgrAFAKM6NfAlyE/9Ygwu4BiE=;
 b=gJ/4HjkS9XGurLgBUszZvOZVuNJmHguSWUQ6+cGk7vNE+qxDx1gQ8ogQvbwZUujwaqyv
 /AsxW4kJVB8U0Qs2nhSHcq8P+qZ7eijDEL5Jy5rIsEz8gC7eVUEPN51jofK73KGG2eJfa
 t4M0fwNkw72bGCigMGStf2X4kw0ECe2PFodLBifdrmuo6BcYfGY02B+RzwJBjDAQ9omRz
 xNCU+QvXLLjvTZX2IaMdrHnsdnKc5PsZY0x4WCcBWBzdiGdqhFO60OJcUdHlHel9s24qG
 bsVZFlZg0v2ymcq6PMptq6N8t0TIVbLkntW7e+niOWx3f5fX2nZ2XmsyNY6hJnqZ2CQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=NjpNjX5O; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::761"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::761; helo=mail-qk1-x761.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-qk1-x761.google.com (mail-qk1-x761.google.com
 [IPv6:2607:f8b0:4864:20::761])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1D1960A83
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:12 +0000 (UTC)
Received: by mail-qk1-x761.google.com with SMTP id
 af79cd13be357-93f2b8cf037so114114985a.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792331; x=1793397131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9KoqE5jxjBfbjL+QU3JgrAFAKM6NfAlyE/9Ygwu4BiE=;
 b=RS1ri0wFrwwrLTKGXON6KeTowse+7ibaiuYQ8SJKQpgGBd4bxsQoADaYVdgHCnFlTP
 uNASRh16X0PeJW1HmFYTTY6IjKO/IJZQAOURrp6eihJo/xBmxsFvVfg0UjQOG3EazWNo
 G91nQ7KWCRMpNSNcrLJrFPvmsnsIqoo9AyDnxeSFaz4l3X6DK+rhYVh6SIUMKGqlhE+p
 oeGzLYo6ijBkPK2A9QGQjH3lhHjFcVYFANDxtwHyDCEcFmxV/WYn/3A9Re4xytwXaaCT
 V/XdCJYH7fAlQiyRlWzl4h8lqwqJgHAHQTBRPs6A3gZeL+sFNywSzAy6tBjJ4jJS7Nwd
 90+A==
X-Gm-Message-State: AFq9FYLhvevOcVO5alHVDl2kfpO6SYETswNNvmRekF2nGtlE0elpmSIg
 O1unMOYyZVIq8MzSwm7SoK9GwLdIbgR/+1i8Ak2BplikW2YoxQPHhYpYVBNlnIZPtsmJ08gOe6N
 A3cAKeP4yh1xkxZZ8ho3rcvQwv33UWkpjzIzSOzTGD8NYfLJ3OC1SQWW10jsWwzx0D7J6cz4ygh
 iRTnAs8oftOo9aliABje0d4vy9uZ4bmqd2Ha6V/GOlz5ystBbqv8/VMAj8cXmvqf5/VmCsxj/aq
 WpGn5ITRqaQsmZ0mnu/
X-Gm-Gg: AYBFou0NBsZTJB/Upbca9aXpOY37EulaxBvg5LjaOZsQWwKcrWSM8NVwk16rEIMTM+d
 Eass4v6jSzS9vZ0/F2xXYGs+VvZOdpP2aazJW2NsAobTjXWTr0wvesjjTC0q8Qk/XWGHCuMyRWv
 vlQUdVqxC9VULzwjL/ua+8IJ7etJXCTN9PD9J7cjLOEnSljB/UCDAp0rOscSmmbtDQa2fmVs4Ad
 5Pya8q3rPkqTUEyKvuQMat2PcT/NraW43/u9pa5oHE7AZ4XT+91IT6SkMrrXJw7hT1PT5Oaj4O6
 jgEjuHhdkOcySaIGvij7qtNfSWOK1R8hGcviQbCV+XGA2sv3F7EhrostqtAN3fKymHEWOPqhTpI
 Rhx70uvNkOYjTQgURAuYzh5lpHA/tO1NtP0ZHFoYi2HY2fdu4Ilw5wZo1Xq0IckfXyUqxJNCrGp
 YcHrdR8ubs0+EIqFZ2N7CaPbFuyLHlhp9KipMtH352/W0=
X-Received: by 2002:a05:620a:17a0:b0:939:c1d4:e2e1 with SMTP id
 af79cd13be357-940ef901fd5mr59361385a.25.1792792330964; 
 Fri, 23 Oct 2026 14:52:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-940f0a76086sm3042385a.17.2026.10.23.14.52.09
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-36998507c13so1434558eec.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:08 -0700 (PDT)
X-Received: by 2002:a05:7301:514a:b0:343:ff9f:26f3 with SMTP id
 5a478bee46e88-369e842b597mr734553eec.9.1792792319423; 
 Fri, 23 Oct 2026 14:51:59 -0700 (PDT)
X-Received: by 2002:a05:7301:514a:b0:343:ff9f:26f3 with SMTP id
 5a478bee46e88-369e842b597mr734502eec.9.1792792318558; 
 Fri, 23 Oct 2026 14:51:58 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:51:57 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:29 -0700
Message-Id: <20261023215138.2301146-8-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 14/23] package/libtool: use post-patch hooks
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

Run the autoreconf-avoidance tweaks from a post-patch hook, rather than
a pre-configure one, both for the target and host variants.

This will ease migrating to a shared host/target source tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998@free.fr: remove FIXME, actually do the migration]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
The hooks are still not the same, because we do not yet apply the
libtool patch on the host variant. This will be handled in a followup
patch

(cherry picked from commit b49cb508257ff7f075b4409101d98a589eb8d446)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/libtool/libtool.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index ecadc3e696f4..45441e1e4676 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -45,8 +45,8 @@ define LIBTOOL_AVOID_AUTORECONF_HOOK
 	find $(@D) -name configure -exec touch '{}' \;
 	find $(@D) -name Makefile.in -exec touch '{}' \;
 endef
-LIBTOOL_PRE_CONFIGURE_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK
-HOST_LIBTOOL_PRE_CONFIGURE_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK
+LIBTOOL_POST_PATCH_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK
+HOST_LIBTOOL_POST_PATCH_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
