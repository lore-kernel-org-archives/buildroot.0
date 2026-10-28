Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014CC606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nHZrt9Pd
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B0C40A04;
	Wed, 28 Oct 2026 21:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGpNfzJ3x_tU; Wed, 28 Oct 2026 21:39:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0774D409EB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223570;
	b=LTFL9Ije7+02/G6tvlQ9jPU/1tW1KEUZRIqMPSEijdviQEYcy7z2TWRT5ylkpXvZXY/y
	 WdVG2aRcA+NTKCzHVCIR/g8S19EMDdokb33Mn7TS2ymuB0xOnlo8YbxGKa0OVkUJOJ/qu
	 fS/mdjn3GxSE2Kew+Is34O+38ZifmImSMliIPHNjQg+jIK+ZppQb3LCC07lhD2rI/mR2g
	 tV7k2EId+Wr09D1pEE3k4TiKWF54LS4yzit4vXPyppj/1uZTMIYEw9tnsQT0pq02KmS3z
	 YAaQxbWEmSU5dIlAYkofLo8Km6FPMWrGPeAMQTIXYTjg86w2lceycPtO6pCwZ7MY0Bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223570;
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
	b=BEPADcfj3JUIfH9eZg5CttHkOX605X6GQ540eQXT2KiDt6V/YtflY3DX3L0IBIRuOm8y
	 3s5y8VIHO2M/AL7F4QZN2xkt/skIQDW0JyW22HXlUmxQZfaQzH5vRW7gnps7VS3U4NtVk
	 DsBiu7zHl/MLL+7bR2pVmJJFwLAh20Fzwdexufuv1J1rvfa+oQTW5A/X547uooz4ewj+W
	 nO2or/1XwvM49q8WfV40deVkY82l+PqWfpt6mB7bAz6hzg5LGU/Nn2hICwc5NkDWzf02T
	 +6mcbY6MoyxQRF7maC4jrXHby0KmIrYAXS4npCs4O4KhSTAq7liZkAX7+StNFXLBQOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223570;
	bh=Bbiq47ON+8VBVpIB9NeeCfETJ+LofK9qlTZMk2zbVrA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nHZrt9PdmX1cZ+RSta28RZSEdZRtiAQOZ6LYTfF5fHyik/lOjJJVvtAylnEqp2ASA
	 dh6Nk/i7KxI3kn+Lr8qM4lAMnGSVAVjXYIs/ygB9eOMdOEpFwmKQiTUTp/MmSm/XMH
	 E5RouVx1Q5wkkRAiocXt49W5ikvZZqT653WN3lUsca8DWZ4731FM5YiOJf4gYI+ajR
	 /ZGZtd9B8sTisQhFmEP6COzKyhnjNM+1XiN3JOyKH+mVPATXgo2Ec8Y/qwlYnbM/DP
	 fUGpYygTYTCLiN6n3RVX1Ea68ENTbLohwn4P1joi139Km8BH0i/iMomp5DivGHwPTo
	 VGCPMQX9TiHFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0774D409EB;
	Wed, 28 Oct 2026 21:39:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B2012A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48AE18176D
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9wfT1vy_g0q for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:39:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8EBF18176B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223567;
 b=nkJsXpl3GSnuXxTnTkciCwIemDjvVcXnNCxaFiYKbLJNuyTjv8obvZnqwQ7s8fiDcyUS
 LYVCeJHQaWTL64+Zl8aPPZw3e5GHgoUYRkdA2PZ4HkBgI46PE9mPHfMpY9pkpCV80P1/2
 LxlIfVsbLepXm8O8pH96YgLBagw0MjaXjcqmga4xu3tmO2pRp0bR1zA7JassP4+8lkWLK
 7mRODDdiBFWBVuhTP90IzVa392Tga7GVKe/wJ44x2ATvLDGqnOzz0n5U/DRegFmyMv/dL
 32LYakenut32yLZACMWGV6Tcnc5ErbBO82bPkbjC+rJLoaiezQxBMwQoLwqOLxFszhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223567;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=V4xeKQq1oy0P20f2dq1vP1ChiNYZt/CQik+/CmaHBVk=;
 b=AGbRphEfgcVhdDvmcpgjibcJfZ/uEvI8wFUGT3ALxcYCznFod6wEJleb0NGEHOvHklgf
 caoEs4tskBTSTqwIxYm32BjojxJBvH0XRDzgwuaPIZVqdMVxKCy2YpnWgjWYhDi3uWEqd
 w+JGAXIlUCE7bghTYorlA1rJelRJ8L065A5CVrdhKM4n2r+lAynkQoUEqyo8Vzw6mUtJ2
 iP08FHHddq40QERU+MVZTEA+jkcrvBx5bNS4uYbZvXqObHVsygwY+j8owqHd8IEXi6XAz
 aPNzbTvn9dritgQOWjykC9buVAgNYSsEOGKucZWVe37KQrJdAEx+ICsbOKkVj282w1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=AYd0vLWU; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::761"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::761; helo=mail-qk1-x761.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-qk1-x761.google.com (mail-qk1-x761.google.com
 [IPv6:2607:f8b0:4864:20::761])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EBF18176B
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:26 +0000 (UTC)
Received: by mail-qk1-x761.google.com with SMTP id
 af79cd13be357-93f20c3aaa5so129469985a.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223566; x=1793828366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V4xeKQq1oy0P20f2dq1vP1ChiNYZt/CQik+/CmaHBVk=;
 b=rJpuUbVyInPdy50t1RTR23BcJeqpyQoqKDEr9y/Meqc/GqXzfca6Nlit80BC5XXmnP
 OsoRri+ZV1c3PQFLe7Ry4myibrlLElJ1HoGdK8PsuMcnG6teUhrR8rW8OXOTgVaWV29h
 RPMXQ6Jttc+peQKbtpZ7fcb9o07iH/Oc+5nRZ0yhHksAf2lOfZU9nvlJaCBoCNoFj0HX
 Q3sZvWMCd+KVgUPL5fdepNIuRg6N4LGilvNM1K+dQH2hc7IxzlL7HlbuuMle2JSh3r2A
 cgRsdMTCcldn0r51uektguAmrVKij8ZpoyO5dTXjd6nKmkjO/HGSyeKQ63HOaM8vx4b+
 5ZlA==
X-Gm-Message-State: AFq9FYJ2mWIJhuS62OqU5zazeioRT1+6nDfKB2BmU2fF1k9U8qGwKfeW
 FIoOT6ZGQeBuhCjPBMwpxLFt5+FT1mRIVXbbPozaSogshQ2KD7lxqpSDowH5FyExUzXuMR5jyGf
 o5zNCwHn2mQCG74i9i2l4Iebn72l3BEMA93ru9BBNf4WjXAnZt+TwRkfgjJXZ1udhNPn7h6kJaK
 BJaVH7A6RlxpGFIvkN0ZqxHyEUYrSeFzXk5NQBuhlUJw7ucRXX8AZHS+bMRkzTA2nZdqbuVZvBL
 J3jR6WMwdsEkXEPWg==
X-Gm-Gg: AYBFou0GbtwMLu7CSbS6jWjv8AzJhXpfMQy0xcZk/uBRMBRP1XPOOQTawiD65KwlAL9
 0BvkY712HipTKs4LHMNepYM+tANtLgiVsofUL3kNPEF+almyB+f3oCH1sAzcrwgvLJGLHGEA/T7
 IqHzXLEWob4gWQZTdIfWxM7TBMRi116RoiGu5LSbERYg7fbDNQD+GmtA5GX5hCsOUbUZ8YymylI
 LQ1KUH5HJzdTjHEF0VRh92hxHeSJIWw5WgIjb51puVRqv18XK6kmAR2DEBw7CVs4pp3EkGBJG0g
 5FrKuwJP1h4TxNKCN8bQ7Csex597GgmJ8SWTSWDJRnFwSi/60geZsuX8oWB2o8FIHFP95H4Ryd8
 FVPH22PSapCh9j5zKEhzehsVX7sZrbLcSSh1H7SfjFQ2+SS0GWzpfHftmRCSxHxv4wxR+sk3Mi2
 fZZ7aPy5goPY5ELrJMI4iTW3VPUBB1rGtI1/1A/Jdl
X-Received: by 2002:a05:620a:4515:b0:93e:6620:bde7 with SMTP id
 af79cd13be357-94408cf3ed5mr570685985a.20.1793223565537; 
 Wed, 28 Oct 2026 14:39:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-940f0a8c19bsm197814285a.19.2026.10.28.14.39.25
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:39:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91c046843f1so10701696d6.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:39:25 -0700 (PDT)
X-Received: by 2002:a05:6214:440a:b0:91c:7a28:ac2c with SMTP id
 6a1803df08f44-91c7d1c8ea8mr60274586d6.45.1793223564501; 
 Wed, 28 Oct 2026 14:39:24 -0700 (PDT)
X-Received: by 2002:a05:6214:440a:b0:91c:7a28:ac2c with SMTP id
 6a1803df08f44-91c7d1c8ea8mr60274106d6.45.1793223563926; 
 Wed, 28 Oct 2026 14:39:23 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c6ed36451sm62806156d6.34.2026.10.28.14.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:39:23 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:31 -0700
Message-Id: <20261028213744.511429-11-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 10/23] packages: sync host and target patch
 hooks
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
