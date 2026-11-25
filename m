Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C9F606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Yzm7wGPy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=FDIzyF9N
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3C5280E5E;
	Wed, 25 Nov 2026 09:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWevlvSRRNh2; Wed, 25 Nov 2026 09:43:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F272280E36
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795599782;
	b=hfDuC+OLEUTvcdxxoan1JTpYaVzlpYS00c/W8xRbZpvIWSItVs36DwZWMJrL6VttMT5f
	 f/ftEaeKPh7KSypkQVKwZok3eWN/CtQdbql7AyDeoZfyiFZLPjjrDMI0qumDwXOshB+wg
	 6JN0VGvLmvDkFtyfl4yvdHuX37lOSWXUFw+tDuZaX8P53Q2Yz9A3fSMz9VwD1wR7h58vS
	 Uftw56inrZAa8QR07IrSVRokW6yRMQbpgo5HpomXlMxrOjFMbdPxRb7bzl3P66w94xitn
	 eOIsGltQw36DoTVcCqMYh7jBhDTVskJFYb+Z8sSzVn7O3CbdRzjkpcka7Cj+aoF683g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795599782;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5n8xpFpK20KIbGjrPwcNg2TYDCedDt3Cm/cLk2cMmno=;
	b=R4c7ZjtvPe4gs7dJvLYQ6DWIOP33pn3JCHdA3lcYFyvfwq1s0CV3OYxJhGnLEoe5Zg8G
	 cBfWuUUx5CLCU7TndayFr+rK223QG5PluXNc0ZI5JboRHpcrnU1Zbf9BEB4XuNIU7Qea2
	 UhbkQ5gvVRCmc5g9QIMr2egcY4e6rA6H+AYw8syouXmVburexvsuH9QdiOCcaKJXII3U9
	 fMmMPbRgN4nWGaSWxo242fpFIs6jAn5vq+1P+vTJQBDs4mqToOjNBR7y0i0t56EtjnQm+
	 vPz/RegxQaZy5PMvj3Rn9pE7NGm8zsAE4gp+U8tNQHCaes3IudnGlwDAwhYRaBajSbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=FDIzyF9N;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795599782;
	bh=5n8xpFpK20KIbGjrPwcNg2TYDCedDt3Cm/cLk2cMmno=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yzm7wGPy+JliS+Ieg7HUdsoJuy67ydLu237WaFkjNL8G7oSJzGpvmW84vvlGRmmPd
	 OK38arO/q7f2HC/J5c0edImrt3WnksTqRAVrBlnJYYSE3MU7bTcTDmLEYynR48E1kh
	 l80fbD8w5hHTM4eTs4xL7evFvZLD6CEiDUm3RZO0g9gUB3j2Efih4LkWwGg8Y5+SeP
	 a6dANhvPbxcDwtkR8To8e9+d08cX9B4FSJAvYhr6rZYQjkewE3/QFRHG84S0JEcorl
	 cWlQAjw1iMfTHqLhbupmKy4Q+3Tv8FoUdbSwOpO2HBLI6g7TjZCqaSBgyupDHu1Jz7
	 19vz20Zm1nH+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F272280E36;
	Wed, 25 Nov 2026 09:43:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD1F1311
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 09:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2E8680E36
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 09:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLgIKGZ0P6WG for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 09:43:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 96F3580DC8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=FDIzyF9N
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96F3580DC8
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 09:42:58 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6b894a5ce3dso7572117a12.2
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1795599776; x=1796204576; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I5oxCCLTBzmrpB7g/DNwl5fl3zzPMs01wSYGM7QAHFY=;
 b=FDIzyF9N+LSufFJa/+0gP4ig74ZzIRsgJMcUPdIPkwCD7AAD/E0mdKKQoJPxkY+p5U
 y/kyvJUEBkFZbLxXMhngHphpFCpDpIwwm3u5e4BBFugHqOaHo/X9NoqlMiU1docWRvCK
 rZqm5SyNq+m6fqgYNmJi+FawU5zcDr+ktW2QHeVWUVOOTRw2PrNAXfZRgaGZPpJ4vL/X
 l+8qJOhRTSCrAGw92s4cBdJJZzI0iufmOOOtWQMLR+tg3qCLhJOus0/BvnU/JB83Uz4S
 a3NppWMILQNFOTU7sDEyYkFbxbUMhVPvTTjGiAcufi2iPyW6V1Y7+Hv88VME890m9H1k
 BY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795599776; x=1796204576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=I5oxCCLTBzmrpB7g/DNwl5fl3zzPMs01wSYGM7QAHFY=;
 b=hGKHPJeYwdEgyn/Gpvx/nrgUArtYAeyOs8V3IzTvAWKgtmYARlxgbqnKlYtDxqC3d3
 HwHjebaG5rjT3NB4TZx9fTy13AL4DnMht0zYJLl0U4Jk+RCGX3YpsbT7XwblcoeUevIr
 Grenb1DFSf/mV062ZnqCCZPZJ3D+XiyPzkJrNK8zWJz6x294ebLht1Z3BU0p9qF1eCOo
 hqn83cpkUJUTP2rmOPepti1MxypuUUPIGL9Wid9Qp6jCWnyr17F2v1ZHY4oEGtvO4QbW
 CQD5U5fvH68N4lEahP24/O0fd0fxuGyfuioclZqgxj1UY1OEn0KuE3qZ0RnFuPNeVk64
 ib6w==
X-Gm-Message-State: APuU4Z/UHB7I4zOIMBDuDxaZcnXZ8fK8C4lVFwjf3zWgu5470zZ4kbvp
 I9spNAkRFMs30JjCTaMKyMVz4b7Shc+g0Q8OqEwlbJkBvHC9EkXAcF4sK0kv5Q==
X-Gm-Gg: AZFdTZc2/oTs8a7BRHXSlGQiEg8XK0KT9ztSrZxIx4qxo3czn9WZGkuDIBcU/isvjv+
 GRMzcknL/+bFA8XSflR3mjLiv1SIhn0FDfd4oP3tm6PYMX6S1IObvPD2VUzQFpsaCYUdL6A7Ta2
 WYssAs6Nd7GTWGOmtc/SuEApWU4gi0HMSObvUrDS4h6/todvpI2mV4RIejEGunysQP7gsg9fC75
 056APf8CIEoOplnkaNFd4+OBuyFaGXfWT6cAoZtutyd42/fOvRFKJ3t3onx7oOdKULCgAtIYpur
 fdXZKX5+1fUH1IMzDnkWJKznPABw+x1NxvotTFsukxhoygbeS30RdBfuF+xkg4WlizTff7a/5AY
 h4IXCkck0uNPrPr9t5GSrnFO2x4QDS4VJlW9KRD/czXe3nep5x9H03VXN5EMk+qQIXcvULDaUNZ
 QGOfd8rZ7x5FC4RhTZEsJArzviNyfUAFyw6q7LlvKXpt0nA6f3ybFpX1Pxm4vo7XUy9vdNqdh8Y
 ANMCfIsCe2Km49NwxxTc6kv+0fy561boZVVo2hBVBvo/4C+ib7Ao3uth7ixBP6PbgRfC8jWsQg8
 YgQVSUqy8JrdnnnS6b1LwwhiHl+G9J3ceWIIFyfshdWK1u04Pf9wkkVX1eMRJj8m6BS/voCMQw1
 G+EnqqKzU
X-Received: by 2002:a05:6402:2709:b0:6ba:1de2:7d0 with SMTP id
 4fb4d7f45d1cf-6ba37d63cc4mr11199009a12.11.1795599776202; 
 Wed, 25 Nov 2026 01:42:56 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6ba370e8adbsm7965840a12.17.2026.11.25.01.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 01:42:55 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>
Date: Wed, 25 Nov 2026 10:42:55 +0100
Message-Id: <20261125094255.199095-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124172411.1613844-1-giulio.benetti@benettiengineering.com>
References: <20261124172411.1613844-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libfutils: fix build with gcc >= 16
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Giulio,

On Tue, Nov 24, 2026 at 6:24 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> ATOMIC_VAR_INIT() has been removed in C23, so with gcc >= 16 the build
> fails with:
>
> src/random.c:338:31: error: implicit declaration of function 'ATOMIC_VAR_INIT'; did you mean 'ATOMIC_FLAG_INIT'? [-Wimplicit-function-declaration]
>
> So let's add a local patch that initializes the atomic variable
> directly.

Built libfutils and libshdata on x86_64 with the Bootlin glibc
bleeding-edge toolchain (gcc 16.2). Without the patch, libfutils fails
with the error above; with it, both build fine.

Note that with BR2_ROOTFS_MERGED_USR=y, this also needs "package/alchemy:
don't copy the C library into the Alchemy staging" [1], otherwise ulog
fails to link first.

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

[1] https://lore.kernel.org/buildroot/20261125093330.194145-1-yegorslists@googlemail.com/

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
