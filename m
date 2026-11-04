Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4871D606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HmVX4usl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=g2PhhiOC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1740580E7F;
	Wed,  4 Nov 2026 08:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNyafH_Pl1sy; Wed,  4 Nov 2026 08:27:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F3B980E1E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793780862;
	b=oBYw1GQJDka4Sbg5iv6Il/BB/A2DTnl/rbf9xy0kyL5lt2GcPUrTMJ3yF6ZMw+KUESP5
	 W/1dKgtcj+MmtkZDkxRvcOJOysaWQh+Yy9Obb/WtFyB4zCijYVxm6Oj+XbGYK8xaoJnwW
	 +KY7+hxV+pTSoMroxWSpmG1t9hN4owKK4A99Z3wWUsAofFS6EKMnI9hlJRg/oPUVhroNY
	 rsBapl5ZN8Omd3idvscoN+s/IZ3qr4WSS8PRXgK54v1334m6M+oznoFmpJEBS+Vuv6dyZ
	 8h68ywzvT7M1s5bFB19BsiMJtj8AD1HIZg1YGBPtH6GYWWCe0N85qxAzJrIM6xrQHhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793780862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cAkbgs7a3XkOwXA+D8Z0iixoFmL7T930Z1iiT13SWNM=;
	b=TAoEih05OZc5BeNzHdVp9Non7k70+ocNLVOIrcvqfvT9K39T+1D8YFwmP11rG0w6wEuI
	 CiFjxYkX0MM20aYtL2wiQROW6727IP4MFpKUKlWlhNuDN5LrtBxzlOAWITWJ6YefmtrKs
	 i2qUWWn0voSxedAtVQden0gmZyUyrjVkl6quNfMYbsxthki6u+Fo9vRObzfA0AzAUZP2u
	 lrPiUNL157BDnHFmjN/ubUwQcXeSPsg4wHgGmDe4eceLsZmjDpFH1vHYFicbOBymu6j/n
	 YYEd9QRSc19Bqhbe+jMId/y9pChUqb8EwmFO3TPZAf4kvbqYCLMatJrvQ0vzuNhfuhQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793780862;
	bh=cAkbgs7a3XkOwXA+D8Z0iixoFmL7T930Z1iiT13SWNM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HmVX4uslIV7FY/dEqWY8hYl7G/A/ycfjRNLpzX01nmOBncf7u3rL3KERJ0h7+4IXk
	 RxEkQK8EWkDzq6cmt9HdIJQAmMTMLouOBJfIlpPBGmcgIk/8HVjgAYorMRqhpiaEcm
	 PJmn8bT/zF7eHRRtga/RmOlxDDZw2xor74tMGJcuRhyhMuvvf5/XziKBDbO9U+y2xd
	 UqnBRUo6JBAKxCSEqdzblCPDzj53TEQxtj54zN2ADurAbkqFdz7oPkM4qjFY4X+D6H
	 tsT6+LqCJypffwYFtSe6ER+KajHteOGNKF80hkuaEFaUuuCphLGfojCStFP7YnuisF
	 Io9lKx+lyjbjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F3B980E1E;
	Wed,  4 Nov 2026 08:27:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BEC62AC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 08:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6517401FD
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 08:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Tfc-oLV6r9P for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 08:27:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D23314004D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793780860;
 b=MczjWDyV6WeTJRGsIP1JPlJDlmclbtVniTSJF8nDWqlUdl7CvOSqb6s+cAdhkihT8IK1
 /yZ/R9qehbnxk4o3sUzEJcbfL4phy3my/bTWa2GBhfgjQnvxlAv1ZAwDmJxukqlTks3a3
 hd1l1ZbhEkMhbGukoaj4HY/nOD8vD+5eBeKjTwAVKmhAQKVrSjbTiyI0NnsQU+JcUIBsw
 fflbxeVQMUYuWJwRr4KdsTphJacPNPK9jLrU0hjyg2kdsOcFGwf8PZCuTlFit8iwKnohn
 fQCQ4aCOA59OCZvhN6FpDxNTw506R55MPxk+mOMYWDwOKcBLu7SeG2brhNukvvWbd4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793780860;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=jQ6CfH2Aj33MmhhxdCJaXCRAF1rJ5n4qxsqyMX5suuI=;
 b=Ox5znM8/fm1AzH+fV7lazS8dI9JbWXcDEIKI0B5KkjeZ6Anl91XlcyH6jFZexFrqBRXK
 VNiMqDYVOYVqUi3sO19y/vgk1M7XY/vn1gtDE0vConmyc+iWQqbBnLiXccHjDxZlybHJk
 Mai31kNp35k+XSsz3cQ2v00vbbz4RbbZJHAgFS0Zanv8hLMBmoLamM/n27+ViyzBCL+5j
 9PSpm9JjwYd+o6Hqx3r3b2dNMeRp9S8kJrhjXEU9j7hrR+ET/GNBYDUtuG7RFN3FP4wKv
 EJIhl0+dxlI2WoJ4dt4zRxAgLUV8pX2aOIeVGHD/YgbO7jz9A6/HUk8ujDAQjMzPD2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=g2PhhiOC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=g2PhhiOC
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D23314004D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 08:27:38 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6b4b7dee316so369143a12.0
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 00:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793780857; x=1794385657; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jQ6CfH2Aj33MmhhxdCJaXCRAF1rJ5n4qxsqyMX5suuI=;
 b=g2PhhiOCCoNfeNsoplhavLCvAwWh62je2R0wXgZycZbWgR3b2lqtN2WdeoHbktCp6/
 3yJvlEj+CwMeuaMSG3ln8ey2oPSiPo0L/dEv0pm4bHwZLEFdHUGgaDN99rfhfgpCHLXS
 Cjfn5uNKECPRbpzuwty8RuaON/7Is6agNFoB+Ey5QnaoV4ns7a0GQhdgVV/NFHhF+eMN
 Bq0CfhZuh6s125bleB5Yc0hg3v8Q025mLSYyaQc8Fe0PRw1LS5529fxgq3EnMbBCtg4t
 u4P/iS9DU4p7J5MOjiWvOPYJuiivzxBI8035Vs4dA+AxZDpIbvdSk3folJyi+Pl06OMe
 bePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793780857; x=1794385657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jQ6CfH2Aj33MmhhxdCJaXCRAF1rJ5n4qxsqyMX5suuI=;
 b=FE811F9TjwGzvknXZQ4LKt7RWC8qZIUv0JhWncriyZuUcpSJQL3Qd5E8ly7K5pagPl
 CRWgefOkNO/iAsQvKyvs0nBrN9IU3eTAZDOJo50OBrBWACvZBPmDJ9Xd1Iwu6mQODmoU
 ej9tBo2Kj9EkpGF0DQOkt4WCkil5nToVD2QAMuhrQiJ5K44OgCJj+gfvrOO3XtwqNhxm
 VwmOtEeJSLC3UsNZZCRXVH8j3ZwaCR98V2QHzBhbk8LC3IdcfWop4rV1rkDpMIpbKsZZ
 Y/QHTdzFfJkEnWuj84TWbWqd9IHhhFqaK3GyQ2rME/OQJSfZxry6azVfsLi2vmk2Htgt
 Ur2g==
X-Gm-Message-State: APuU4Z9RjvlqRmoskp462Z438c8xub4wLRsx0EVZMcuuQIAN8Pg8Royc
 TyH2Dy4Us+I6s6ln9W/Wh+HvY6JNCezlKBWL5m6u93lC5bgyOEKge9NLqMeGOw==
X-Gm-Gg: AYBFou18dv0AWXDXyInFf5IShAhwzGMKGjE/Mtc3D5cd44Use3ysPo0DyFYHeIJVZtc
 F42Wx+xnBBzfXjNufXgqIyxe+adLaixc8LdGpogT/FNEWRpvWXgJgVLffnrnYCaUtk+tlEmqWc7
 UNfKrZuv4a8EavdZgDxQG7NE6eNHEThfO8TSHROEQ+9BQoP0/VKeQ7nbfMbUFiSnrOO1GgeFgct
 rrUZLIQbT5WHAtKkaDx+6SG+PJ6MVpNF0rb/yJHMSGohwi3tjxq6Rrwyzfd6EFhIkz3NKsz8302
 WGuUghpGwPlBjH8PCPj00jNoqCVJTJZXAxRqumenaNQrd6OOAwNki+vflLgPMzmhwfjhLRery1s
 o+9xEdYDYjDLHryS0iTPTUTHyW29WAt+NCvmiT8N3/cH0RugY/4WwDWIwZ1JAcmwti1XqgIG1uH
 ISgZV5pFdRF9O1wL0+KXIGPg2Vs52Sbb1GT5sWPl9DoNF/AKehIf5VI/2KHcJRpzkMTbU6w2v8X
 RpOJKeVMBBe+iZRDbyRFwH6eznCDv1GjdF+ZFeKT3F7boIbuwlVUUejksjRlRnmmzLTCJhdQo1b
 kUZLsSbOT10v/ZsOfOW/huTx1OlaczbgqWi0Dny/vL1W5fA5jVwT4qPzbZhoYoq9XpPGeqWONOU
 NzTeb8A50jgfV4homS50iHqeZfUKv+g==
X-Received: by 2002:a05:6402:223c:b0:6b4:2806:b057 with SMTP id
 4fb4d7f45d1cf-6b4d4d80570mr7194232a12.35.1793780856574; 
 Wed, 04 Nov 2026 00:27:36 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b56a54df86sm9712a12.11.2026.11.04.00.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 00:27:36 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Nov 2026 09:27:35 +0100
Message-Id: <20261104082735.4134892-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/linux-tools: hv: fix build on non-x86
 build hosts
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since Linux 5.4, commit 9b5434196529 ("Tools: hv: move to tools
buildsystem"), the Hyper-V daemons are built with tools/build, which
first links the objects with "$(LD) -r". We only pass CC to the hv
build, so LD defaults to $(CROSS_COMPILE)ld, i.e. the build host's
plain ld. That only works by chance on x86 build hosts, whose ld
handles i386/x86_64 objects; on an aarch64 build host it fails:

  LD      hv_kvp_daemon-in.o
/usr/bin/ld.bfd: relocatable linking with relocations from format elf32-i386 (hv_kvp_daemon.o) to format elf64-littleaarch64 (hv_kvp_daemon-in.o) is not supported

Pass LD="$(TARGET_LD)", as already done for rtla.

This issue has been present since commit 2703383c7201 ("package/linux-tools:
add hyperv integration services"), which added the hv tools while the
supported kernels already used tools/build for them, without passing
LD. It therefore affects 2020.02 and later, including 2025.02.x.

Fixes:
https://autobuild.buildroot.org/results/86c33797a5f09dbb1162a554cb6019f7c0702fbd

Fixes: 2703383c72011d38a1e3559cb7a5a2b0071b35c6 ("package/linux-tools: add hyperv integration services")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/linux-tools/linux-tool-hv.mk.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-hv.mk.in b/package/linux-tools/linux-tool-hv.mk.in
index e638fecfc6..3aead40178 100644
--- a/package/linux-tools/linux-tool-hv.mk.in
+++ b/package/linux-tools/linux-tool-hv.mk.in
@@ -16,7 +16,10 @@ HV_hv_kvp_daemon = hypervkvpd
 HV_hv_fcopy_daemon = hypervfcopyd
 HV_hv_vss_daemon = hypervvssd
 
-HV_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(filter-out -g%,$(TARGET_CFLAGS))"
+HV_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	LD="$(TARGET_LD)" \
+	CFLAGS="$(filter-out -g%,$(TARGET_CFLAGS))"
 
 define HV_BUILD_CMDS
 	$(Q)for prog in $(HV_PROGS_y); do \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
