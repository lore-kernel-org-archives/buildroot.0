Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD48606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 18:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bjB9gOPS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gsrve9px
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FC1C80E0A;
	Sat, 21 Nov 2026 18:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lEzb_NSJKoN; Sat, 21 Nov 2026 18:09:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6583D80E0B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795284543;
	b=sQ9J+a8v2WZ/FP1kYtFzL2+rciVdysZ5/bd/bJTxQzAOQxM3mNWXqvKO6BoZ58ltrGks
	 6Y752tTiUQw/nGflsHHxHrn1gqajgvcX/nak3sc7ILV6SIyHlSWFTwI4WdaIcoW60A8ID
	 Hb657H8YB805o6yl1SFISJTHTXx2NOnDW6ug+PnUqlSCyndbzFMqOAJ/Yf49r0vnTx31i
	 2d8GKLIRJQDnT+KbSpZN+mTWgpIyofLIcpU6eX66qRohdru4GjcpGVbSL6bqZNOgDlvov
	 SdnDMxEYfjyKFrK6EJd31gTivm0s2BaoM4xO1Uk/x3Ut8y5IA7Kg6ZLsLmO/tpaDJQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795284543;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=xHohXoS0gVJ2m/8L0N5VtRWXOW1KWHCO3gkV7UUcs2A=;
	b=byefQ6BMi9L/oBqTys23R3cjVO0zD4Ba2V0FBQGTrvWGg7Xk221w+NDx7sx0c24D2K0y
	 QiG4O5fKcdXg6ylxJWe3NwjNudMsPmz7pRcFLTdoL82BRwdp6w0N8zd0/LqA16p7pHIKe
	 yFSMgPYbIpCxNscCw6LF7XC51EnHEhisqyrczwMNU8JClLwjJfr82Woiun75u0i1SdF8P
	 7k0f1ghDhVGVdsevmauazoJMnxi36A356Ppu6yjWGDUdY7n33Qccs+UWukOjYkQMPeRRw
	 FtqjvH9FuBR6pOz+FgUOQ6JNiX5D8D7rR4UB7Q9+DVNs9LqR2bJOU6p9a6K/9SkxoRg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gsrve9px;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795284543;
	bh=xHohXoS0gVJ2m/8L0N5VtRWXOW1KWHCO3gkV7UUcs2A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bjB9gOPSjXLs1eVSEICCncvfPA3h3EJdkur7skvzsjjwFORU8uXJdcLSMTfWsfUkU
	 4o2UpOstUfVnJfkpkLBWiXP1CWgqI9S0r7xX88FchIm4wBFMgmQ/OEq+vKDii/iMry
	 PBxwM5YxBW7MpJ0xHJpAsbW+MkaNvR9yi2e4ufI5D3SFbLc8U5m3JHqzERFxo9itzY
	 PXujgoZV2SNRYK1BAnXUNd0+b58xIJg1+ACFPCEjM1CnhDNlIry9ydu/SDXhkGoBIb
	 G0kObF00PcMhPZKbFo01A0fuUkM5M22YZ818XwfAeQSFQQxtkGp71f6VEWtpnTsUt+
	 NKrz/gYItMLcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6583D80E0B;
	Sat, 21 Nov 2026 18:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CCFE759
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 18:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32B4E80E0B
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 18:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRqJ5odr8Qyu for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 18:09:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1DCB680E0A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Gsrve9px
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DCB680E0A
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 18:09:00 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-492f0a1b685so1359296f8f.0
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795284538; x=1795889338; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YtHcDyhla22U4Ki79G0PeUHLdBoRxMPE1vYbS7LAx3I=;
 b=Gsrve9pxvtmx9ZOPZ3AkJ2UPUN+7d22VZJYVv7qQtPD48t7bT7829AuGCxoxjCGx1L
 YCNCt/zaBVf8J2EOpDrWrwjqRFb4iEUOJSPxv2f0658ahausXjYc74Gxfzjjqufijcsw
 5hP2oZPWidSbkRGiFuu2pITytPXCvW5S6vqhYBN/klglsMtxCvN1zTJv6XoSbTZV9Md7
 r+jLsOlsjGGjQEkJkVkEf+04z7h1O+u0FQYz22/7tyMv2IX47LsrKvuxxoK0cw4slpIL
 X+n3IzHxRuhEdpufabGDrgvISuwa7njVQ+hkrWMcYeqEI10u8KZ9NMKyJk8yshSd7GLq
 bB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795284538; x=1795889338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YtHcDyhla22U4Ki79G0PeUHLdBoRxMPE1vYbS7LAx3I=;
 b=efR98M9jsI+G2RiUI4k/WS/umDmhYqbEyQKF3WKn7ElCbQnDOEYOsUYrk3TWM0DyJq
 tc2/CgeM0mD1Y6K66ZmfLr/tAvx4i2n8oSk1IjjW9L6upzk++B55TUvEJPQy9gVVKGzJ
 QdYwHwoJHwhESXd5ljDIPxLyyVISbLL34deC4HJU2memhWmH5+15I80BTus7SKGJs/DT
 Ekkzgk8V2nElK9Bk4r9RyXZfKykC+Wm1pttpt5lq2hNQDoKEZdi0OeRjJQRqadjroscD
 rF6KPgTaTP5TXczc001DRAOb647NYAkQi7QVmPBzBTa+AoYjvb64Q1FfFG4fhrvJam8P
 6xDw==
X-Gm-Message-State: APuU4Z80968YcAVxBs5jxVh+cDxoGZdWY496YFY7y32VC/s6HoZi1Hut
 AB5aq4tfyGqbdeGugZKmGGPPAC8TbsF263AkykbTZRmQs5vBxwm4+YS1UZIUfT2g
X-Gm-Gg: AZFdTZcht1ipnr3pkWY+C2/ujdnR3sTMcXWdAWvuTIB6MveMwWgoUS2f6/dTTx4crAK
 2j/yx9vZQNwt7ZtVz8oRIN+x9EEPl2H7B8j8Om798nUOvDHXUmE/OtAW9CobV5VXydV2prQELiR
 my1/wcsNcrDsG/bg6n/w3ZPXRTTOftkfA2r/WP5or9Hak2ft/R5Ez7s5XAJAwLNjsGy2cvtdCdG
 1SjNR4qZrspfBTVSFfIdDwKalAXGD4pIBaBxhkDyVpq+qYagfdQue3wa/LCQJXvHdQm2F6+sH2e
 gwE0PSTGmUnfpZ9Y7HQkHeXq3/9SaqbnEAsqK/y3T1UJ3GFeMxq0PwKd3/f1AnZG9ZnD5O7fH7M
 FT70cUGgzDB9JO1yKkFmHXCAQXOnN0NYq9hB3u7acc6gxg8XGZ5LmDXTTnZ6WQ2bSijEg/76ERO
 7aLupTKVgQmezOqkBXtG+2KUxvX3qRLxwZdS3r2zNGvbTT9ebbfW9qNK+aBnk7S4qsDnj9fh437
 QDF+iFjnpaZs7jZVSBH8Tec8EkgXBZt5RZnKHmy1ICirMkVfgQo3XyRhj1gqRPOMmnccmUuwaot
 IvfzP3vkPrQlUSvODm8kDxucNHEIGy7BV1/yy0zPdytK5ygwdlg=
X-Received: by 2002:a05:6000:4304:b0:4a3:1e75:16c9 with SMTP id
 ffacd0b85a97d-4abb4c7bb49mr13488760f8f.40.1795284538319; 
 Sat, 21 Nov 2026 10:08:58 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c61f558sm12694857f8f.58.2026.11.21.10.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 10:08:56 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sat, 21 Nov 2026 19:08:55 +0100
Message-ID: <20261121180855.3595157-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20231208231413.656734-1-fontaine.fabrice@gmail.com>
References: <20231208231413.656734-1-fontaine.fabrice@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project/clang: link with
 -latomic if needed
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fabrice,

On 09/12/23 00:14, Fabrice Fontaine wrote:
> FileManager.cpp:(.text._ZN4llvm17TrackingStatisticppEv[_ZN4llvm17TrackingStatisticppEv]+0x20): undefined reference to `__atomic_fetch_add_8

I think this patch can be dropped: the problem is fixed upstream.

LLVM commit 20132d8eaa68 ("Link libclangBasic against libatomic when
necessary.") links libclangBasic, where FileManager.cpp is, with
libatomic when the target needs it. It is in LLVM 16.0.0 and later.

Buildroot has it since commit e29dae109a21 ("package/llvm-project: bump
to version 20.1.5"), and the autobuilder shows no clang failure after
it.

Not Applicable: https://patchwork.buildroot.org/project/buildroot/patch/20231208231413.656734-1-fontaine.fabrice@gmail.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
