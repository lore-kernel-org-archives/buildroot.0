Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DF160A3808
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OWfOfzgd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4848A8135D;
	Fri, 20 Nov 2026 10:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvHLnoYeDgTW; Fri, 20 Nov 2026 10:01:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8589C8138E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168867;
	b=SHnFQQy6YYNvpXaa+TpQhdlyjDgpEZyXF4nkQ0csF32P98nCHzm3USNTSq45hfST2OHf
	 JPjwo0f3pu3TyZwRprhkU0TNoWOjCxWT8NY7KFpCThUdrYVdz8qXpDr62Nni+8D2UV3zY
	 iEO3X2i2vjnP5dVvL4UK/a044lx3DKF09fgo99R55ErOU4HjgiH6FM9dP24LJrFXkkdUz
	 fna4SL0Bf/ygqQEyN76sJKvIuRC+D1Ci7dMy+blUypXFG7YDvtc/6GSO0yxOk+qtg++Ct
	 sMGjN6712eeV2bO7Au+JmYoGSynrm5d4eJjMiYf3PGuZhAzWV4XhCLpgPRNiAg7DOhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wiLrczV1jj7ta3RNvQxWuFJm8oVj0mwJC8MbVQ/1IsA=;
	b=C9RJsNNK8sNGi34/rdwKJmieaoqhoD3nNmB46wqNN9ctPARUSK/df7czdJ0IFSsqYhvc
	 jtA86Q1no4ITJ0/5WeqNNjWh9cUKO1skZzsOz6P+8b2kG6ft6ML21ELAMMRDyUbA04+ni
	 2U+OkB9Vun7zFkrs7DAF0vg8WCxE0no94w2rDjAMRxfVRmdZRMM6nt6woCdee7V4mj4yg
	 Wtz4/GzX0/O5D7ldN0badWHeskV/MUVU/R169XzQvFJwrpilKJQVMnpS5dzrWqOCHePot
	 NxSqDLNUj9iPTE2l/Bqj4e5RI+HByfwF0BzKYBiFsbDNYlu/cS4OCh4x2K1+MM7CwUQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168867;
	bh=wiLrczV1jj7ta3RNvQxWuFJm8oVj0mwJC8MbVQ/1IsA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OWfOfzgd1zb5gop4OalvdsXE6ejOsk3udRO+Kn3Obubgn4ZLSmwJu4Q9amaGRXAkE
	 TPnd2lE0vQeYOXBCSZzEag7f7ReJqavgQshSF/MDhB2sTtfOXBt81xF1YUfBywX0+5
	 A0UiKm1uhca2CXBhyOi1eVV79D0kg++Wv3uS7Hlt4L7iqc+Q09EJrT3WUzsXUD9Um+
	 bT/pBdoAHRUWv2vbr/chQtRRLnJwIcZX/gwZhbpKdM/z9btGwzaXDlGjl1qacx18bB
	 uX+SNHsNedLHzVhINz6Iq6KnmWn+h1yd45OtTijd3i8uxs2J62nO+65ZbS5ZcaEyvF
	 wgDpRm2KwKCxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8589C8138E;
	Fri, 20 Nov 2026 10:01:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 986E1E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EB1240ADA
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPt_3tEPtBuF for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:01:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 96EB440D5E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96EB440D5E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4acb44dcd7bso272703f8f.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168863; x=1795773663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BHk9DEtCDDE+Y9ZgSYMgXmSVbQ7posXWqXrnk7um1eM=;
 b=jRHcvpLQNSUCbuIHc+xwWjkCIpAVMdoAh2L/4fLy4FJI8dRRCCAUmkVFMxm6ArNJRT
 kNC3VMQq1NNJbI8/4h/nYwaw4sTseYeTKb62dRdOsGWRBV/kzIGMRfCqs0mAfiZOPdPx
 /ATvhAC6J+SAtTa0aY55xrjzVN7QpX+gheLEcQT7MGQlRpnuqALdsMO/D3jNvj2YThUU
 t3Am0YI81arAvS/s6DGoGLJb7Srf5905gUvljDc9r2cIzjwhKTwOACQmQwj/pI1bOQSL
 HfqQ7inn5jW3aXt7S5OZmDQQxr4uQBdGwTsc1J4sTMN29NxkEP5j+8KFTNG7gzMfWmAP
 QMKQ==
X-Gm-Message-State: APuU4Z/Hdu40TQfjx5Y91l1KAukiW4Fa8iy+PgYpgPLC2uV0Y12R1TU5
 cxWPXxFx6shws3EqPuiJ4vsr9SE9gtIqRj5zI0XojqRvdkg6YKfCMDfiZVMgSiExIlQoSiiNj8K
 hrcWA61U4yw==
X-Gm-Gg: AYBFou0JLrw8goYiWPS9myXiwxNyDC7ip3VNXo9tL68265s3cnku8y+N3/9/+f5B8Xz
 ZMK255OYH08qvDZElwWtU+I6uYETuDOWKezd42xS+6hJJtFXZLw983ogmVG3iIbMFx3w+8rasIN
 QfqfHt5RA280R1EpAlZj/cVUe4KvkbDM0kQZX2oL8KeLITzCDWzDPtv+FlP4cE+hG8fQrW4vzCn
 /I5FfmKyfx+JPKh4N0QZ7ynagK+PzlPcez2A0GzgsBfu5NQ5d0nITe6YthOQpZ3DjkmvElLRyqP
 a8X9foGxaKIIQCakJO+OPeefozlD5x9+kyf2OXS0k5/u4TfU7ZLf4Regmq6J2kuqMNMNON0eMLC
 6aY7XeJxvnIGN+XyBikSwKDD2zQvdyvojM/J5d926NJflMZR882W8IahA2U/2XhxbVwyhVF0P1b
 cA3NmAkShz6cycF2usVjqADidnILRx2kNBQtNclXOHGa1lumg8Y75mNSZmOkpMFiDRgvijo41tN
 xs4J8a2bKdfx2BWQc7lIDCS6uGuwYkXMDE1VgH4NY4OJJTqPQVYetTS06hBIAOqqI1yrQPNXlZu
 snnd/2UXcM+MKMWK+/i6nJ1O0KagCqfp+lZuFs2Znc1+
X-Received: by 2002:a05:600d:1c:b0:4bb:685e:cc41 with SMTP id
 5b1f17b1804b1-4bb8c526ac4mr20624365e9.8.1795168862991; 
 Fri, 20 Nov 2026 02:01:02 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6ae2dd55sm4524054f8f.30.2026.11.20.02.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:01:02 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:58 +0100
Message-ID: <20261120100101.542542-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115081722.31558-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_glxinfo: add
 BR2_i386=y
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Buildroot commit 86240fa45d11e3388968520b4a35f0a40954c132 switched the
> default target architecture to AArch64 causing errors with this test
> seen by the Gitlab autobuilders:
> 
> WARN: defconfig can't be used
>       Missing: BR2_x86_core2=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  support/testing/tests/package/test_glxinfo.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
> index 2c3181d9fb..bedb8443b8 100644
> --- a/support/testing/tests/package/test_glxinfo.py
> +++ b/support/testing/tests/package/test_glxinfo.py
> @@ -9,6 +9,7 @@ GLXINFO_TIMEOUT = 120
>  class TestGlxinfo(infra.basetest.BRTest):
>      config = \
>          """
> +        BR2_i386=y
>          BR2_x86_core2=y
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
