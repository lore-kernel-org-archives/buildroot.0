Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C22606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qG5BzS6C
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E06B0409D1;
	Wed, 18 Nov 2026 11:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBwt0WgXoWOU; Wed, 18 Nov 2026 11:44:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E11ED409B2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795002253;
	b=FXJUFydzDGeVYyb1KW9FiFYwOlHxtiu/NafWqHfhgnPwmQdDwDP0HpEOsNEj+T9fyAkB
	 SpUVE28pKZgPG7b0fOSHZACJPIsipUrK5ca/3wHIAS+b6ZT3+kB1WApiLX4yxbRIsHwux
	 JykboY3hhhNQ5wNnj0UVxfnJkGgC/6IVB7MgpFjnrZ9llrs1VRa2KVvgoiBYgspRasJJI
	 hJkoCzdE5MIEJBVLo3UovvtH0kZJZFpMG147JqiTtn2lIX3STL08HyO0KW723Ink7OLmI
	 Cu5/ZtiuCWAYVpq6MUeTSX85t+1d0K2GaUJjh6MBTZZoZVxdzJ4IKJ4lrGYmHYRtPCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795002253;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=akRcljoAZZrJA4Nv4g1jRLTSvrzY90dfZqAu2qEdlPY=;
	b=VuD6oZgOixE5GUMr5ic9IWku9wGeWbSMx96fE7za/5SMqf7AjAE+rvDx9xAtHDzkQLPi
	 aDdgAT3fDY/jghGTKJArk0N+GnDJdcuCT+NldO7Io1UNAhIjVjfdqHqjJvfJtnZDBMv6v
	 +yYw1vAwVa58N3YLa7nVd0Vc6u6kCw8y3tUersvBuLXDXG6dKAtCb6Dm7VKTsLR5MgkRt
	 jv8OMrnUWmIUGeL9A5N56EP28HWb8zIsvR2Z8KlyZ3OqbuDHoHbmznGlmyjgSuDaz7ijk
	 0rZa8ATrN/WT41gJduzvjkUSaqXhXDRsG4gUjOyt7C1GiVkJOwwnHUrQK59itPN6SyQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795002253;
	bh=akRcljoAZZrJA4Nv4g1jRLTSvrzY90dfZqAu2qEdlPY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=qG5BzS6CrDb9eTI3eeKIJzhBBE10gUTw8Lx2BYhTH1T2UiC7kvGusnT8Jkdf8AwLn
	 jBXiFuorMW9uEfuo44VmVIiPhK3RMFKDryKx4dDwVSF0IYI3kj5SpJe/GgRLak0CRu
	 6ZbVkhbZacGdBpdwm0XQmkR8O14XzO5Hgw2AEbfGTNvVFP+JjAQS1zqpTVI2Tydrqy
	 JYaC1GGHkpyAOdyxcpAyulAcArGw9d2BnPpvomBVjGXcGZ04amD1I+Qc+Zurp/YItO
	 DHrQ70lNAb1+I9lPWjcGihrWTc8Jd2wJJ4LXEPSIQpEs6xQskQSqxxc6ZhRzdQNHVE
	 urrYaYjWJe17w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E11ED409B2;
	Wed, 18 Nov 2026 11:44:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DB4428C
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 11:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13711409B0
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 11:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNkOatUl1CPI for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 11:44:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E094E4095D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E094E4095D
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 11:44:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b88b74e54eso787693a12.0
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 03:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795002248; x=1795607048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8Iuy097Tt0IfI6Mg+i+FYLDNHklaEe+Q7GlLiUscAoU=;
 b=LAiLBluBUghedZJwEfHR2PqdEJgD+wyPWuYWwAiOflfEn52+MywIOlU0QWNsvtr5Y7
 /cGRQxkPbO9UH/Rco29iPE0cfzjpVn1avVs5Ns06Adceu1MtIWMUodEcktdztwpQD4h/
 9b5LntJ36DZy/JhxPdSNAzs51U5Me4FEgl3EruygW5zbqiKlKz7+RJ6PL7PL07q8PHdT
 DM/mJ9h6ZPyc5yTHiZGUJsewPLi6gxGRW/j3KbBVS36f14pPLHa4YTkgdxIZu7wL1BwR
 wRWquNKIss4QFcF3+aKn3WlvQYYBwT6B7Cy91mmbenfAZKQa8GzlFJxrJi5kdCKLszQH
 47jQ==
X-Gm-Message-State: APuU4Z9pA3cv6k7CwCvU6B8aeKJ45COVwi1FoF6DFg9FLof0MXR532o+
 K1o13tuqJkZfiKvhMhoN/OpMct1j7QKCfH0y7020AZBp1Vb9y1PWfBHzqqzVow==
X-Gm-Gg: AYBFou1wkDoprFvGXvs6NOfjKewQqNrwHL5oMej4t6gtSbVnAA6PyMFyxeuPF2DKdCo
 bGEtxqHy6sxVXQg/73vpzZnBPcFavnNw8YvPuW5NHmS0SgUcIpTnOhR2NtzLmN9GLzNaiESHds9
 hCb3i83kar0Kl2UohYkWiyKpv4nRWNll5WhbGNBen3U9wJMPa6zFW1asFDBDR05RaaELLig7VBw
 waeBFnO+3vERZIO4sKjrbG4lLhKRG2tllmbyZ/60Wd6bx+Zy5FeR7Ooo6o6lWw+js30HofVPsE0
 x1qRPzOHZfNA3IZyHXn027sMw/YrXH8nelA4cS/zzZL1j5Ds0He0S9UolfC2kBDcDh1BqJkaXLb
 28kilCatlgXj9IcHGUVnyUo7IXXPxGi4Z8Be7luexe3I2YJiVNHyLa6svsVy3N0mdLBg+ioOVWP
 2w1aMDvCRX3RRdEUofWon3uKQWwPqU//7GkGMWnLeJ8age5JygFP9/bDKGEt9Kr6OBQ/SYWRbkn
 MaZGc+8URUl6GbdNEDru19TzdDGpuEbz4MTyThdAzFFSHVTdfQJPp7a8BeqS658OLNcqMd2e7q6
 u0ceVz6JoHouJivnC/YrCbRZ5DMHrSia3aGswshQNwLl58XMBkG6RgMPN3ArAUHJYA3/KuYKEKx
 hi5qZKNAqxhZUDjbUFhqHhcuIht16Aw==
X-Received: by 2002:a05:6402:13d6:b0:6b7:6c8:70d5 with SMTP id
 4fb4d7f45d1cf-6b887c89cb6mr1975716a12.3.1795002248358; 
 Wed, 18 Nov 2026 03:44:08 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b889c24b8esm916869a12.19.2026.11.18.03.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 03:44:07 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 18 Nov 2026 12:44:05 +0100
Message-Id: <20261118114406.3000754-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/xenomai: download from gitlab.com
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Xenomai project has moved its repositories from source.denx.de to
gitlab.com, and source.denx.de now regularly answers with errors:

  HTTP request sent, awaiting response... 502 Bad Gateway
  ERROR 502: Bad Gateway.

Download the tarball from the new location. The archive generated by
gitlab.com is identical to the one from source.denx.de, so the hash
doesn't change.

This issue has been present since commit 44fafcc41aca ("package/xenomai:
bump to version 3.2.5"), which switched the download to source.denx.de.
It therefore affects 2024.11 and later, and 2025.02.x.

Fixes:
https://autobuild.buildroot.org/results/1c4e9be7bd0b27ecedefdfcb29560279c53688c9

Fixes: 44fafcc41aca4c32ecd937c4b7ae93b7a713d9f2 ("package/xenomai: bump to version 3.2.5")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index fabd18fed0..6779e907cf 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -14,7 +14,7 @@ XENOMAI_SITE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_REPOSITORY))
 XENOMAI_SITE_METHOD = git
 else
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
-XENOMAI_SITE = https://source.denx.de/Xenomai/xenomai/-/archive/v$(XENOMAI_VERSION)
+XENOMAI_SITE = https://gitlab.com/xenomai/xenomai3/xenomai/-/archive/v$(XENOMAI_VERSION)
 endif
 # The source archive does not have the autoconf/automake material generated.
 XENOMAI_AUTORECONF = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
