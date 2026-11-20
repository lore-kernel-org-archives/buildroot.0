Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B0606A696
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 22:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r/SwYfQR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eGvUpVwR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B9AB81882;
	Fri, 20 Nov 2026 22:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJWT3ZWxuP43; Fri, 20 Nov 2026 22:06:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 60AFE818AC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795212413;
	b=fwA2Caf9fWNZpueSmBL7qZPDWtWvKm+ndXECEGsCsqQdiMdqm71kfjEhn9XiX5ZLW5qy
	 sMNU2j+fKjt/n9bZkkcvk+xdLInzf/PDZU2ur7qLCp5NB7fyrGJZNh16E0dsDvA6ds3rK
	 yB2QDaB16WGRnKqeyS6Z/lhmvIXeRfgeoauNRxX+O37WTMWw7FdQqOt89A7uPJ5EkPCDw
	 20cxUZ+S7jvTt4QqS2p7ABzGdGSleWgzA6rdBDeGT4XBU1sKlazKtbG+qJNfu6Jl/TM5E
	 wBNZZO8pLbTWlwI9I7oQOXuVBloCZNwl9UyrIufQtwNNPvKgA271NUuVX0xuZ3vkJNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795212413;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=GTdWy71uwIeCpVKzPTl4HAkmwjo7u7Pu1FW/YGJs6TQ=;
	b=gUTf4HkI4JXKQ1/OoYwr83o64GxfacQH6uAMEAmxyLTVSYg/qq6RjSVcwYAjp2IrMUQw
	 1F8VcStQL0yKkcKJhrxf5wr3cylBwAPBkQzi5cJS9yvo3Inhp4LtqPil94ZVTRce0+6QB
	 eENHCZq52XkDlAVFiPIEyICdDglRIEkOJ+Yzgmu3InuD8peKcoXdA5xgmLLPPdd2pzaZY
	 RCSmx6lRGTIBdByDAU//iy6MFTjDPuoiiukTPlCm/29SGFRh4CsxmA9iD9Mzwlsl74okH
	 NRyAkjrTG+8kmVSSCiwdAH8n7wDY4O8eNe61hGNHQ3t3VFhs1q+TmB/YMKzg99MNJzg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795212413;
	bh=GTdWy71uwIeCpVKzPTl4HAkmwjo7u7Pu1FW/YGJs6TQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r/SwYfQR97qA2N4UPY3l8sgG64SQ8irGt5HM8fCkq5kLWc4IwiQjwvgUsGv7u8x0c
	 Wmh3bV74aSkiMhwAHKJslS6mtI2pj4HSY4nbkRNCWQ6NpxIkxFWwz5ahuxZCjWiq+N
	 gFygcHtwgbh5yAYhW/xFA7SqeFpagaM3KHh/Uli066p94GoBcLm00soiKDcUFmZvUY
	 NdRUUrcXIGb5Q/l4q9tOnbVAmGRN18xgWvYUUxbaScyuAUi7+6CkZWllYHjk9a/sbb
	 Q51fgT/yjpGYNbsXkyRPCZ+SPGk6psHdsk1jX7gvcjuEi+b2h7J4aSqKOSF5yeYSjt
	 oKkxdx4d7OT7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60AFE818AC;
	Fri, 20 Nov 2026 22:06:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24B179C1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 168966069C
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9A9JF1m09G0 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 22:06:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 455C660698
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=eGvUpVwR
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 455C660698
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:06:49 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4aa5833c263so1279340f8f.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 14:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795212407; x=1795817207; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CNWwprNYNeL7cADtWBFhP5xen2fGPyPpbMkfRPm66es=;
 b=eGvUpVwRA4W2Bv0k8YACvXD6x7vxfMZ3cQzNc7S3wE+VJXVIr/N4Y3LMzOGYML6mNZ
 R28ZNvJAJaOc6A7sBEL53RmDIGX7eZxqc1wUVUVFB2DKvaTirFzIxA9gI8wfyFJI8bLo
 Am0wOL809lZZVYpQmGzm0SUSngZusspaVvBEX3HE1CWymJ6pHuLGhGbI+59uoYapmlgF
 9gl/JaACad1J7dwXmRZiUdZzLwFiq4/v8LtdAD1aIY8D4cn4E6V8fqAax3hwuU0cuK+a
 4loscwu5NNKJWY7qqE1tp+0RJ4Dz+np54g0/PZtcjWsjplEjUHJZF5ViVHUMzRmaMVm8
 eABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795212407; x=1795817207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CNWwprNYNeL7cADtWBFhP5xen2fGPyPpbMkfRPm66es=;
 b=hIB40Q+Nbkcpv65nTFBFBht3or3NZggUp8bkDN8PmpgxTn6/kpty5421ayaBa9Vn3Y
 XYHehQu6Bz4gonV61GYb5fHUCLedVd8bahMmh61F1ad8eSOf3I2JdPrOXqjRIiFqTC0x
 KqEDrW9mrC1EV99jRxRnbP25k1ViFjhB2BtiehFgmwlo+IjAqDmEgd/tjee+yIeY2Ijm
 4qvnemed3rQ5Dl2XXCkxtm6AH+r8sHTby11BbYENRYpFMIY74sS6Ughc1ifHuNr0mqte
 UgeGK3Xg3N1CW1IjxfxAlQXr1PCFuUGPWOwuc6vbrz/qfjtyWjxMQ035BOQa3Bt0ISPw
 pplg==
X-Gm-Message-State: APuU4Z//YVCgpn2F6ymxmNyZ/ubkbS5NJD+Hxx9FvIHch+gUkcDsPgpU
 mCQnoh5PYJ3tTRMx1mAnmLIezi/hASljji9sHTrufug6/c51YqfMZBM2hc5PrQ==
X-Gm-Gg: AYBFou3AD5xxQ3cQrQDpcKaQbkDCenKTdlq2PCbbbwMCzelK0XCAy/WDG0emuAcDWdp
 Fnmnoorv2CGcvs3i81zm1qoRxS6g2m+DqkPM+OOO7Hxr+WrP6oeCLSChhWG1pP32deuRgoo0pFA
 sH8Nz7tPqAs37ERPNHyPlRWOmM/izhYt4Mw1mlFX6ewWBsWAGEie+460SlM3DIpM3SoG3pdAvxp
 eWeWogV62Y2bondl0F81QuTXL+yKIp200oxrNV03d4fCxZ0rQYcPvQnIjkOZUpGvA09Se0aLSVE
 QWLgs1apXPTyGhymPvV8ZhyXrpR50eVYdUbNE3EU7XsX4EldnfdjcjWi5jSFQ2eebl65XZKodOe
 m8nOR7ErynFsflPPSGVu2CMa7nFK4LlpNs5MdddpXj4hLhKPMF2OHW3UCx+1dvamc9Z4RxT6nL3
 XwjfBIoruXx1+suNp6IIsg05SOmS7Zzz4idNvcCxFTRX8bJrtyznDrZf5meRMmWQ58fqd0gJPlw
 rwczWdNDdsl9fiNZ4dQgNo9GD5TZQ8b/j17BRAYKFuy/N9XUkk07LQ6H/6aL2xtcGcpTLKOA+C3
 lgvc0V4OXGoi4j3pNEZNIl4kY7a+8Ois6JDzNi/I2OaF9Bx99F8=
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id
 5b1f17b1804b1-4bb8880ca3cmr118722445e9.15.1795212407006; 
 Fri, 20 Nov 2026 14:06:47 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8526cbd0sm186040605e9.0.2026.11.20.14.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 14:06:45 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 20 Nov 2026 23:06:44 +0100
Message-ID: <20261120220644.627533-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20230614152634.23608-1-romain.naour@smile.fr>
References: <20230614152634.23608-1-romain.naour@smile.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC] package/qemu: fix build on mips* and powerpc*
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

Hi Romain,

On 14/06/23 17:26, Romain Naour wrote:
> I believe it may be a musl toolchain issue when MAP_SYNC is undef from musl's
> bits/mman.h header. I'm not sure that qemu (upstream) should handle this issue
> from util/mmap-alloc.c.

This patch is not needed on master anymore. Since commit 9a5369effd22
("package/qemu: bump to version 11.0.0"), qemu can only be built for
64-bit targets, and the MAP_SYNC error only happens on 32-bit mips and
powerpc with musl. The recent powerpc64le musl failures are a different
problem (a static link error).

The error still happens on 2025.02.x, which has qemu 9.2.0, for example:
https://autobuild.buildroot.net/results/7ed/7edf8bddb24574d6d6c6ca303f7ded03657f1470/

So this patch could still be useful for 2025.02.x only.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
