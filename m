Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13E5606A33E
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=D1vJ18z/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9364E8156B;
	Sat, 14 Nov 2026 09:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvYg8QdlOK5C; Sat, 14 Nov 2026 09:59:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8830D814BC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794650346;
	b=sKyL/QfcUJvz8qcz+5dEW00ufUxorDfqC/xV20DdWlSXUHteogsXI3iU5iaqYG6paHfn
	 b22vnmQHzZaDNIeSYKaxNoiVwkKfqu9EUukOD9VSN7y8uy4Le+DyAeyIjQ3+pf2KA3oBA
	 vuaHwGc6txrAFq1kFn/SSmMBHp5uNrV5oH1pRlBPZCZSyFqYIEoyxCSSxMbk7sPkEc943
	 9eyVQSbdjAygKFPeYv2ksBEctWvEb5RQLBcq3QPYuHUFKjAW5Yo9yJtDWJyNs76CSXjr+
	 GHbBF6DWPR6QDPoVKFRK7Cb6hnja1NlsTEzRQETCCnUKBqAuW+i8IxkFwInE3ECAVYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794650346;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:Date:
	 To:Cc:Message-ID:References:MIME-Version:Content-Disposition:
	 In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UHdS1hpUNFAX7VLisKSd69qXYIReiyVyAuCS5dmnINs=;
	b=niASShj1txEJrpqaegYW8BUrysYxaBqMQCJ4Azis4Xh2xs7MeM1Zl7Yt7du+65e/2q6Q
	 wNkwWyKBjovBqLCqX8UxFN0EqcJtLfJ9JKCpM3PjKTsDgt3Tbbi8KekINq4OwT5FIc5LN
	 GQHhThozxUpKnv2CyWjPrIc5R1c6xwMj1DcnkwpRauXqZ4ZyiJXUTWfdY2wLvvaxs9P/W
	 5Re44UiUXuZ491aZF4YXOSPdT7ErMQor/zo7jbvuZ6LVEj6jndVjTgMdblQAaRig9stxQ
	 6uRplSloh19K8o9xZOVVTwS21KVcPNqz91cwMJO20wPKisXOoKozJcaKoIZkrgqexJQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794650346;
	bh=UHdS1hpUNFAX7VLisKSd69qXYIReiyVyAuCS5dmnINs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D1vJ18z/Cqvkh61PHaRq9UiQfPTMvYwVBQHk247gw7+2WnnqCkpYH0d5S6PoUyIwX
	 OYPbdJTe+HnJwX5xJHOmAs+8aRia8r2XFqj/0iu9cjNyVBlhRwXuY/itE0boVdIvEk
	 D+O3VsCoXtjAjJ7ezoQeRUQ45MPRXfbSEOsVCl3FesGT6F2WnuAtAfRj00by0RtZQ4
	 aJwNoN+B6n0WipRfd59dWPX5h3nwMPQUtI+5+y6trJT98dxQS2KxnCQ5hvR6bERRku
	 Kp105L+7yDaontrqA7RLMF5elYKQZ2TYJYIBM23buAliEp7B8R7moIA4B2eQSzxZhv
	 jc8Q3nB79k/LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8830D814BC;
	Sat, 14 Nov 2026 09:59:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C45F170B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9FC540B1F
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SipH9bWAcKIp for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 09:59:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A739840A5C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A739840A5C
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:59:02 +0000 (UTC)
Received: from L30177.local (unknown [78.241.242.250])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 97B1C19F5C3;
 Sat, 14 Nov 2026 10:58:56 +0100 (CET)
Date: Sat, 14 Nov 2026 10:58:55 +0100
To: Leo Denieul <leo.denieul.yoshino@gmail.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>,
 Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <avgw38JrRMWJUIUt@L30177.local>
References: <cover.1794475724.git.leo.denieul.yoshino@gmail.com>
 <474ec5cfc432c4b9e9413ee991ccb9d0763c9392.1794475724.git.leo.denieul.yoshino@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <474ec5cfc432c4b9e9413ee991ccb9d0763c9392.1794475724.git.leo.denieul.yoshino@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] board/freescale/lx2160a-rdb: add secure
 boot support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Leo,

> +if grep -q "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_NXP_SECURE_BOOT=y" "$BR2_CONFIG"; then
> +    sed -i -e 's/"bl2_sd.pbl"/"bl2_sd_sec.pbl"/' \
> +        -e 's/"fip_ddr.bin"/"ddr_fip_sec.bin"/' \
> +        "$BINARIES_DIR/genimage.cfg"
> +fi

What if the names of those files are different ? since their names
are not enforced and can be freely set with:

BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd_sec.pbl ddr_fip_sec.bin"

If you assume those names, something should check or enforce this assumption,
which I believe is not a good idea.

Maybe the alternative is to have 2 specific BR2 ATF settings respectively
for bl2_sd_sec.pbl and for ddr_fip_sec.bin.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
