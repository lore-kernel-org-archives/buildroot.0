Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0F9606A32A
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k7M2/eo+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KuS7swVw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55B4B40668;
	Wed, 18 Nov 2026 14:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeLjiG3gASAb; Wed, 18 Nov 2026 14:40:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6FD6B405D7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795012808;
	b=egmAE96VTFhHYy5CkzFRQvAKRA5rF9ufbHYZ2T2yb0JclO1gBS+J1c3aroyJztue/Pzx
	 BPJczRHBefU+mxLYN728gcO7UOSI4mElwc9OeDOSziQB+4bevoQI6cWXR0CkkO6r0kgxG
	 u3J0VD9VXdWtLSE5qHLORHtvhpKGy0JgkN3XpFqL22x0QABgGRwv6yWlfhbNZJ60FqGEy
	 6akcLINPgOjnPSNqtl2Xhr1pycBLs4YAz1v/ckCIi3v0Tp+T0lEz0/nFerb7wqOCiGPqa
	 e/EnrQXEgY9P17PkSHQCihSl8RNCV+33X5Nxq8izW/zyTHwQzu/HafdZrWzscN4HjyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795012808;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=QtSqzBqvAAqIHA5n0UB1ar0j0we5pEY3w2bDeLJdDMs=;
	b=id0le1zC+EG7SpFTiK1rMu0jvJ54gpVLTC5acDFocGdDB8SQ0m0c4x0X6BLilV0gad6e
	 Qvs/PLcYZauFzQ3UTP/907xQ6oXJfLY/VVOn/FiYvYLVte3uVXMuMwguM/zUhLOtRVequ
	 HeHqDcsKFn6e+QgINCz/Is63q8WT9HMGmoAcN6Nnr13Om9gvdTXRw1WE4xRQjRyH29HlD
	 veAz9P0gA/o2X+920lH49npK5BXlR4BlZwRjS+vqIlXmxPb77O8aGzytpPeNUMNCndkG5
	 jRhtW6lsqGwneO2HXudUv2qRcOYSjRMyIVnq/kpmiTORmXXeN5lVHm9sijxEPEyi5TQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795012808;
	bh=QtSqzBqvAAqIHA5n0UB1ar0j0we5pEY3w2bDeLJdDMs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k7M2/eo+8xk34LNZSAsm3RGjUVL+2yR1VfeMHD8rOER7qPoeGBqEI+AvvBG8sHcSr
	 NZ7FBNtcC6xbvlCGWdUQhpKreI9hdYHwVrk/Kv9JIY7/AvbC10503n/N0OG25Ov0Kg
	 /QvBUS4ovFB5leLVj99Zezo6bI9FwFfEu2KMMDcdMfNRKcyURtTyXKA0BroYWCL4hn
	 3lMh1IXwCmJ2CCJ0DFINZvd3JI7E09t1UYFct97MFnjW07DHqvdKr4n4h9IceUrS4y
	 TJHtHnTsGjWrfVP9DknTOeBuNHC7D+QKSyCGriD66yTGYTcvzZ01r4QURmGjkklEqn
	 05dc/cqHnRVAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD6B405D7;
	Wed, 18 Nov 2026 14:40:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EE34E22
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 14:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13E188113C
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 14:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCJJyJTx3a9L for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 14:40:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2D0698126B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=pieterjanca@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=KuS7swVw
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D0698126B
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 14:40:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso611920f8f.2
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 06:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795012803; x=1795617603; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CJo7p8modvaGPFIhSoggJz5i++gTkVyEt0E59wQyHMg=;
 b=KuS7swVwn0nHHbcRyBkwbM7SCLlnNkOPCp9h8lW+G3vApf+0Qz0wmTWF9n1AUFsAES
 GsaoKSmoZLQ9nuUMvwP/ugVDzPW2Rh6NTto0rWTYVHqjlUOXQJcnjc8q+3ZcU7gR2yzo
 lbczqKDIUSkZQ3AQT3QFRUxiJQJCD6BzcLxRrDjDyrml/IOMK61uXmkWA6Kz6XSMiVqq
 2Dv6jaYGgHOBAR6poqvzCc1ZWVNRqsKEmnEWVxlOJoh3gH25H/CIM89PfXf+HBgxKU51
 TDL/6uxIDCJBr/o+Ipy6u28BjbwgIttQcXpEq/UDn/k+KKoij2zzv8BAYPGa+Qq03YKq
 uZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795012803; x=1795617603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CJo7p8modvaGPFIhSoggJz5i++gTkVyEt0E59wQyHMg=;
 b=QHWSE9Aw2Tuaq8QnPlp7m78mSSyXPecWPdMQFZPTQ9IYQVaeCiVjcaB1PSteoBw8Mj
 AjXMILR6sVffhTSgQucAriyUGM2Tj51F7fqJ/unN+uX3H9gQ7vHjxhxaSBNzFN2eAPW/
 TzS7QyFGzrWoefI8ZfC7cKVSsYtJ3ykUm34r+uKQm4IOfah/qff1FvrB2c8ZRNn15ib1
 RJEE7IYNLwRXwIX1Pe9W1R9qssxnPqQXxeMcv6dRInjDJ40iBOkhRWuOKLbVwvzrvLB+
 nw+K4TrMM2JiU8kvcTn0MsqiFnwuX0iMcsBg6nSXlV98AQrpfarZn3r9SFoJJt9kJq57
 76LQ==
X-Gm-Message-State: APuU4Z/ifmeZr7OAcTqrxYrln8CDVBn0uMuB1nN2a4QO37izz9BAjXQz
 6pzatp3NXtK+e5FLoILGXfzHXc5ialzGnPD1TmFeoXQphFy7EunoCtk1NUHj
X-Gm-Gg: AZFdTZd00O8MxM6uZE3MUxvFdknlGhDh++vmi82ICpeXLpGdmzrwvGqc1A5Sh+9Ip/f
 YKKOxJdVFAKqNrvx/10VxyCgPYnsNraTzBex6BLhdpC2VgCGvD9xuKeFtr1bTDY4jbAf8HIxUBw
 mimTj4Laucpj62btaW1Z//k862tkSSqh6lV8aLZgV59hpvoKQLgdLbkjPDC90eYG7LdywPH+YPW
 lQiZ0JIwgf8wEc/HGOiNHGXbyb0+Ie0lBL6sJCUkgRhod8M63yxyhEXvXS9QqN+lCk5fitBV0Qx
 PcE+VGMqFWYnVdTxMFCeYZCodPUIgPKl/AP0eiVdktfuHo6rVjF0tWRyUzMqhWwm1bIgveiejUV
 RrxiXGwO5Z4v2USG0DctgIO+RV/FfmRyxzBl+gDAUzEyQaDIz4b7eGNiNU9tsv9UgARSFSogqw/
 r+HHGA7MyGMD5nIPlR0enOWheDs+NwZrW1aLD9Z5gyd8gnr6maz3V6+WDgN44RomILmxcgYO2y8
 4RLrS5tuJAw1CraWt9PDIguk3FM6oAM0stb5pcjnkxDphbVNCoY0WNkrqmSIPG7EQPcbAfUnTOe
 XBU6XvFMcj3Un1Kjp45n2Q==
X-Received: by 2002:a5d:5f48:0:b0:48b:a4b:5a2c with SMTP id
 ffacd0b85a97d-4a696cfde99mr5646912f8f.3.1795012803171; 
 Wed, 18 Nov 2026 06:40:03 -0800 (PST)
Received: from case ([84.199.255.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560911fsm5335110f8f.26.2026.11.18.06.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 06:40:02 -0800 (PST)
From: Pieterjan Camerlynck <pieterjanca@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Nov 2026 15:39:05 +0100
Message-ID: <20261118143905.1395350-1-pieterjanca@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030222648.270223-1-yegorslists@gmail.com>
References: <20261030222648.270223-1-yegorslists@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Yegor, all,

On Fri, Oct 30, 2026 at 11:26:48PM +0100, Yegor Yefremov via buildroot wrote:
> The perf tool does not depend on host-clang, so always pass
> BUILD_BPF_SKEL=0 rather than let the host's clang be picked up.

This breaks perf on kernels up to 6.6, e.g. linux 6.1 without a host
clang:

  Makefile.config:705: *** Error: clang too old/not installed. Please install recent clang to build with BUILD_BPF_SKEL.  Stop.

Up to 6.6 (still in the latest 5.15, 6.1 and 6.6 LTS releases), perf
tests "ifdef BUILD_BPF_SKEL", so =0 enables the skeletons. Only since
6.7 do they default to on, and =0 disables them.

Our temporary workaround passes BUILD_BPF_SKEL=0 only to the newer
kernels, and an empty value, which ifdef treats as undefined, to the
older ones:

PERF_MAKE_FLAGS += \
	BUILD_BPF_SKEL=$$(grep -qs '^ifndef BUILD_BPF_SKEL' \
		$(LINUX_DIR)/tools/perf/Makefile.config && echo 0)

Best regards,
Pieterjan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
