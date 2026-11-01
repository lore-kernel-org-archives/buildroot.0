Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50841606A329
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T/PW/D/P
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C13880D87;
	Sun,  1 Nov 2026 22:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyTm86PyqfTR; Sun,  1 Nov 2026 22:43:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CBEB480D89
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793572994;
	b=j5LUI2pG8U0hn7Nf2/ALD2FfgGBXJB+qfp1L8RUiNBydI9xRU0TLVbJOBu/jQebQJItt
	 y/EZ1GcaHuH2rBmKLoh0bAKQjnaia6vasATTcWDKAeeMZ2RJAUMLlDq1fiGAcmmUMQx8V
	 j0LUUq32+AO3h4ZYkNeyqF2Rk2wM+WVKtrCnC9ph4MjKQ4rqfKH21FSylEiq0gxHl99fv
	 f1geu9C4w9Llw2U0z1TpF1xwMZW5QVWLrkFiBe5W4plaj4OLACvwyeTPD9VZFtyuh+bK4
	 hleTspvFslxiPHrH9bv6PjtfSIGqGWMj6n1cCRckcxFEoRPRgTWcvv4yj/tjI3EFpTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793572994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ey4s/CShPcM4NRm0OskIlv6IScuJRpe+co67OTsX2n4=;
	b=DLN/JwHq1ixgpq6Bg70OdSLdUmWm53tKEYYhF0hwVTMi3F8i5ATV2LgrMtHB8SIZzbtc
	 ojWJXIwLyZ/NbKtFTlFWYrrjE6MtifS7YZYD3CF0vAXQ/907bfnfMaI80i/xkK5Ov9dRb
	 AHcCc8cE3PlWzcNYiD7ZQXuYcDrV8V1WEq+Yg2IiWg38cyfbqsw/smrDrHWCE9+7wppWl
	 bj6M/eWfOBUYEPmAgUoB893zitf/I/wVbxBWorXMSkWA13qV8mi6wXdaiEswkg/cVvVe3
	 pfF1LRHXFUTI9LSYWrWjYT3mV+L56llz/BDA5Oy8aagvnmVY1rgekjfTh7NKxv+X0ow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793572994;
	bh=ey4s/CShPcM4NRm0OskIlv6IScuJRpe+co67OTsX2n4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T/PW/D/PnepE0islS/iaaMdQ8JtIRJlAZe0PUou58hc/Td0p1H4LgWMiOfnJkpYEw
	 6prYmfKoJ/f7yrJlb0d5VELxd8kSGla66OhCRaT532/LfXdadmuKj/yAF1MMn3aaTU
	 Ek7q048iTXDvjQG0e4WR8jzMPDn8xgf0HMMNVwECmMJX0iyG36l66bJ+pcmAyZv/vf
	 BMXTrakPV2gg3EYEeu+LSkvFDrqKJBD+JRFqcaYkEWidj4WjFm65sMcrQ4rYGMd5Wg
	 /GJPcMK2EzI7e5frF525tw/7znxW35kmIpHVxQQflJZMTJrSeyGTd/U6Pqka4ptMU+
	 XS8zO/KlwQUzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBEB480D89;
	Sun,  1 Nov 2026 22:43:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB967435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D7EA40086
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x379EdYWz4t9 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:43:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C22E340042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793572991;
 b=qoqI6YywYmBew61GjHd+hpaqgIeqvscR6s4P1Ayuq8CueakyM34PGLIQ5XrxLhYYGzBw
 8YJjqUvTGxXooioTGPUgMYCb4fTR4AgE/MJIOhrzLKlwMu+UgRv+K7Bx+IyWiF3N1dTwz
 bmn2HuSFrwSKYSc+FtE6ieT+VUlb+o1eJRUsdA7QpQ4rDeUNW/SBeN6Gm/AoAyV7+abAs
 6OQVuZfzcl5jrwaBWqnBQoCYY+DV+eCyXs9UEg6Mxgvr5FIdXZTu16UD+n3uVPo13vaki
 3eyjfxm783EVFfOS1qRQn2LiKlHkrV7fukdScZE3HnhwStr3E5cRSD4KARNdUMKFHIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793572991;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=WX48cJYzpWIIIeU5aY8Ze5KTk8YR8tREVKp/Pg40/V4=;
 b=PV9NaYuuQmhAcQK8qB+gRO7Doavy0qOVT6pgQzYoO+f5zwgtK3oHnvYYpZSrHenZ7wy9
 FpkGMiA3FG/MLdlZpiKHO7XVpof+CdVWtC+WGHBsuc6813NK52ldObiI7qBwMTn2JsUBJ
 G9tLwRAvg9t1g6xAVdAOYzm8K0Ay4ma08KLF5902mWCki4A4cJRXIWQrUFiJd4TYqnhjE
 fIm9RgLfXx/kRNNDnkVU+mnl6xqEPMZ3vmQ/NUMW6IhWEViEF0UqF6+/pVyxa9k1widcL
 HbLkCiYVhWQ/SU4PChHdH1fkmuszvtvxFhctJnVnDE4RDjABmPId3kfcmLd7gzOB+7w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ettMGann; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C22E340042
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:43:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5DFF0C49F79;
 Sun,  1 Nov 2026 22:44:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8529D60750;
 Sun,  1 Nov 2026 22:43:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3858103290E8; Sun,  1 Nov 2026 23:43:07 +0100 (CET)
Date: Sun, 1 Nov 2026 23:43:07 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <aufAd2rZ3prNBYhi@windsurf>
References: <20261030222648.270223-1-yegorslists@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030222648.270223-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/linux-tools: perf: explicitly
 disable BPF skeletons
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 11:26:48PM +0100, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> perf builds its BPF skeletons by default whenever libelf, zlib, libbpf
> and openssl support are enabled and a clang >= 12.0.1 is found in the
> PATH. That clang is the host's one, and it compiles the BPF programs
> against the host's system headers, so the build fails (here with
> linux 7.2.6 on ARM and Ubuntu's clang 21.1.8):
> 
> /usr/include/linux/ioctl.h:5:10: fatal error: 'asm/ioctl.h' file not found
> make[6]: *** [.../tools/perf/bpf_skel.mak:87: .../tools/perf/util/bpf_skel/.tmp/bpf_prog_profiler.bpf.o] Error 1
> 
> Without clang on the host, perf silently disables them, so whether the
> build works depends on the build machine.
> 
> The perf tool does not depend on host-clang, so always pass
> BUILD_BPF_SKEL=0 rather than let the host's clang be picked up.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
