Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1413606A31F
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SteUY8mt
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89AC540AB6;
	Fri, 23 Oct 2026 21:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xp1ROSTnJEsR; Fri, 23 Oct 2026 21:52:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9BFCD40AB2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792338;
	b=JHbXYcvI2Xh483nynpRoVRO+AjhTruKZz8lKymCxp/snCp3CyvkPUQb0hkSKPqcd1CiN
	 bNBFxb4FN/U7kSCCNaMJMZZC0Crn+g9rwcQNiEALarDW29+yjkMVyawhvPm+otuYnxZRu
	 zPVLbtuYVHwoma47JAEeLy+yct3YgLLA7NXKxqhNqTje814K8TLavV+Hi/Lu7o0JPfE3H
	 EdWEAsZOqMFJWUSPyZU1x7cMkWFN0B7MDWxbr4ueeDfwgRe7Z9fwZWtinHIZ0ct24tujD
	 RJ53eTcFPf6Vws+YsDqhfKFNIWkP6XKBjyZ7ntdfNnCS4mUN7aul7dl18FUFoIlm14A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792338;
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
	bh=FqK/91o1jJfVL0pVuXHv4B12AVAr7Mj8qEGPhgZi7h4=;
	b=H260XI2PEitkoexX6fe5d9NxVnPLZqA2AYwNlMdqrGdlrTXWWYiJITqKPFBDDmyHeuFO
	 4uREhSTd4jzIr2iFBVQIsv2Q8KSr26cDkCDrnvHk0S5eQX7MntLbjkEth3XysHOYrtMQm
	 RndHMZMoN647ok+jmhavQ4kNOO/JbMuCGM5FRp3/j5cKIpgC92/j/TiNNoBvEwO5CYNTB
	 sk1Bz3x1qBW7e7SxaNNdrh8Wz1PrdNqKjXsib+Izb4Or3z3QWvs1osBpottByfz4btcXW
	 wBHAHWdnoXf77w9jwhO4FyVOxCpSsEsbRW3ppmNRyxgfmWGzTQpDMbR2rPmQFqEkdsg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792338;
	bh=FqK/91o1jJfVL0pVuXHv4B12AVAr7Mj8qEGPhgZi7h4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=SteUY8mtcmGHEK/Bj6xijbQ5Z8Fm1C4bcjQuXMp7xCDB1XDCfoohNS9k+uPMXmT2N
	 aa26Bt2ivxm4nPCBwQVmhEuIhSN9GxwzXZO9mq1p0U5Dgcxdf942z8pVSfODzTNwOJ
	 u/OnbCtaDCuKEu0lhqenGy1QKONGsKfkWrIY/xbds5vLfwXcqPhMDun+GJ+hsNURVn
	 m90LDUvCsoD7oavb2zMPCAodjzPwxmyII1kDo+xE7QKOkxmDhDCBXoa/p6Fr4wnMFd
	 tqOt8Blf1RblKbjekkB8CKqbRUVDf/HS8qFpuFm0Ouw/53Q5Zn7PHFrVShz7cFhz1W
	 h6tNk8yeJ1IKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BFCD40AB2;
	Fri, 23 Oct 2026 21:52:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1255E79F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FE8D404A0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qgsgm7K4xZv for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 502BA40488
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792334;
 b=IJ8I2R6smF18xxImknz373rNbmhI5+2MAZlpOznlGg4zFko+ZVzcZoFruZeU9tTTbhoP
 0uI05RYA1puDpH+/H+L27OX+NXnCKdlJK/O6OO//FuzDXY6+FSafS6GrV+JL9TJJiqg81
 VV0TSU5wmWQ+Y3jyrR9+IMEeAquypGMIwSflj4fiUa/uoCkYDLkxJK8DX046E/85HD3W1
 aKVPukwcRlCncVG88HvRNu3NMtgsYvJzswyosXFBWCDt4HgAcj3i3lVzrPJF7hEjSMImt
 2mTYxyiviVUxa7qRi8KV17MRvpRjMH/JM8Z63po2iB8kXuX5ko2Jf4gNKdaVgOuKZmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792334;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=XdND83dQH2Rgs7thsxMsa5mK2GFUP6VPRWm5/Lc7hzE=;
 b=FyNguB9Yd+hvkNWBZNwoKr4Qb7bEthgfTp/mvOcn2hqpPShB3+4ax3tCGgIe3HM7hC6j
 MYAAlIVaQE1SAx/rgdgW6SOSQZF6fFKD3oXWCP3QcQVOupmYZq9r5IWcQRB483WYHVwEQ
 Xl+nbSxLGAY1Auxr529mx3rgcyiK89reusEZSfbD9PaFJNIICPQ8lCzHSswt6qXH9eOQO
 2DiUZ5ZJA1D6aBiw0qILWSzV5jfiFMx5J72vr+RHXDaYk5QD2k82Qp6q8ZZL7ciT/42qn
 JcrRQGLc0/ecIY8Q+aRvYLNwM+5kiF1AYFZU4X/Gh33ib1WsxGZ8ob3wxTTQso0STHA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=a7SxdBQr; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::664"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::664; helo=mail-pl1-x664.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pl1-x664.google.com (mail-pl1-x664.google.com
 [IPv6:2607:f8b0:4864:20::664])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 502BA40488
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:13 +0000 (UTC)
Received: by mail-pl1-x664.google.com with SMTP id
 d9443c01a7336-2e9e53d011eso9744645ad.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792333; x=1793397133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XdND83dQH2Rgs7thsxMsa5mK2GFUP6VPRWm5/Lc7hzE=;
 b=fXz9wmQhY98vVX2IkQGSsMEogab9TtW5m0AxIbRlQuK7I50i0KrKFsplzFNu1Rjceo
 4VxfbXE2NKX0Mi+I9JUDZWVkDW8FJ8D4Z7vFFiP3oC/T/CEboAAktSit2YGkE7MjHvRl
 fs8m5yUdgx5WHsv4sHhJ1zhK3AyuXS2sR6B/SE2ywjUUZYSY0Rl3DOQLwp5NXNjdx7ml
 2RdMy+lQAeQuno82mNUgYOf0ihC9M/X8urivTmQjQAyFwpkyuBzFFO5Ng/i/x538GuyL
 RkBjYGFQZgKhmN6JXpMH3ocGdVUKOMfKwkyaY7+dz2orB3NZdYoD9TBm3/MSGNBPUKTG
 FXWA==
X-Gm-Message-State: AFq9FYJGW/DpT3KRmhqQl7xgpnBuzEV4pwd+DIscI/GyiBE/LQtLrt8H
 d07RQ/z1hCxoAHEvBsvcziOmBFX2ebsfW9eG1OOStQS3CHALFU4eyXQLcnXUY1eWCFI/9HMNK1b
 bX7oOeJ9l+05I5ROWhAm9pbxfPyr0ipBXTGpu3Lgi7EqfObeyuT9ib8RULbc/VDY2Difp3slusj
 ogA8HZJEsGgBXAxPLrk5Y5G4wu+jeWhSVyXR6F9lWcBgsPjeiyKOh8s3OGNt2hxXlgdWgAzfML6
 xHzip3EM34JE+NLxQO8
X-Gm-Gg: AYBFou0cHeBPcknE+TXL1mZGLMSJalh/UEKGc0NS9dDw+f8mT9FzOilS7j1tmtyZuPW
 2E65/TTZuHFH23QCXv+NgBBM4Y9EUxiW6d41GRT/j86EGlEj8RvhBrmxOdOXog2tPuCiAoC2hJJ
 I7ZD+gzvRWtqI7Zh0igPw05VqUBzfrLP6X5OaTtD1d6a5yxE+8RAOFcOeFGLIfxj4niP0GbdvCZ
 Nt4mYJkrBIbkf4puIDb81Q68+q6caHNR7M00OvNSBH1E7R15zeSjzcoHanlLV1PKZwIkPZyyxRM
 1j8IXOtoD8gBB5dpHuO/JiwURe2/NVulAlB0ZPsG0U0Zp7OlJu5dxAV8KgWBzvDLLHwa+VhALZ6
 9T9h/HnqXHG3k25a/Tu/eViyQER1ltDUXDC4dRoumS0rBGGsFCS4t+6ttt4KcT9onT7lzXlKW3E
 rUVv4PP4GEUQlFBnXqbkEZS0+s1+RH2Rrg30lQJ+Zu
X-Received: by 2002:a17:90b:17c8:b0:3ab:be66:ddb7 with SMTP id
 98e67ed59e1d1-3adeafdd055mr405257a91.47.1792792333117; 
 Fri, 23 Oct 2026 14:52:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebab0050sm358080a91.0.2026.10.23.14.52.11
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-341eff9e381so3405988eec.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:11 -0700 (PDT)
X-Received: by 2002:a05:7301:4543:b0:369:a113:7560 with SMTP id
 5a478bee46e88-369e86249f2mr712041eec.41.1792792323883; 
 Fri, 23 Oct 2026 14:52:03 -0700 (PDT)
X-Received: by 2002:a05:7301:4543:b0:369:a113:7560 with SMTP id
 5a478bee46e88-369e86249f2mr711907eec.41.1792792321262; 
 Fri, 23 Oct 2026 14:52:01 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:51:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:30 -0700
Message-Id: <20261023215138.2301146-9-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 15/23] package/libtool: also apply libtool-patch
 to host libtool
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

Currently, we avoid applying our libtool patch to the host variant of
libtool. This is mostly historical.

However, this means that the host and target sources are not the same,
and this is an hindrance to out-of-tree build.

It turns out that we in fact can apply our hook. We just need to do like
for the target variant to avoid building the documentation.

However, that has a direct impact on the autotools package infra. When a
package is using libtool, and gets autoreconf-ed, the libtool-installed
ltmain.sh is copied to the package source tree. This lt-main.sh is what
our LIBTOOL_PATCH_HOOK hook would patch. But that lt-main.sh file is the
one that was already patched in, and installed by, the host-libtool
package.

So, we no longer need to apply the libtool patch to packages that get
autoreconf-ed, as they will automatically get the correct, patched
version now.

Note that for packages that we do not autoreconf, we still need to
use the libtool patch, as is currently done, to patch the lt-main.sh in
the package source

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 70fa1fb72eef8325263df640f7781710875f6ad3)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/libtool/libtool.mk | 1 -
 package/pkg-autotools.mk   | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 45441e1e4676..98ca31d549a4 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -26,7 +26,6 @@ HOST_LIBTOOL_LICENSE = GPL-2.0+ (libtool), LGPL-2.1+ (libltdl)
 HOST_LIBTOOL_LICENSE_FILES = COPYING $(LIBTOOL_SUBDIR)/COPYING.LIB
 
 HOST_LIBTOOL_CONF_ENV = HELP2MAN=true MAKEINFO=true
-HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
 # We have a patch that affects libtool.m4, which triggers an autoreconf
 # in the build step. Normally we would set AUTORECONF = YES, but this
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 58b63317cb60..89894b9b6cfc 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -243,10 +243,6 @@ else
 $(2)_AUTORECONF_ENV += AUTOPOINT=/bin/true
 endif
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
-# default values are not evaluated yet, so don't rely on this defaulting to YES
-ifneq ($$($(2)_LIBTOOL_PATCH),NO)
-$(2)_PRE_CONFIGURE_HOOKS += LIBTOOL_PATCH_HOOK
-endif
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 
 else # ! AUTORECONF = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
