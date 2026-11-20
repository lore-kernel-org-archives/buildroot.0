Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99542606A685
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 21:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A91GUvDm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXX8XUS4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C0208144E;
	Fri, 20 Nov 2026 21:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InUIQhq22WxH; Fri, 20 Nov 2026 21:47:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 87E23814BF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795211268;
	b=hPjE0TJVIkMAxd6glBjSeNUad/8m120GzoZaMynpjsxXo//P7f0hK7p84EYYawGG4BED
	 lyPTND0bHMmuYBdbTJ1ErvJlyeKJ6ihkdTqsZwKpC/h4weVfBWeals1FLfXFQIGk6tmmH
	 8kBdsPY6RQDUSA1jq2ykQYoWparC4iZwIGrnWXnuJLK0ZKWGq9ghuxqsAyHi+K872PmVZ
	 zB+tUO4X2R9ly/Tz2KKU6rgfhLayVx9pCkO4h9mfIEtr8D0UC9ShulGZZYknT2tB3lGtB
	 3yhCLqUVKdbzlPCxM0OMWhrDQozP/sPGSEzm55YFCiAiaVbfUAKJPPZzTGIVTYT+S0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795211268;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=nEc+Up2dzkpI8FZBaenE1w+ObRUUmPjA1QLx8KYQarA=;
	b=eScAW2BaEEVUV1Z+d6sj7x7o8g8F+dBKMSsDXsOzeMl7oA9FBEL4uNRByPcWolxVOX1G
	 x+6s7+pxNn9n0Y4Jp3TgdseRg9HvXu2UtLO9KlAg8j9gvidNCPXQAtIfey895FLyJpZnX
	 x/hOfPdiNeUSaUAm2voEemH5IXpDqn/z2c089Bt6kHdVfRdLfObfzXG7hKbSqvSZVsKar
	 J7WUN7fO5DWK8+QDuVfdrGnwbGev8ixsQdG/6bpzPTUVxloi7LvrWFFSb1G8Tx8oG72Fs
	 wMQLADHSTxMpsjY3vBY4t9KCsBMrOhlT4D4XB6P/zDXpRjZdKP2rCUl2w+B8EFvxm+Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXX8XUS4;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795211268;
	bh=nEc+Up2dzkpI8FZBaenE1w+ObRUUmPjA1QLx8KYQarA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A91GUvDm75I1cnfd0346udWimMaQ9Nto7D6aTSNp4DP7i3YKJnnKibeI20UqUX3dA
	 ORO93EjUIPVRKmln/YA+kqbGrFU5/fAvd6sPlSOVZLsKfqciR8ar9WiJOZ+lhOMWaE
	 tckQDOs6+W68NfD5Lk+vPE3LOyx1zeGkkbcer2qz8aYvVjE1vp342VuSEBaiWpp/TE
	 k3OgIqW6neK+rWYG8vQfNSXCAfW681mwXuXT1je4Awodtkt2e+5idtL5HTy36+sDxB
	 ZGdCsU8RepausUsu7EzJwVDtAuurxZzF9Df+P1rm0T64HNtQFAvNXBWx+KPwjXGZJl
	 eLir2vHrTll9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E23814BF;
	Fri, 20 Nov 2026 21:47:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B738A465
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 21:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8BBF814BF
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 21:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sD7t64XOGDJi for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 21:47:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BFF3B8144E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=JXX8XUS4
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFF3B8144E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 21:47:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so12614815e9.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795211264; x=1795816064; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8qGWG0t4OhvyA99Th9NqkED732Bu2PQNaqWx8jG875Q=;
 b=JXX8XUS4jyIivapVuyzo2QmokZ0RKZ4Q27+en8k3/CqwkGMk2fEfErvXTeacLP37PJ
 q92e8HSZnvX84H1TrtmJcTpM51nSzVVhzYe9WWUpxm29eGP7E5W2p2fMJApNDIujANC0
 lRvP+uNH4RX7FSYv1VtyYzRAqTauHRpISD1SzMZ4xDMxui6m5TZbDm0KwoexRF+EUhwf
 sXTSUgWaUSt96um48qJxGLUKSf1YpYFZkp1BjatVaGIVZQdim8ekkZq2nsWhlQV+hyEp
 sIiC/bqPIBPxg+Ubyw4chw6D/jqkYmfrXas1goQnPNdJYXG5cEQY1V08vT3ainNb2CFI
 m9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795211264; x=1795816064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8qGWG0t4OhvyA99Th9NqkED732Bu2PQNaqWx8jG875Q=;
 b=Bp+RjffzTM2v9I9mamyD2CAZCdZlYjctTqwTJs0O+mu11T+XbJAam/kTx5yvVrd9pS
 WSMqERDoFurj42oca8OS6oq70x3gJ/v2sB/+9AxQSzlNLYp48r/QbXbwcbvNLDEDhSvc
 SrVE9wrsFCOY2h2/cRMTT9eYP0BWsqpok1GYn8ibPCOQ3D423rbnKEBTdwfq7G4psOqv
 9jduxN0UAezdaDSaeY/7XVvd9QjcBrT34sDkvJRE2AwBH2yteLuVUoTZfjgPrZN6/CYn
 jP3mW2j0FDriDpGDiUAtxgmhVp7qIxU5tc2YGskiKmlpx+gS1vnrSqWLqSsLrBQIFABw
 fFNg==
X-Gm-Message-State: APuU4Z/Tvb4FSaOGHP7+0ag03UcIBRHaM0KkWA2xQgiEQGBbDXCDuxol
 ndDRtkhSKEccZcCLbg/GXyiDTah9o3ifNWkTzIIboZTDanBXoDgSm+kTFXY/rA==
X-Gm-Gg: AYBFou1QVcwVXJfl2hthRIesbiod8YaA8VTTY3NpefkxqY+3yCOz9001i8gmg09XU5R
 7zPUoiRDx8w9BKAShQmbzsMGDytCyXty+gIyuI8ligvxgtd14mbSBmXaM5UT75Ou/YN3rbyvfSW
 /bfdO4WuxIUNrj+SwzEUUqAPAfD5C9zLZ3d0P/t7oYUoeQnHWupY5od2NVeZGnwGYZFIrVTbxW7
 4VsqmQPb0F8176HEBdWzcinDypOLGTTvYzCbe+G28U28UnIG+RrkInG8EM7am9sApOc/6lNodei
 fBpnG27z80xXE1gkFFPh9Q32VpD+/As71ofjGLAy9yauoCwLR3CYZ86tZgfFAIQN2aE+1bOcRvW
 bS3uGyTA6y5b8XS3sW2xKYOI0vpmfL1m4d6TbavpsIj/H9rzEuFUVOBwOPPMf1babJ83ySX94eH
 iwPpeMYNvsLxU6oi0RQQw4ecseBQ/zKxXsakcfigvDmj4ANunNa1cIArsmqtV4HO5FVMH8xRky9
 QiQfNszxEdDgnhPYXyZUmZeFav3ONyvXZUtePXPTq3qKIh71M1vs+c1NkouHwln+oS3zwOpytyZ
 muIUn4rdbdq2T7NYb3pFgcD6gBG997KuQuXUpD9JV8HuPQgbNlw=
X-Received: by 2002:a05:600c:3b98:b0:4bb:7033:c92f with SMTP id
 5b1f17b1804b1-4bb88826810mr92963315e9.11.1795211264308; 
 Fri, 20 Nov 2026 13:47:44 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a1e8bsm123981305e9.9.2026.11.20.13.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 13:47:42 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Colin Foster <colin.foster@in-advantage.com>,
 "Yann E. MORIN" <yann.morin@orange.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Nov 2026 22:47:40 +0100
Message-ID: <20261120214740.592746-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20230526175506.1071354-1-colin.foster@in-advantage.com>
References: <20230526175506.1071354-1-colin.foster@in-advantage.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [v2 0/2] package: bootpc: add bootpc and bootp
 interface configuration
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Colin,

On 26/05/23 19:55, Colin Foster wrote:
> Believe it or not, there are use cases for running BOOTPC instead of
> DHCP or static IP addressing.

I think this series can be dropped.

bootpc is legacy software: its code has not changed since 1999, and it
no longer builds with GCC 14 (implicit declaration of strlen()). BOOTP
itself was replaced by DHCP, which uses the same packets and adds
leases and more options.

A BOOTP client is still useful when the server only speaks BOOTP, and
Buildroot can already do that with DHCP tools:

- dhcpcd is also a BOOTP client: add "bootp" to /etc/dhcpcd.conf (or
  run "dhcpcd --bootp"). It brings the interface up and configures it,
  so no wrapper script is needed.
- With CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP in busybox,
  "iface eth0 inet dhcp" in /etc/network/interfaces runs dhcpcd.
- At boot, the kernel can use BOOTP with CONFIG_IP_PNP_BOOTP and
  ip=...:bootp on its command line.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
