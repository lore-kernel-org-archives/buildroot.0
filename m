Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592EFC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 20:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D94CA41720;
	Sun,  4 Feb 2024 20:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D94CA41720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CuoWXMisZnxE; Sun,  4 Feb 2024 20:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 215B7416A5;
	Sun,  4 Feb 2024 20:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 215B7416A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9F621BF425
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 20:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 896BA405F5
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 20:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 896BA405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ukFMyAP_tHAh for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 20:17:05 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22147405D9
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 20:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22147405D9
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40fc52c2ae4so22888075e9.3
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 12:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707077822; x=1707682622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UECALV+pPnrrtdH7EezUqJy8MWuPYsoOSg6N++Vie9Q=;
 b=uEyEZWdQu0GPJH1p3RIyDrlipvHWN7F/TEXU/Cd3bZojVribPAtv+1/DqizT7lx6XJ
 qlFQMBS39nrYjLqsYkiGitubmZs66DZfMnWZzWwmYI/n4Up/bh7Ri5ZwxebR8RtwdUz2
 QV9IM6z2k01NcLQx6CAm6+mCnznwm4wOibgk6B67J1Lihof6vUzIUiBRsfcIBl2vqGNh
 0i5WGWASIxRzNQQtJiICX6edWnrUhczdLDxBEiCirSuAl4gW2p37z0kkLuSi6bEQtbjC
 oh08Pr6w2+bHxvu/K7E7aEwmJA1ukt9zhCZH+43qTysDrVGQyDXToZO35u/jDWkSptd/
 Hwiw==
X-Gm-Message-State: AOJu0YwP2S7IYLjdaKlNEb9/WEGaxlB1Cawr+D5+r6ABb/gAVuUFaK+L
 W0fXCbIBjZfbBjKEpdyJfKKKjHCcChC/GxRHY4PMGhjJXi1T6FMdujSpyinfycCyDg==
X-Google-Smtp-Source: AGHT+IHie3jvlWl7Dz5z9BoYljrFQAlauyZLh2sDZzbnJMzvcDzTF8fwpCJIqsfHoYOgsmFUhJh8pg==
X-Received: by 2002:a05:600c:3147:b0:40f:b68e:165b with SMTP id
 h7-20020a05600c314700b0040fb68e165bmr3022686wmo.24.1707077822250; 
 Sun, 04 Feb 2024 12:17:02 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUB4OUAfnM+5NDpewgs5yF7jXTkWIpcpmr9SlunNg7XCbGXV1rAloMB54DYdBObA87mSYKf6vltSWY1TmLKC6BSAReIMdnCmDxmv48isA==
Received: from aleksandr-System-Product-Name.lan ([146.70.124.140])
 by smtp.gmail.com with ESMTPSA id
 hg12-20020a05600c538c00b0040ef63a162dsm6458108wmb.26.2024.02.04.12.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 12:17:01 -0800 (PST)
From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 22:16:56 +0200
Message-Id: <20240204201657.33079-1-aleksandr.o.makarov@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707077822; x=1707682622; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UECALV+pPnrrtdH7EezUqJy8MWuPYsoOSg6N++Vie9Q=;
 b=EL9z4bgRHTw5njT2gx1XGUxM47T7lAtCbycJGh2TtnjP17DYbwlCCh9W5qq71hELOI
 uRsQsAHpiPJPzjZPZ6EZEXkzmrYl7QfpWyQ+JqJGc+DgwApe/jxnZ/w4HQ9v0wKMn/G1
 uhXT6wBR247XJc4gVVp4OzZ5Z4Fh94KiQ2EQ36Td/n3O+MdzvA0anqllOpSxraNE9cAq
 sFRoW/dc4Q6BpuJVa31W5kS1muju5Pjz1rjK+4BWQPhf7L4L5lvXJNmOC6L3naKV/b91
 AiUB/xcWc1UImbNRKELHTuuOr2YCEPR3baWs0KIx70DWVsbTkbzBuUDC50Z1GwALDWLn
 qfug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EL9z4bgR
Subject: [Buildroot] [PATCH v2] package/haproxy: fix runtime 'FATAL ERROR:
 invalid code detected -- cannot go further
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a re-spin of v1 that was modifying haproxy's Makefile and was
rejected by upstream [1].

I made a v2 that makes changes to haproxy.mk recipe instead and dropped
the .patch to program source.

[1] https://www.mail-archive.com/haproxy@formilux.org/msg44499.html


Aleksandr Makarov (1):
  package/haproxy: fix runtime 'FATAL ERROR: invalid code detected --
    cannot go further'

 package/haproxy/haproxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
