Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC2606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rYOFtoxf
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B069540A2D;
	Wed, 28 Oct 2026 21:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id US0bec6uwtXP; Wed, 28 Oct 2026 21:39:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ABFE440A36
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223582;
	b=b1RavwdZdZGQdMh9RG+foNAWxCKi5D4dULa4khJVfvlKpuJqYwHLwO+DY6bYWWLoSPUD
	 1oRVHM/xJdmyxxgONLT/jHokSHpvUWhcTdDLhDX8zeev23wVnxB84aIpws2XZ3tWe6u9E
	 YTyeCwOAG0gjCpRR0+8aLLjPorDNzUoRZyHj0KFU1BSBdXAfaXaURtn0x768YthtCTIaP
	 77AQJvv/VrYr0wC9gulXwPiV0bdtYXm/KTWB0H7AnkkkLZNQWm0XHNuhdjflvAIwPsR73
	 eFCpWIPjUO79/u0FBvWCvRhprUW9clxz/nMoZeCsGQLvGiqL266g0NfQn3VoylvSWUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223582;
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
	b=k2WDczhRNCCVaP6C5QawlQsRnKot7VZAw3audbFC2zJC5Xs50lBgjh3Qr5nyRo8R6xNC
	 aZosEcKxwrVPTpYZ/WrMIlRxpiV2b6NWBRw9IwRHEOK5z4HxkOUWLSXIPk/UgbmroFD/L
	 neI3z/SUWlqWbJHWT4iiPtAhFmNTAQGynDerurfJwDmFvAJLOdzmKpKjETwm/HkIyTPaq
	 S/+mXA8JgvtWQiRUCq5CXjxVDIc2ZD3RaMYzp395S2XcxsVYF577QOX8rYk4AazF4wcYa
	 VZkObId5ZIiPY+becjQ/3pryla06u353JnU/G5wlHZnvBO6Amdhkt1vF5+7vUihMSpw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223582;
	bh=VGimlgWLuyhh2IfLYj5akhZEGmfkcxGazRTBzo/RHXE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=rYOFtoxfq2iD/YgFww+OVIIIqYSzaTvLy1OnB8wSroSkFuxPL92ad0dXmM1QkG7jL
	 tE8O7OT2wDmsmVYODYwR1YBCfq/8NUKs0odNK6OUOhtmppC2Tu5xeKp2tow0L+BJB6
	 3ZX+Ilxwv+pagYg8rVxeMgokD0qUucoPwoXWsyq9GovAgx1cTmEvm8EAtStPX+4VzK
	 aIqlsuWBQX1DuOylHH3YTj+U7MqMlM5AfEgQjtlQD/kkyRJ8Ft5asZTdvzGI0Gydmo
	 7QpOFzIEdb+dEbVKO/PpoQzwBYKJrp9etTW5THtU5QNS5pp2hR0Cy3/iCgJn5akpcF
	 pdwE71op/9kOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABFE440A36;
	Wed, 28 Oct 2026 21:39:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0BE3120
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9689281773
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNbcKpEgQlws for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:39:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E90B48176B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223580;
 b=CoOWBYYx2ruXwTjj5BRjf+W9lnoQhqCe3w5JAwuzMiTygHSIwy4imGcYOMnPxcEIot0p
 eUUlUULZAjHhhZDCim9VbuS1MWDYHu3ByVUv7jeug+MTLzq5e02IAYGqZ5fiBEW46ozLr
 lmk41mNZ0Qj2S51HI8CfMb84LX4c5FXeihKY8SgN6So3EzVhZtNfa5nNxn1aYefC+Gjk7
 SIJTTLKpru0gnG2nRrecS0FUJLuhT5uH4kKDSge7wco/S7M9ZY9qqVdleOczO1Ei82Yb9
 dzWYE9H8bzXeatcvJYtLkRhpa5G15pcTms/kO9aXXKn5o6DoV4tNWqlExT66jHzOLcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223580;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=9KoqE5jxjBfbjL+QU3JgrAFAKM6NfAlyE/9Ygwu4BiE=;
 b=MmhXB8/P8Df/SqPD8HYx/wBWmqCEec7nl7Kzj2aEIcPX1y4iaMee/ezlYffpH6SEUN8v
 gkif0HE56kNv9fkhqgq2U7zDu4jwy5HAyp5ZVxN1C7fq/SO3IAPmfPvB3+3lSDMbGp/6G
 bMSCVhSWQDe6a7mA9z4PGJgYYNSquZa6/l+Z3f+uvrIegIqeBEwkUO3i/ElH4hKUhXsgd
 20NejB3dJHuyIY69Y97MbA9h1vxZidzwcHmvVXBIUWDBlp46NwA4dnyuhv5W+PCVR7bm3
 IzAebGcQaV9NHVjSaMdnh9h6m36SfNjsUmHRJ7k8eE/FA4zG15sge1l31keGtxHSFMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=Y00jNgms; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::564"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::564; helo=mail-pg1-x564.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x564.google.com (mail-pg1-x564.google.com
 [IPv6:2607:f8b0:4864:20::564])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E90B48176B
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:39 +0000 (UTC)
Received: by mail-pg1-x564.google.com with SMTP id
 41be03b00d2f7-cc7e79c1eaaso705392a12.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223579; x=1793828379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9KoqE5jxjBfbjL+QU3JgrAFAKM6NfAlyE/9Ygwu4BiE=;
 b=zYaK31Xcjq95xV11CVINSImM1b7hVgIaF8IG8PG2jk0/fgqn4q+1x6l4fU8F/zvyat
 HjdsWHvhz4/pJkvAZFL6P17e1Q7VZUNRd9x5Cal4sLD3FCgLd2h9gXruXAq/47VX1vi1
 B6pfn9t1RHccR3uipvx+eGt6xo3q/OQr1Rq+15zYWF8ZupNQWtiD0dL4TLg4z3nzfKC8
 KxIPftpR/Hw6jWj5I2MYkhfoozB1QPHh8HxUzqajG0nnDRHSlJthxm3iaFW07VNzJQ9r
 Kt0HiEU8T8SxkB0pF+JjdE69TRtxX+W52sh8HeWeXDpFd25OfMwmpFlXHEZ9PfTqlp+2
 4kWg==
X-Gm-Message-State: AFq9FYKzTApiZBnsJCJKlrtGGT1CrCq4b83jcHQgNr5FFasdwCiOjxkD
 McrpTmveHmWy05gF8AsfcH0YNsjuaBzGxsOfb0tPp3FD06QYMp1WkmSIkqKtCaUzoulwhKAFAys
 j0Zlkn6U9v8gghbDLgIjqTKyDsv4gp4vbCYEDl/a/BLu0ojmh5u/DaQnY/vfyd2B/DHj5WNLKy+
 oT9O9192e0h+OxepOndYBTJWF6bks5mmTkaNIXJVB7nf8JBC0Qow4X3ZUx/nu1Kh2YbdB5qlexd
 N+ltgEX4G+uNQOjaA==
X-Gm-Gg: AYBFou3QcowPDDH0UXVEwGaHb9jzrZely8/8ct6b4wtbLrH9cE7ggW9KsbZAqNEBT88
 4ZoviTVd5rYmdLyr/BU+dD5QjTIBXajTDlywXdUB6x7X0iqjPrz3+4pYrjQdRKFAexfLxRrh9S2
 hA7Tg1imm0lWoa/pZKwMrTLHV5HMClogao06fWS2X06D3B1RkkMMCPIvOSnkJpYCtEZf39DRUdO
 MuwetAvwmnTOsG0eDIosbFjU3jr0QiC0lGrNNIE1lipsvYaMo4RViDrG8OqboCA4c51fJ3nmZTS
 73NFyj7ZdYnjehiiElAdi80TfmBBWutTgvg3aaSm5p8tse20A6GLe1B4ppsBc+5Kp9Uf7OFuSgv
 Dd18FZRDi+2+oaF2/5gjztM4L49TJh/tYJMWd+MlMOGljTXjucuG3BG+UAUYBe7qtdKix/XG6/S
 RQfU8sSamv3VQtE5SzCnWyZ78vIbdKoGrEtoIqVj1W
X-Received: by 2002:a17:90b:528d:b0:3a8:13d6:f740 with SMTP id
 98e67ed59e1d1-3ae580cda50mr2900948a91.22.1793223578775; 
 Wed, 28 Oct 2026 14:39:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae57a52031sm1035592a91.4.2026.10.28.14.39.38
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:39:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91c7b175e38so29825026d6.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:39:38 -0700 (PDT)
X-Received: by 2002:ad4:5f0f:0:b0:91b:895f:1a70 with SMTP id
 6a1803df08f44-91c7cf4c8f6mr57688586d6.13.1793223577637; 
 Wed, 28 Oct 2026 14:39:37 -0700 (PDT)
X-Received: by 2002:ad4:5f0f:0:b0:91b:895f:1a70 with SMTP id
 6a1803df08f44-91c7cf4c8f6mr57687946d6.13.1793223576898; 
 Wed, 28 Oct 2026 14:39:36 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c6ed36451sm62806156d6.34.2026.10.28.14.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:39:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:35 -0700
Message-Id: <20261028213744.511429-15-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 14/23] package/libtool: use post-patch hooks
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
