Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE66606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FhkQi6JZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D95A180E04;
	Fri, 23 Oct 2026 21:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlC1ffKpuiMJ; Fri, 23 Oct 2026 21:54:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 154C380F5C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792460;
	b=PlOcOGj1fNRz4xsKpmdusq5z+5PPjdpQkhECNJEba0KFRTyH0LVIZUNOgcu80rNhUZm/
	 EV+pG1o/PUbX+4IJvT/gp/u0P9LLL7nKQM8oFef4S7w7FXpO/iVNbv7K9tUHKMFG/D6u8
	 aia6snVXfSLBC6Z11UUSKyVKr1//XbNSe3m0bfRWRLoFF/sitzcSU4O40Vyx+/VqhKAGp
	 gVt7oa7LTXX5hKjFYHFvY4jCPKB7HC0ZYOhNu24ApAr+ixYzsSAWkqnhAfXToXJh5fEYN
	 dTD1B9DH7p31aLVEpzZp9o87QXWfHvswcxxLFxV9ZG0F7KeZT/mteI0pqnIHaabMqLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792460;
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
	bh=456WSVR1oOtPpT3ll9t4WcTVXFzOvEZ36XjhK6yQWSU=;
	b=BayqLXdIpBAbSvYXH9PjQhJKGWCH9smVhtDZuXCg5PAYmvYif1QuXJYezyUBMKzCK4+u
	 jjKKA5H9BKCYysFg4bfBNi5J7nMNmS/KELzvcTIZTXErDLiaNf12TVRLlbZwJQKuCy35U
	 5qqtSRx5EvqVN85wyI9skbuZoeqsPnwghuXh07nOhStfN77JQVK30bH5Ku5HlRpdGstPx
	 czblavw+uk7NMGhD5yPcSrpAcpUEolr8+IdBAYTUP1ikZptW8bOcdOJ7Hq3KA7ShVOga8
	 Y/SCkvGdsS111ZqIdyJR5QMcFVYzT/Eyn6DEosQ6+bjHmOIy+zPaJjdVGv2JIfraFWw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792460;
	bh=456WSVR1oOtPpT3ll9t4WcTVXFzOvEZ36XjhK6yQWSU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=FhkQi6JZTlmledqLtQ7y5274lB0eiI0X5keg7DnLVpAC/vwrsqAzjGRvWTKSB/jOd
	 DL2vTW2eqeDsvHSVSdwEJzTL+9TrvecLFAylt50ZBQKT1qHN2dKa/cvChkaEAZM5NH
	 3hji7Mj9H2wnKvKInPdJzaClzLtW9pvrdB/iNpFjNM8ZyBj5MfLX+G1Q3Mx6Vuz6oQ
	 wd4Cnzm2bbq1fKYjka4ByhCg3q8aphjojkfD8DH1u2MkNjoTXY8VstxUPsQQPob8Mp
	 wSpoKbJerzofOgJtkZPBHmaD5tKWROKvxLlZyI9bEESR6GHCbbJNvph5Z/DNmeAhLq
	 QxbVpG45QbMhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 154C380F5C;
	Fri, 23 Oct 2026 21:54:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E38603C4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9C23404A0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Otz5NxDgGc8t for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:54:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0B86940488
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792457;
 b=leO6Lz6ChkEIX3DxPCwMSl+RibTHXt2ItOSV5ggP1JkJDVIhbZvdaFvPl9Ji4wRGu7S3
 1xIqwhQOBhncMyYI4ra2np6KbkcCMOrcd2uwcZM1vk+prv4D/TiZfMFNv85lYlJGK4KhV
 lHbrH4sxyE4TRdCZ/+Gso6msZ2zQpJCGMx976OiyHEiOoj+i6mF9vcRkuyo+FEr9cE974
 1AUwZqIt4mepUZgH807YfGrgi+MiHaYDFSHf3gV71Ni0hHQBws+VvZ3+V8IbEfNpeBDpm
 rYWSM9FqcNvPlH6ssobjbBPv0ydDaOgipSJRxHdBOGvNl0DtIlBJyi6WyQw3nk+YWcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792457;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=GaVzaajZX8D36kryFeRRQoMUOjMo5kxgQhj8Z8UT0l8=;
 b=AdhJykSkTZbZLG+rH2hlyr8UN2Kjtkr6N9mzW4d7D/8BRWR0aGnRnq+5G4sZxcJbNipX
 WECo0CvN5EBHOgUHwRxvd7zuFgjnGbmub04RCd8LKHcm+zpjDq/tYuahn4xmuF0aI/e5g
 KhgKkmycpDOyGyw1PHEeIw/u7Ia820VpRQGDwgorEvdv245rW+xnMAkfr1z9KB5aThZeJ
 jNxuodzm7rv9h7jPQuLv/henivdzxtMwm9ebnwPs5LgAa/faXUNgiiaBPKE8TxXRI1f5A
 c+QJWwSY3ljcgt1Orj2VAYTmbwsqqsXNCV4JsVKa9B47cJp94BK+9Xj2wlnKZpqEelQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=RYeZGNOI; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::761"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::761; helo=mail-qk1-x761.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-qk1-x761.google.com (mail-qk1-x761.google.com
 [IPv6:2607:f8b0:4864:20::761])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B86940488
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:54:16 +0000 (UTC)
Received: by mail-qk1-x761.google.com with SMTP id
 af79cd13be357-93f079a63b8so119550785a.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792455; x=1793397255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GaVzaajZX8D36kryFeRRQoMUOjMo5kxgQhj8Z8UT0l8=;
 b=XNFuUKe4QxpEf6vrtAssEHU0OmBoSUAyMBVyNrn4RkzB56SaX58cj+arA9LZn40wF+
 0jIy41Xcreacoqw7KpnylalGFCwF8ldB77nQ34eaihJ+yZX6PxXPOqkt2kW0qZpalUpD
 WoiUgr+fn2gJHoMk8ZA8dlvxwxaFWJetJfEuNQHc+dHC97aRrjO6Tci5pVdfYMzSonZh
 KOpKLtD3Ya+BJplDIUaxD5oIPSscoBeSjIK1mjwop4x1KSpQGkVDZi6zUjigQYyvavg+
 Z7TRKUsJW7jCTxvStV+EUlrMyOwNsEcrwDLr3u5zbZzubnC0MICh3Cn1ad6nbxFu8xsK
 EtSQ==
X-Gm-Message-State: AFq9FYImNPVOFzbAd6y/QHhi7iy7byBJh3NC0MZAt/FXpsCTcjfiCO9c
 EubHRfVTAgXVRob03Bmmd5QkWpyC6QPbmB2HSJ+EA3v8BEciZdk7YhQR/7FaRFxPU3AzziQnFxo
 UQxhEYfDgINbpqDeSS3qIVpixiSS86EuS3JNRazzDhlZv6XfDWzvWz9UqjSHQt9QqtWGO2qw3sp
 vkxuU26s01aVI6/sT/8VAlmt37FPt25hocx3HJS9as6so4XqlnD7S+wILqpiKnMaSYg9yEuUKO9
 8r6Usoj5XXYhsOsC44M
X-Gm-Gg: AYBFou0A65OYqDA1bPpN4p/JWPrT0xqjTiOk9K9QN+MtMrH376yMX0e2YvVd4/dUVHn
 EyzJHH+LSftFOcTx/moGNHu0wgZmgCSeHqPvfgYbpro7LWUaaDEF3Oa8iROcWLAKtz5Grh2N5+b
 vxlk0Pjhge22H0JCqHXVAf0el41DSeUXdokV7p/yClXIvb1LubEfGi4Bv8HHGknJWehRGyz/Tvr
 uKdrOpoTTEl8oXToG1anz6jJreb74XYTS/2I/jWF1HP58rgO13k7tLOhoxrYf2B+ZhziZV+9Q/H
 t9/u8eeieW2eR1AWC/epucev9vuBHNFr8iPo9vTqoUVDoiD795zwNddav41J15HKZ0oKopLTgup
 +EERL3kZhJF+VTiXdM4549RjnbdO5yY0NcmVZxmxDcWvAtdUlI2UjjmgC06dppojnDZGSJfr1LF
 6VG1JbGXN52hea2ndHDAgw8iSt7FXAM0xO3qXehTKEsiY=
X-Received: by 2002:a05:620a:284a:b0:93f:2b23:481b with SMTP id
 af79cd13be357-940ef90473dmr62027185a.22.1792792455537; 
 Fri, 23 Oct 2026 14:54:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-940f06613d9sm3305685a.4.2026.10.23.14.54.15
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:54:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-7026e2e80f0so1575793eaf.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:54:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6f05:b0:93c:c162:125b with SMTP id
 af79cd13be357-940ef931614mr54332885a.39.1792792118536; 
 Fri, 23 Oct 2026 14:48:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6f05:b0:93c:c162:125b with SMTP id
 af79cd13be357-940ef931614mr54328785a.39.1792792118033; 
 Fri, 23 Oct 2026 14:48:38 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f066a5bcsm16398785a.13.2026.10.23.14.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:48:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:47:51 -0700
Message-Id: <20261023214807.2151753-8-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 07/23] linux/linux: LINUX_VERSION_PROBED should
 run from build directory
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

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

LINUX_VERSION_PROBED would be constructed from some configuration
options, like CONFIG_LOCALVERSION, so it needs to run from the build
directory, where Linux' .config is.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0323ef5ceb5b5968eb9f6f00cbe26cf089a4d252)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 75294cff1842..a90e09afe906 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -197,7 +197,7 @@ endif
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 # Filter out 'w' from MAKEFLAGS, to workaround a bug in make 4.1 (#13141)
-LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
+LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_BUILDDIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 LINUX_DTSO_NAMES += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
