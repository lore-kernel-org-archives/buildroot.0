Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA5606A335
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jt64ZhA5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xtTDNT51
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1993405E2;
	Mon, 16 Nov 2026 14:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjPfwGgX3sjR; Mon, 16 Nov 2026 14:36:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2D994405F4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839765;
	b=H8L5ebhLke0pR7vMGSMXrchi/gbkywXd0V3iFVDlnrp20sxv7yn8y1GYAnMpseczASmJ
	 eM8/cWbUaQi6kqiMwVwL57fnDUBqvOOdA7jmiU2+aGN8IeGomMT8XCvP8Vq8FmRoBRwc1
	 DiewE7KF13qa/nW3OOu0VC/48HROEq1/pQwj5NHEyEnoEHCj7LYeNCw0FXZksshosvbq8
	 9SL16BOINp3mgQ9jF+pPDZ4EuTAPBqHJAdwz6TugvRtrTDuirKlHLXsxjAi8b/krPFBs0
	 wxB5aaFLTOAVc3cZ6+9GF8bRkBel8v+yD3Mz+ApJYp83CWyfz+8f8sEZRoW4ic0hjEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839765;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=H1KfS92ajygXFK3enZYiVz5jBMcYcmrY+slMGMsl+5U=;
	b=ZDFbtW92lcHuvpC/lSIQZEJuoNKxIo16SZXJQvD+s3KZGiQQEDG1B8QIKFzJjkRrvezw
	 tb8zIWTEJZAzlYm97FMAI3ja67SYlvv5xp+mYLx7OVA3nOBlJ4SY6FxdpPtQ4kj5SE6+W
	 pM4nCd8sGaQc6MALmOExnNOfcIJDI0vv/R5em9zn+0iPRy+j2XzTAooNAS2j725ZvFonm
	 JJqF3oM5xLrXM8+GU417eAwVAC5t0b2p7dbnI1HFrd8H6CjsXu3MTdsmGkUeqA06RiNEn
	 oEiwPy5AuBOnfMiJeaNPVZMSG9x6HAP6n9jyKxbZTNBfdIdX+N2cprZwFND3jX6VUeQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839765;
	bh=H1KfS92ajygXFK3enZYiVz5jBMcYcmrY+slMGMsl+5U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jt64ZhA505xditZZ2fTG+SY9AqjeuqAtj1l12DvGvA95q2j0YehCwMSEjfyisBGee
	 J69xGAh9k0LbaUYdnJqi3jWTiRh8FsYC2pX5X+4fIyIab1IcmNouRzhrH9nhxcDUcS
	 5MVDRfKNZTTIqelq6Q+yS5BvxZqn2LxY5VggXKWvyTIlPUvIVw6Sd1p8qnU3A0D0br
	 tfj44WM3Hnrm9i9vpryo3LvK6TlDPP9zWhMZ+TZTWyMfk/zR/8oZyaClRGnojDf3D/
	 OkO6WiDtojqIkgagjxk5D2FvHosQRYss5AcShLAWU1VN11N060XOdSrquZmwxmcX0P
	 fLHu+eaGTto7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D994405F4;
	Mon, 16 Nov 2026 14:36:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FFC128C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41AC380E9B
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uu3r29lSssGz for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:36:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6039380BD7
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=pieterjanca@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=xtTDNT51
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6039380BD7
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:36:02 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-490585eddfcso2546319f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 06:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794839760; x=1795444560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B+Nv3XZott3aPxyuGxkrOW4AkF85RxvZh53QiHQJlxw=;
 b=xtTDNT51VwwbiBkkV3T+sCz0+lnXRwWm/XOniEMHki20nG1yrA3M+xmek2joIfy2U8
 01QmLFILUDq2tfJ5tpfPCMUyaxp4+k4KTCuUVZ+433NTUnuOSBLIPrhGufw8jYZR3ci+
 +Rf66TUXKqJnSN6bfKZ1CytzGxfynhirdMqNDR8urwmzM3F5VrcSVwsmrYWM1KripUej
 hgJo4z4fOg7lRoX9J3Pqs6dvh7yzjzN1MpIY7Z3wXOjSj7HiSZwzExBOthna+/MVQ64G
 bq311hW4GS2MTYi0r9VVpYvZlicYpB3ezEdGeGbHgHxW0z9x/TH4E5iSVFU41msri5Wq
 VASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794839760; x=1795444560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=B+Nv3XZott3aPxyuGxkrOW4AkF85RxvZh53QiHQJlxw=;
 b=k10DB9oj5eBoru4l9NrbAcuMJodwkCq/9mtsIuTolL0VWZI29/cdig5Jf1Engvgtma
 mNPgZUSktjNxspt/f7MbaGs92oeutJCEyjOERABYVwJmnnGKOWePEAE177ygdALQIkEK
 Npj9Sv9Zupfg3KulHgNmhF9yTldRe0Lft6MvVIE6571Yv7t0nnGzX/HZgSPX+ebSW70g
 wwTpeRKpDHCfNv961B3vYtUmI1rG3y045uYe8e+Te+zf9KkZP4LJoEZ9LmJFuYFypU0m
 t9loubx5kP2HxcPE/UkeN5Us1eNsrrJI5K8cEi3v34Dvvn2OR0BOi10MHQhSOsWaUftQ
 ck7Q==
X-Gm-Message-State: APuU4Z8AfrsKCMbSoviyh6yxqo3RsWS0q4+CflvYHdk2y2uacny/VIH8
 1+I6ARv9xSsxPFTKrg+6jrhlgp2r5p7OqJkYrY5dn1xXKYlFt8E8J0gVGMPO
X-Gm-Gg: AZFdTZc5/rh0OmvX41pVTT+j3dUCPPtnv/iQi0ky6+BxAwbF6UaMnd/BnyETw5KSy6S
 drwVgArG9DSj4opQj1ViEjKe7FQ2E2wgm++qsKydsetuSpfJ17Qm7IG9XTgTl5qeHGPcwd+GjK4
 MhLVT+DFZKqqfPSV0+i24bvUHGl7SxlNsAp6mZ15bi2ILjO45yN/sBP1Af1q8wY10KtIL8z9QD5
 fu/BB88CAtRFM6aKh0Q8AutSJC2EgTkU15/X5Zg/89bn5qIaD9DWg29yRwxVMZULMm+R4L9Jiv5
 sKLnnJBrjyDYlc7J9l7UKoTmyFG0sNuvqQPdK5p7vgYwtb0IT//Z8YCXRGcR7UHOQ1v7N3fp39V
 aHRUHPB8uLociABZXT7e2EEh8JHlw3pFK5f9JxEgGYwNTbatX3Gw6R/UuY9DwdyPlBsf8iiRNz0
 Oxjcr/BYjGNMAgyR329tebyO0z8XiB3JD+QyQb2aKBpJBkc/PFJ+UpGQGZ13hL+NBhvVl3uLlOw
 U0LL4NvmivDuoBlScddUccSl6lGERFEqvevf318Mvd59XC2VEYvNDGG2fSxwCZoybdWM81oNgka
 BQ6+usyJUXNGI1Uqu8gvoQ==
X-Received: by 2002:a05:6000:24c6:b0:491:273c:9649 with SMTP id
 ffacd0b85a97d-49c70b051dcmr24650606f8f.15.1794839760044; 
 Mon, 16 Nov 2026 06:36:00 -0800 (PST)
Received: from case ([84.199.255.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c1968sm22972967f8f.10.2026.11.16.06.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 06:35:59 -0800 (PST)
From: Pieterjan Camerlynck <pieterjanca@gmail.com>
To: buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 efibootguard-dev@googlegroups.com
Date: Mon, 16 Nov 2026 15:34:50 +0100
Message-ID: <20261116143452.2862638-1-pieterjanca@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-1-65fa5eb2acf4@gmail.com>
References: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-1-65fa5eb2acf4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 1/3] boot/efibootguard: new boot package
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

Hello Christopher,

On Thu, 18 Jun 2026 02:23:29 +0100, Christopher Obbard wrote:

> +ifeq ($(BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS),y)
> +EFIBOOTGUARD_INSTALL_TARGET = YES

Could this also install to staging? Besides the tools, "make install"
installs libebgenv (libebgenv.a, libebgenv.so), its header as
efibootguard/ebgenv.h and libebgenv.pc. As long as they only go to the
target, no other package can build against libebgenv.

That would also allow enabling the EFI Boot Guard support of swupdate,
which package/swupdate currently disables with HAVE_LIBEBGENV=n: add
efibootguard to SWUPDATE_DEPENDENCIES and set HAVE_LIBEBGENV=y when it
is enabled. Maybe something to add to this series?

Best regards,
Pieterjan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
