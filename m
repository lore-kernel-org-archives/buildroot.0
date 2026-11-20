Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F1606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i7UHQ2lD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60D2B81659;
	Fri, 20 Nov 2026 10:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3YkfXVj25dh; Fri, 20 Nov 2026 10:01:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8B9DA813AE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168881;
	b=XGhzNznwjZ+TPoEV3IoTsR3lrgY6BuN+KTQ+8V8tZcgxl5J7gx7c8PXCPrbe1kVJBzWE
	 PEDEJULb4+Iirb9q5EV3KT46jTTl8eYPEh4UAX74WOleRE0+N0Ya0D9aSHZExImbCVpFN
	 B4Lhy8yNOSjNvHzOHl5Zptd7olp+Fp//38X0dpw2xIlzpqiPKLVB4NWyfSNEF2tZ540iI
	 g2CFoxRGz1lcHqn4VTqVbwaoAUmfOjJjoJoJ0UR7y5XouUPNiJ2FNGxlVgQzIHwcPBAUT
	 Yh+ZtrWr1KQ41DIQdHGOx6KEWXnFZEXW5akkujLSX3rNfjHacTgcBBsHYm37c0d8BfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZauTv/pwWUXiI+J6kkgGE1OoaVTIxUFKMhqATd+DNfE=;
	b=WvhZD4OWeMNZAb3A1toZSsAHdHmZ0naCzjWothu7DCrqrZsqaLj9c1OH16BhdLpG552U
	 Mf8i3hJ2GNsxQPhr5b0lAznX2vud3hK01Cr0+OHy1SpqIiccBxEay64ePXpZNtfJ3l69A
	 6aAJNY109bYDwo+qFfevGhUv5aafNpglq/c3fGyb7kNy08n57YgNO58E+yx09udbzn8w6
	 yd6NAuMSS+M2F7wg192XOE54jzQy2hkRHYtf6n8a8DSjBVlp2UA5Jr60v1v1wbEyGSiDp
	 XWxjqu0G4lsVvD9FOkVLjoZ9uaX/ZliEZkuo283m4I/Ki8Lorp36U61A5xK2bgkLjJw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168881;
	bh=ZauTv/pwWUXiI+J6kkgGE1OoaVTIxUFKMhqATd+DNfE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i7UHQ2lD0ugpLj9vlMGEJlZL9T16ppVJgE1gXhB7PAscRNkfrwvrRfrK4b/C0KWnU
	 BLGnjkEu4VETvfvJAx4Iz8nPFHX9eaX5w5i2r6qJij2iSrtaK0bu1pk3UUqz6RjE5j
	 LdSrW7MRB+gxEB0RjS9S8Cqscvs1wXaI+mNEdD1AQtKv539xxpo9oK0G7C1jclvTZr
	 Pqsv2J4Kq5LhiaAhEBeXLvWJAU1T1Ha6rLXAJepjRGJWnWM80OJPL5tyZhuphochow
	 F2IVbf92ZGNOXVygXRLwIUzvl939O10k30w9nl0lq/29n5wv0ei5SP/BDOjOcJ4OOS
	 LR5FiHWCGxLYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B9DA813AE;
	Fri, 20 Nov 2026 10:01:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D218DE22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5A7E606A8
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ll2FtW8OK-2g for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:01:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2276E60D8E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2276E60D8E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:18 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso3744945e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168877; x=1795773677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=saMxueOWvNd0COpL1hy6Ul9AzSWeHYae6TdJRA2svao=;
 b=0+CA1fbXxf3R5ChLamg0eVS8d+IaRRoSUgquWjEJ923h/Dqsup8Zj/Jduhl1XIgi/R
 NszjZfGNoHwFqlnoLNya27rAJCppAeVIfqgyULU3kJT8sDVpN6qVggo/IjVNOiJd3jaK
 qH7a1broCGsYnT3oYV17t/FLzXNEc7Lor6z44xH1Te1rnnNFvlkQ+1j1NiPvmTMT2T9o
 5i7Ozqlex6zfgdZlyWD0JAdLTS1WEyGkmRKyP0wiplyOmyL1hepFL4mPyzhWPErUbiTG
 xNgckUVNk/jBXLy2YLhH1mqpTvH9jH7wadEfDPubRBJasyT7SjiajtFtobDhKuwgnIWk
 6QvA==
X-Gm-Message-State: APuU4Z/diUQ5tAdmvpmNjx3LegsVTR+/NHAaub5jwwtJxohvZSM9VGTm
 f95AwD6Pxf+6dbjh7P3eLxYSYuhzWjXWt52pnQioE6mnhiAmZuf7TpibkQYT7nro4dRHEfRNZ2x
 aol6J66PEOw==
X-Gm-Gg: AYBFou0m1/NSs1aDNXx0bmd5IqGaXqqff6KuCcsnJX1wsnAYLmuD6J6cN8CaqNNjuIY
 rJCQjn8dXZ+WD+LJBi7X3D/LkBGlj4wgn0OjHUlhkbcqPbFqBztDd+ExCgn+0WYuUAr0rRZuMDP
 42f3TCRNdmjggRxcETvit/2scxIK5nRjbwLEaSp73bOwpWRjr5HKugRAkwhGAr3f+fwhpf5aAcB
 SU9CC0Yhv8RCSt6t8NVhPBQ1KA32KR/zyvsIEOj1JpP5hJR17RT3Eje8fYjSxt2TNHwSNSOZIeE
 hDlKFnHphIiOww7Wpv+v/8tgK+/Ux1j02sw9kMAJpU5Kf4DZwrZIATX5Xi6fytG/wpu31B/fXBA
 gPT9WWkOWz1GWMEuJEAik1CTU1nS9uNzp7EvXDwdduCv/ZeVlg098jIEOj1WcL2EAlmvavwmDnm
 HtdoqttOl0/wIw8/nlLphKdBAlfgx6cMguaBwphWGjRMktFo8mlbsOa9sf/E0eeko0g4KzTb7Kj
 6PEyWpZb/NT9LeiOA/F7/m2SXTOZkmY3MHcbyUbtRF+2ybZMSeVdYaC4kjdXR0e+KZosqFBVZxl
 DrwA+11lgg40jh80hD7pj9gUN+r4LnH2q3JdwaVGtlrf
X-Received: by 2002:a05:600c:674f:b0:4bb:56bb:1196 with SMTP id
 5b1f17b1804b1-4bb8880fb9bmr58202455e9.23.1795168876520; 
 Fri, 20 Nov 2026 02:01:16 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88f13895sm38375355e9.2.2026.11.20.02.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:01:16 -0800 (PST)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:01:13 +0100
Message-ID: <20261120100115.542842-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116094641.306120-1-titouan.christophe@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump
 to v7.2.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> From the release notes:
>     Update urgency: `SECURITY`: There are security fixes in the release.
>     - Heap buffer overflow when propagating a `PUBLISH`/`SPUBLISH` message
>       larger than 4GB over the cluster bus in cluster mode
> 
> See https://github.com/redis/redis/blob/7.2.17/00-RELEASENOTES
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index 1d58f98462..6f75fa86e9 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  960a8ec15e34ff40e57ff16837b26b33bd81f2da6d24497bb63de532a323a18e  redis-7.2.16.tar.gz
> +sha256  07c679c013fd82513299733bddf91999bbbc830351ec9ea985a533b09a595d76  redis-7.2.17.tar.gz
>  
>  # Locally calculated
>  sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 31b4aad2b2..99a2d88322 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -REDIS_VERSION = 7.2.16
> +REDIS_VERSION = 7.2.17
>  REDIS_SITE = https://download.redis.io/releases
>  REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
>  REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
