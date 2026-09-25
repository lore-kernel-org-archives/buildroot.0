Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C55C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C66EB81371;
	Fri, 25 Sep 2026 14:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qml8kjMEVrKg; Fri, 25 Sep 2026 14:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DE264813EA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347624;
	b=LLpSMW7eqnJi2dN6kSs9Ue6H0BT/Ve26H09mVPIDe+vLMcPEBvDda/LY38C/R0GvjaSQ
	 sqPrLjznGmA36LtAMpPP9LN8dc/EXc1fJsRL5NPcLQ6ihsc7hOZXSdFrwNebTOSR8TvRA
	 mC6rtBx0sKlilorRDCVditcz8AL+vkCXuK1C4QeMsDNdd0VllcxwyhdTt9KsJCUhVmQGg
	 mlHupxZZ1S7VxS4GfA43Qshma+w4YD5D3vMWwMlZx1E9tU7plhuBKVnFpyzdt5wyG66lG
	 UCRcdr2t4lSs1U85CUWnh5RgUGqaMaQEalMP0leR4RZPDpCvcqGQWm8XaP+p4kF6gPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347624;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=m162N/emr/J7HCkM1oiVDVFzjzORT1TMOkLdhHb5FAA=;
	b=n669O6uBkf2TDYRMoKNnAN71l5oLDjnAGWuFfYcq/jhmc14Y5ffLENg0B1zujFsnPyJo
	 BEAHGXapT76M1RS7RE5GMN7MGMbfFzGHKiLHbDxgn6URvpj/DH70lCBIvUMdTLVWaRzO5
	 RIM0cyKn9fPo+mlZPdiA8tb8i8D0X8QewBhyUxYEUli6Gc97ItQUpMmoTXNaXQrgzPwJS
	 ZHffw8iiAV9AXUtUV2RhRJKWnb6Bg4CCMQKUz0SCJ8urTEzIv0wUSJeks+j9/krR03bpr
	 DihkM8QofA/Ud6M2sajuylKhZpRbz2dqdyXU1AiBvEZiSeeaw/nZYkN+JLFNkvhhOvQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347624;
	bh=m162N/emr/J7HCkM1oiVDVFzjzORT1TMOkLdhHb5FAA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MGNX6GKm8KcfFvSrMPMak3FZYIx2w01cL6gu5c2VgjGIBQe0lESyEyygOJuji3l21
	 2q7ZMYF3cLvKmlZkhi3RosOA92T62O173H/N0U/sXyORrkl2yKDsK3xuklRyHLKw+R
	 9Vpnheo19AP/43TXDfbCb6Lx3MpRiRHOMOBxVDQW7tIpoY8MV3PLVTlWvqwX9YT1JO
	 f7ndD/NbGkXqIxku2yklE6A58LeOxjZOBHl6I5Dhy9XCLI2IBwGt1nw8THnyNwqbb3
	 tKdfj9gxPTROKV1vrMI0ooNK1Sg6F7Sd2TiWDtbtQNGVTGH22stIAbiJbe5rrjyQhl
	 jbbpqdi3XOktQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE264813EA;
	Fri, 25 Sep 2026 14:47:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0682D334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0D9D40181
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPZYTeN5dyWN for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CD1064016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347621;
 b=KhbEg8Ts3WymSQyAtBp7jOdKiP/lcLxp391Y9t3DQIufQYAa3/Pt3zkvZ/hsbyWUhqBG
 Vnxk4e2yhYFeHaGXxfUji9Za6VfQ7owNolPeUK8mToLvGuVgbaPcPzB3ot8Wj1Cl1ZLVK
 QXueifXVBehl4b91tb/dq7B2pG5S3SeIvHjEnK8x1aaegQCW5qiYRZeUs9lR1P6Q1G8Se
 6ro0dXDhRyBAS1SypOL3HHhVBN+I6gL861I0RaN7OpnsXMgyMzTCLY1R/no4hno6BnfMQ
 HWJwEIZMd3errGdiFypMP3NzDH06iaM5DTIPVk75Rona6xi2pGg8mPp66Gl9KWlFEUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347621;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=4pIguPKtDGyjwMA1J+ymMjvWiQ2MDhG/Ocg/aIWL7as=;
 b=rGNuMZZ7zZu/1LIRrPs2fxd9nzZVAlhpMuVJj55ZQJJpVmfxdycdaL3Ti0yMCiN7wybV
 jhgvIymT/6ijR139q1EAg+PZr8p8pVZhwJd43r8WxUuOrqAaUg2nQQCS+wdG29O7bT+rd
 YsLZ5AJfPQOYwvWv34bnIxoat2SdLSjimo0KnU9AibsHFfC5OHjlXkCYGmbTqsuOhfMNh
 awpBHBfLjajTQouBPjprOgW0InHUo1AcH30CcXboVVNDvzx01AKcsD59cVf0n/DON1yJ2
 YmnLRvtrjfzF3a15RuO7Xcx/HBzNQ4NarP10e1KDeinaAwsygiRd8dqYFjTI53c+HLw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=P31+BRnB; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD1064016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:00 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d391aso7236455e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347618; x=1790952418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4pIguPKtDGyjwMA1J+ymMjvWiQ2MDhG/Ocg/aIWL7as=;
 b=P5qIh6dL+WwSNPs4w1lIEWi9q5oIZrNsP5hh4WQ1+aUaTG7DiUMRFVNFqYLVMbI1zb
 9PMeZRRwvIO4dZLwE1Oqby7ewtmsC1MxmytwV63KexaH8WWjkRosJhmPA4D2pc2RJ7Dj
 +7ILoxIOLURLJ5As8SLMktEOCpJmvA9Cj/nFghaGT2AAmxOPCGYXLd2YvHhymvkYi0Mp
 4exLC88QD0tfk9ojYUFY9RB5vI7zvEXsyUwqifVaVBtQPdo3P6fr8yStuetHPL8RqFlw
 ex74/jHXPH64jAo2JblA+a6RBZPffihuGvajWSe1TG5OmZqf/LNODhwGB+rv1pajR1EO
 MZFw==
X-Gm-Message-State: AFuF++lfbOO9lIH4r3KQO+Uy3ipIuzDJZIypuF+RO2bteeOzPJTco/7s
 gPFgT9lajWDZsb3Exmz9oUQl8EJ5BKI1neRgwnJalKDIzWHtxzO/iXm2G9sX/d1dy67XNPDDLwV
 080853ls1fw==
X-Gm-Gg: AYBFou2qo4dlhEUjR1dZhaG2hVa58bgW+OOJ/Z+ZIqqDrgdT0SaGazOQC+AOvwFk5CT
 savjEkO7gfLkGTQt65Qf3stn3srYvcCGAA5cDodPPPIcAj//J5+uE7pakZo4sKQpvGlfSatu6Oy
 MUjMHziPf9Z7838ECkCz746H3MyYQS7fBhoIQC+HU134VoBZHtzwSX4HaI7Wpsq/yhoRNDPqxbF
 r5mbPdvmY7m+OBwTpJYqSjiSu4Do5YGi33sBP1VIL1HpgycUmpd2RHgWKVmLMsmRFbbBNPDrTLJ
 /0q1nimJnrlZnlJ5S5E/RPxmTFUOiuGJ8svQAyQSKBMEaY0Xdxissq2gJBMhUJI+QBmGVp3uXmG
 Gn2K1kj4P12/CJw+jOvQKSMAzpasfJkigoigmvb5nqVMwYIltz+IVs3jwSKcZfdsTDEL5dHu2zO
 4fHGO1oW+n4AujIsQMe1YULaBi/sjhKCvhcyos4ykF5rCiFEbrpZ3JMwjRZBTbuPeGYE9BxSV9N
 4oaF59MYznTBvTVjgD+PPvfxDtQreI87OrslY8S+A==
X-Received: by 2002:a05:600c:3511:b0:49d:17d4:d6ad with SMTP id
 5b1f17b1804b1-49fe66fca74mr99243095e9.23.1790347618434; 
 Fri, 25 Sep 2026 07:46:58 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5de4de4sm162309885e9.8.2026.09.25.07.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:57 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:54 +0200
Message-ID: <20260925144656.4100387-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917125242.1307618-1-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/stunnel: fix build on ARM Thumb-1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> stunnel's configure unconditionally probes -fstack-clash-protection
> using AX_APPEND_COMPILE_FLAGS. The probe compiles a trivial conftest.c,
> which succeeds, so the flag ends up in CFLAGS. However, on ARM Thumb-1
> gcc implements stack clash protection through -fstack-check=specific,
> which it refuses for any real function body, so every source file fails
> to build:
> 
>   stunnel.c:1003:1: sorry, unimplemented: '-fstack-check=specific' for Thumb-1
> 
> Force the corresponding autoconf cache variable to "no" on Thumb-1, in
> the same way cmocka already works around this gcc limitation, and
> consistently with the existing -fstack-protector-strong override.
> 
> Fixes:
> https://autobuild.buildroot.org/results/3d691184ba83ba4d881632f2b2bb4da5aa50f491/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
>   - add fixes tag
> 
>  package/stunnel/stunnel.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
> index a8eb652bff..473fc81900 100644
> --- a/package/stunnel/stunnel.mk
> +++ b/package/stunnel/stunnel.mk
> @@ -17,6 +17,11 @@ STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
>  STUNNEL_CPE_ID_VENDOR = stunnel
>  STUNNEL_SELINUX_MODULES = stunnel
>  
> +# gcc for ARM Thumb1 doesn't implement -fstack-clash-protection
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +STUNNEL_CONF_ENV += ax_cv_check_cflags___fstack_clash_protection=no
> +endif
> +
>  ifeq ($(BR2_INIT_SYSTEMD),y)
>  STUNNEL_DEPENDENCIES += systemd
>  else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
