Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCF3606EE88
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rIpzaY2D;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=V+48WqGB
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2491940877;
	Thu,  5 Nov 2026 13:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LwM1yp7wxuy; Thu,  5 Nov 2026 13:23:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 393144084F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793884986;
	b=S81TqB9OVkPJljh9RY018EkEGKktAhBY2Vp2gprIbFyC8m1b+WJYz+9Vv80VR5eIVKXA
	 WdqDZUq9cCZ80g1wkmji/KiaUsW3sNrrh/E+CLGJ2Tgi65qVpIB1OwVj6UdSSJWd8tOX0
	 N/KqW8FKOMH3vwg5j1awJaPd8oXpCnVl64kzl/RYPEeZGNhG4e7WSZlwN0T1DlPITNk5L
	 nGLRMZv3asokr4i2UG6OBxq93TAh9DGUTA1rEeXnRJHXLDwOW0EwrI5LtPiUPMd7ZRDRR
	 jCkbRdrbDJfKp5M8S+3ZcFZWLKczvkShBRpwXC0pZul5ERb6fR81ERHz+aYLkdXhDLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793884986;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DPsTgW2F6gkAsC5VyrRfDB/6qSge+naLUwWotLzEwwQ=;
	b=nmT3yTUPeA/qz4fwBl2/kJzoDPklYELLbeUwj6zlj2cagrQXMamAqEi9Q1VArIGYnC2v
	 tKet1N54nZF2WxZOQ0Wm8dVRQ/7R1o9tkESQEdjV30yIdh/WGvwDoB5t9doCzREtVjKic
	 yyUbPgJLoFWxVXqLXCNU9NEweGqAbV3ZECm79+1p+YLgAW7PXcztBR6Em6+bHJh7anMAB
	 ai0xNlBPB45SXNyVq4Ux+9ip+m9/hApi1yC/bFAkGpTGf+by0n5r3jorfr8pUpdG+hQaI
	 nCgLv0p7RirG0uUhRT7X/5g4VO2Ltije58icgijfASlwNQEmxTfcdalgpkjVfvcpPEg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=V+48WqGB;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793884986;
	bh=DPsTgW2F6gkAsC5VyrRfDB/6qSge+naLUwWotLzEwwQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rIpzaY2DJfgzPlaA1jkz9nq+4K55sMkxpP0srhf3rLJPQQB0Fjq7baFJV95ybS0V5
	 yTc2sQm0ClHwy2yziifr5cA21oi+/sDCV/pBqvtGiaPYRuuHgddsC4PFne9L8+ZALx
	 +YR0LCbC0XunvK8Izoh9DA7hH64xzRPBQ4hF7iE9dCGygyWmbUWkTKxpYrwuQ/fZYR
	 F8CmZ+PbL171ygcwzPGFoaOi2V4fgfWsaJzSmR5X1Zi3yBDJ6QVvZjt0YpTIeaumYU
	 qroEpAdhataBIRmsdbMXLuvfyxkvI0Drw6AEwKDA3Asyo8pkZmEOH7VLBQRSyA6spt
	 7w5TyyeNge1Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393144084F;
	Thu,  5 Nov 2026 13:23:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B24A234D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AED224084F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jXEUXzJPIC2 for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:23:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D1A3940508
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=V+48WqGB
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1A3940508
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:01 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c43373ae89aso271821266b.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 05:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793884980; x=1794489780; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EHcucio2jwDxEamW1LpU2a6GZhArXQg3HJ+h1orN9tI=;
 b=V+48WqGBcjSkmLXwRv3GY8euS6m61ZGuz0A1Hd/8mR73Gi/rm/NUAe9uQrBBJwz3+m
 9QivQ6dLPkYDosYQQfXTJYl0E1V3FcQyKKgExs5DNULHI9/nZmO/U+G+0z19vAy+yBmv
 nx8OnVAjf72+Bc3C2oq+tFMQgZVXhGKSotmfA7Ol8i/Fk/s8QvaFQEH19rJn43gocP9s
 onV4F5Gc0Bd2A8QGi0ZP1Pcqoqos7Sci5hn/3E6rgSxh1URB9wJKhzT8TwiJYxzaB0QB
 UmWG19Raf/mc2XFmXeJ1NkGalo+r/Q2+c5tjUtY2DqVmLH5gc0ChtGng9eVlnTViqMdc
 a1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793884980; x=1794489780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EHcucio2jwDxEamW1LpU2a6GZhArXQg3HJ+h1orN9tI=;
 b=dVetCjpqIBowhGm+acqvj1QJb9hm6PvE9c2GcF5XQfwB/XAr1pddTQDrKaalY6i6N2
 JFAmPDaQ2GJ8dz6mUwFVH2ByQTfyUfHexYni/s+C6u6tfRrpycUkB2ityZH843ttvI8x
 MsBzzzoSZb0LyiG+D8hNbu0LewJEArW2M/NOW2UDPYa1cs6hbD1Mx41I2vpbE5OWgcaV
 mlzCYSoLQZAxYhXHP4ecbmcKTW34J8BXc9jD/B/6CynzTqAhzHgmgbcH+EzGOmMq7/Dw
 lXKdeRQu37bgMQ576aR9ZiMs5y9FXU54hJMMDv3Ue5Z2YdNY5mAiv0YQtP8ELu/cpIZw
 wXOQ==
X-Gm-Message-State: APuU4Z81/FJCHYl6uM0OMSK1rGo7XyGJpNuQjVDhqy7FUihXzE6WY4VS
 E8BblMXE86R06OA2hZZIx0vvkvq8sd33JVQZztPeMSoIyDWpk0lZyjou7KxgCg==
X-Gm-Gg: AYBFou0APDVt9IQaSgKLzhoVWphdaSyzIj7H/P+WVbYJgZoubfn2qDb3t2VUVqdTWOJ
 0+7vwUS71mV59qNsfuHohVW6DENG8yOeBKpZ122XJNrUhyluEserdICbqWcSiWJs9GV+On00S6N
 at1x4PJOq9rpYea1P46jBb2cGh/UCi5dx5ZNbWu/IYQf+76L8YfdL7pMa+bEkqzjUXkipHSVq1C
 7lVX3B+i69dOsf4xmuuXWhgz4a4ZlB08mG/Tf6eEwjgKremmVvDqUnNpo4OwiQZZH/dUZ0fejfy
 yL+ZMymwtvlKLhfFvZ1PNPqc+rwpwa/Z4PNAxDen6dRpdEi5yyWOF+j8qWikzkz/leQlksmcZpi
 hwKYS05UIbSC4TL+x0mTSLMrKyfw2mMOFc81TerLX5Mtk21Jak8m7JOiGeA3FMB3kEelqf7TSy5
 vilFpkl9HJwd3EOduLqcBq24NIsILez9alkYBoxbYS4MIWh+BAHTZku1fX92uYctiPOo3wpLBP2
 BZv5MoHmBs89JdVt4WDNaElQAOm5rmoTf/+UaRU5AfAXcGvHZuEy7YRTW4hRarG4IfdXs8sUmmf
 Q4bi8vVug4kXF6DbdM+utGS3wlqv5BHyGQEL8o3zDilPABn0lBKfWTIh+J89pjvmftpEVOj3eeG
 AS9xEnoBj
X-Received: by 2002:a17:907:3d89:b0:c40:cee7:3918 with SMTP id
 a640c23a62f3a-c4ca7b62b2cmr1679018566b.44.1793884979355; 
 Thu, 05 Nov 2026 05:22:59 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e424fa2sm172522366b.30.2026.11.05.05.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 05:22:58 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 14:22:53 +0100
Message-Id: <20261105132258.1868556-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/5] package: download VideoLAN packages from
 download.videolan.org
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julian Scheel <julian@jusst.de>, Bernd Kuhls <bernd@kuhls.net>,
 Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

get.videolan.org redirects every request to a random mirror, and one of
them, mirror2.evolution-host.com, has been unreachable for months. This
causes recurring download failures on the autobuilders, which run
without a backup site (10 for multicat and 11 for libdvbcsa so far).

Switch the five packages still using get.videolan.org to
download.videolan.org, which serves the files directly and is already
used by the other VideoLAN packages. The tarballs are identical, so
the hashes are unchanged. All five were checked to download and pass
the hash check with BR2_BACKUP_SITE="".

Yegor Yefremov (5):
  package/multicat: download from download.videolan.org
  package/libdvbcsa: download from download.videolan.org
  package/bitstream: download from download.videolan.org
  package/dvblast: download from download.videolan.org
  package/vlc: download from download.videolan.org

 package/bitstream/bitstream.hash | 4 ++--
 package/bitstream/bitstream.mk   | 2 +-
 package/dvblast/dvblast.hash     | 4 ++--
 package/dvblast/dvblast.mk       | 2 +-
 package/libdvbcsa/libdvbcsa.hash | 4 ++--
 package/libdvbcsa/libdvbcsa.mk   | 2 +-
 package/multicat/multicat.hash   | 4 ++--
 package/multicat/multicat.mk     | 2 +-
 package/vlc/vlc.hash             | 2 +-
 package/vlc/vlc.mk               | 2 +-
 10 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
