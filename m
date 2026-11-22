Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080AE606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lkk4DpJk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9C23405E3;
	Sun, 22 Nov 2026 14:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKdLV1AGk8Qr; Sun, 22 Nov 2026 14:34:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DFEC7405BF
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795358099;
	b=kb3Y6RgFcby1s5UYplKMlbMZLiibjiXeTWVEHPp9goDlLBCAZmEnE25RAgRzdgfuKGEj
	 aiCKEiF4wgF3kVSYxaYIzwYloZJgKqLKHCyBs2v1khqTGxkUlAPzlgyZMn8zoz4GzZRVy
	 1lN0C/9a0xTpb1h2jwZYjZRb1Hxmgax3BJyPk/x4N1pUHXu7Tj31/5LGi6F/Mecurk9b4
	 uWC2t6NSw9ix+js90a/LTRVcyvo+ZXvfeWkL+H0IQKOHIeIfJrCKEMAojonhGBoEFxyvI
	 Zl+PQ9LXvmr5+k4qCILTWGHN7ekx6gy4KnBZxEgJcgHp3951+s9sRG7nfZCE4x/W1kg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795358099;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/71blzLkOFP2DzyBykl9SPpsQRyvNDTtQGiuZ9q5fCI=;
	b=Y8C3ROD0HCPItgWXB5fruIGsjXsq899IY6TXMMtFhHyr3eWxYjLiH3w4WYKOoi3oVHZ4
	 4G44LPsY1hCnPbHL7X/PXn01lL4DHnsvIIj3KfRgpQ4yluwh3HQXNeA9Xc3HmTMhnKQJW
	 F1ic4aTkoD6pWVPPr1J1ROCXbBH54tvRvsNqwrV+U58y0F47+ku6D75JETBuqNKyteH4r
	 q7y++4n8mU+ffhIpS5VKeRJd0QuwzzeyVb8pIR8SPD52vKruqwR+gnDz1tmaZjtUPAQAX
	 Am8AS38+kU45RklEdH0UkAF/37OYLruMvTjmBZV01Wwbf4n5AVtIDoNwiPvXPIVYx5Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795358099;
	bh=/71blzLkOFP2DzyBykl9SPpsQRyvNDTtQGiuZ9q5fCI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=lkk4DpJk2VsxmsAvTFW3IfQ1dpjRO3TnXcO0HZ7T7KDBP4RbRV7PErYEM97jG76dK
	 G2hNNz1S2GZlFyuUM+eX1ZXvwUqzTbY8/35vgRCE2BkrX+For6XeNWbTc9OfOvGLp7
	 uMWNQdLVY4FQ6h9yAmW89tdVHr4b9HC99Bq5fPhfpTem0BiGQKXuhl6T5GJWkOiAE/
	 lmxbKwY42LlhnsJPnhGcX0vbBwLaZjw3KbzutVizLQlMajTksb5qGlMyBrqyNrR1aY
	 giaqztJZUFX8ZDUkCOd+ZqngSf8oQZspl5JTOj1HsPQLGZbGHN5snurI56nxkhkkmi
	 E9Sa8CQO/+3Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFEC7405BF;
	Sun, 22 Nov 2026 14:34:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C09BB371
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 14:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8D9D80994
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 14:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RrEjjhGTJumv for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 14:34:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 810218083B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 810218083B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 14:34:54 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c516a160f91so74821066b.2
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 06:34:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795358092; x=1795962892;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jvnR1l/zGVR3NsXochjD6tg2OTYUpYtbDRJdh7duCak=;
 b=Dv+S/lABuJchQX19Sw7rV6bjwPurJJK530A/VGtSb37Lx5POp7t/1k7akpaBgSbcaW
 GlIbrnB4wc7XUN1t5G60pED6mynWQ8oTxxAuPGv0e+Gpz6GLSg0e02mSb7lh0aAkTpYS
 fcPphgmTLQDCaniBPKQS4n+UWlEmt/+dGeGmi5cRwGV67e+lqwccalhVQp7RjcENrqUm
 uUwmNI1obaILSymTHlYAr7AlHTjCkLOKEa8xnKAAAV0eHdl8fGlY0v+esxikU0l7TbYd
 VRswDAyHwHYp4WCThB65Xpr+iJIryZRbwCk1t8Vcedt8pCqiSF6B96h1Cm5I7XkTQaSS
 ThQw==
X-Gm-Message-State: APuU4Z9/11xyvbVuZETb+s3FkL82Aiscalz5I0P53N8gdid9qq30mrkM
 Fc2Gw/c1EF+oIlmX5f+g1JRSahXCK0Ab3qa99Rzt2Zfa8dT+YDgdMDZmuNVEBw==
X-Gm-Gg: AZFdTZdm2KmWQ2r/Me4ps3tvhjIelFue9TOwTmGiRLbc26/k0pJAnNRufO9H0ibFXZX
 Xm8WLZ206OgsyBfplBRcBhltoaC2xFV1p0q1C5vnsErTCKH/3cWqJe+nyH7xFQ3KYZobnRjAU8F
 pJ2TCT63hiob10EToBA69RlEmQSp9xnnsVnwG1e5u+aMkPA32UFcww2rXa5jrYJjNjxvl9HT9kH
 UCBafRdEasfe/BLYHCHx6vV8XqEpeLrOcs6hlW9Kz6oxrVaOdLkMXiQ5+jwCwT3oOKe9/WK+hlw
 6fvHY7mQaBRUx3ka4NV/ovFRN5plJ0h0SXFdO0mdJW8xFDDb6+zyHMpra3GPgbrjtrJVfnWEone
 Iklt70COvjpGKvG4COqR1KX/rBYLYBW4H13ZJrj5zBAnoGWuoJdpBvwKh9eurswKL3HlT11OiVp
 aNey9clhqXJVjGcL9IC/APv3Qn4SnvjvOihY1lkky1zIu+tW3/VPlaCJqjDuILZ//PVxHM99hcS
 EPEKqvHBppkWr/SsjscEI9dpN5KZNUe2QYwwCZ0wqnvMo//zJL6cTC6jan5cYEHiKS3LYDDPdS8
 IYGzVAD5jD7UC3mPzm2ZpRqI42PW10oaxwVIWTsS9pVXmerK7QJkmOMFjMKNrz1zQk47ndMOExo
 6poQra2jZ
X-Received: by 2002:a17:907:1b1a:b0:c50:52b4:eb04 with SMTP id
 a640c23a62f3a-c513a99a675mr721097166b.16.1795358092102; 
 Sun, 22 Nov 2026 06:34:52 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afe01a0sm318357166b.68.2026.11.22.06.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 06:34:51 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 15:34:50 +0100
Message-Id: <20261122143450.2973760-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [RFC] Xenomai users: which core and C library?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Pierre Ficheux <pierre.ficheux@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

I'm working on bumping Xenomai to 3.3.x and have sent the Mercury
build fixes found by the autobuilders upstream. The Xenomai
maintainers asked whether anybody actually needs some of the
combinations Buildroot offers [1], so I'd like to ask here:

If you use Xenomai with Buildroot, could you reply with:

- the core: Cobalt (Dovetail/I-pipe kernel) or Mercury (plain Linux)
- the C library: glibc or uClibc-ng
- the architecture

Background: Cobalt has not built with uClibc-ng since Xenomai 3.1.1
(lib/cobalt/rtdm.c uses glibc's __OPEN_NEEDS_MODE()), and that includes
the 3.2.5 version we ship. Even with that fixed, on 32-bit targets
libcobalt calls the 32-bit vDSO clock_gettime with uClibc-ng's 64-bit
struct timespec, so the time it reads is wrong. Upstream only tests
glibc and is not sure whether supporting uClibc-ng is worth it.

Mercury builds with uClibc-ng once the pending include fixes are in.

Unless someone needs Cobalt with uClibc-ng, I'll make
BR2_PACKAGE_XENOMAI_COBALT depend on glibc as part of the 3.3.x bump.
Mercury would keep supporting both C libraries.

[1] https://lore.kernel.org/xenomai/9ce50b6edee8bf79bdb9bccb37decc9418857628.camel@siemens.com/

Regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
