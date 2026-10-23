Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C061606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l1sb37J1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF02660848;
	Fri, 23 Oct 2026 13:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5U2FCKWAqXM; Fri, 23 Oct 2026 13:20:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 11779608DF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761651;
	b=qYq1Lz2Zui6HWL97YBRWPchz+sQacraOrPNr1y5Msr7hYmgMWtpDFBrDhPeKMdCeHQdM
	 cT/fK5uo3JdUxnYUkx2u9pRrxUW2Ryo3ThmpwWBTy0vqE4kgG0VBA65fNx2g0N3dn5miL
	 WN6RP0MpWQbDuokWo1A88R/iUMBeunBmO0rExu8f4h6k7lb3/83hV5gZRenKJ4DizEpo8
	 Z1FkrD1BswGS3OTo69abWLCqmLrtoBw0jRNSeNK4XFe8UeO8jwdGmZx4cuCqm3+BgfNmu
	 mNnd6QAJ3xI/a/C65fUFoflybJvOQJY6L5BZHsevs5dKhheRIP2ZJxJpZtohzVDNTbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761651;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ux9c5OeG+4Ro4bxv+VKlg6/p5tA7suSL0A8GoYD7S9M=;
	b=AysZt6Y6Q4PUxocGkD3f7MQdpjYooo2ATUGa/+pJ2PgzEZjsRRcNizvzmXaVcTmXfrKg
	 dd0G0oPmMjZzwhmBqzbwPMiIRz1IjCAKPdfiNytJLwe0lboYWZD0AcgH0tRgnsFyDplfJ
	 X7sL1s5kmhjWsdVGDhUbPTxRZrab+QpfZ6EQwVKuHtYrp2Q/XAbE6KD00uBxapjoaYAKg
	 N9S0s6ZZn6OglzeFdcA3xaBxBhLEKESYjJsV4IpiHwB4ehb5ObJLejGqQqqBNwSTKcfkx
	 UNo7IyjRLsQeiwbp4pHdz27xYU0HWxRvG8Gm9OWOV4rZ5GF2H0AzMWXIU1BQ58HxSOA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761651;
	bh=Ux9c5OeG+4Ro4bxv+VKlg6/p5tA7suSL0A8GoYD7S9M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l1sb37J16o2LacvkZS+EkDW0GPhBFpCm5tD1ecHUp57W2wSHngQ6UnRdLqE7jYhjv
	 Vo3/u5VBAAlaeBIEHeYm3qD93Mo4HpPtCxEv4c0oIsDqi4Db4YoHe45UKJ/hk9uF3c
	 9CwYNMgyUelTDjhfX4wKQITU1SC5XUOUoIVc2HgpszSVBsVfGTde+oWUrRbpQso4Wl
	 +GFt0dEnTaJQN5gZ9PouJwVE8UT9qE3dv7MGlKN0Q9ELe4RjN/cCc2N8z9cAqosP94
	 avEMSZWTBv/2PFqhjygRiOtcoB14IaWWtx0NhGvRsqlFp7ss2fd60M4CQTmsnqx7nm
	 fJZZ7teZFeKfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11779608DF;
	Fri, 23 Oct 2026 13:20:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E06473C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0E866090A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1N4EK3yzlFc for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 74DA8606D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761648;
 b=hlah0IBodzSIS0DcPCNRs9+Amd1Mu4xyRh14K5El8bgcw7T4rmP6vDwI2MFAY49paU3M
 4OU2b0WkqmFdHtRHxK7JzdUeog2HUElNTKd2+7ObVzU2AzjFLm18vUy5NqkEgDWl/417i
 u17oEFwV4VT0u0vg7ijP9OblMeKiK3tn8GmgAHKld4c1YqoreaIN0Uj9EvHeNRrdLYxWT
 CHMQGGcHXmZxFJjGGPU0jRgJ9LWmOeqHWBI8Myi404igMoAzHjNuiWfALbKa4QgEF9jOS
 i5bEq3nw1rNGK66ICr4hnHADlWLp8Cdyb8LCuR3OTgDB8JS5xO6Je6Eshn/VtSWBIjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761648;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=m3rQfGd9OuqR6CRLn/OXozeQsXepAgqS2FYkHSfXwRQ=;
 b=l5az70D7wP9MrGS+wDWfzuKk23l7s50tJZewU6Apmv6TRcHclJgbk/IMVGzRCObHv03I
 el0gjrwiKpFMS3zET8/EkPWDoD042LUt7F7b+nFOKUxKAHTiR4nXTPG9A07LQlDykQVig
 GBd2Tj9ZeLK08seF96hZyFhEhiXwLGFBQwrJT1CUG6Hv8X48RUcM3peFkOqS+Bt24rSJf
 5HPLNVYNJKaudGYyX4bEDjFenEkJoczDZrNP8WeEXFVLuVOd11askgIx5/9zzzwBn1fiB
 kpXLTY74b2SZQGfBNHs8wai2hYixykXV5XVYw+dzEyWPGHy/l48qV7FNSk+TVtzMdrw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=W8MfmI1B; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74DA8606D6
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a1df146015so6287405e9.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761646; x=1793366446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=m3rQfGd9OuqR6CRLn/OXozeQsXepAgqS2FYkHSfXwRQ=;
 b=LEQph94QX21PbRraUuzzqeEYRgujJXTApAkqcXxtaHKPfD2XXyaJ+UY5S9xrotnsXJ
 RPzeFQEKkmCsruTJzFktI8v99h7Pgo7yFFbViMU5gn66032n7gDYsLG8kklVfoTmLlcR
 BInH03YNchjVmadBQ0CF8ez74YLkB9f7gSapSjp4oOfbDQR91FiYM6Tmao5Zuf/Ke8FM
 xTrTIRoD5dL/93Af/PMbF11g2JuGvcQaowfFoyjZcwbDVYrgzqOWsExu/vAieVSE9DHw
 mUEXhFswySALy3kVD77anbmfC/o9XnLkQQR+mLo6QUbyQ7BqbDsvHZbY3KRya1wQGjUz
 /NJQ==
X-Gm-Message-State: AFq9FYJJJY35JMAsl8iyMnT63zA1vDaYTgzKNrV5JJ0iYG4+RBpOOk08
 LkdsMQdJLOtCVlfW2UnN7CySwii1FKjRYivOrDtqkiyIH6KoCUT5dCFmIdvv5mBKmhYggbxpnPw
 qgcsvkIg=
X-Gm-Gg: AYBFou1BXo13CDm6eTCE3wl3C4s+1ih5mlaGa2FBt3WDeGMb3rxSEauWsN66Mf0yCv5
 O2asufMVuFYg0PLoqvY9z+3ev8+hEmNtCG7AnK2r7JVLcrXVTZPMAhXQNCnWJ1gepLrH/5buxme
 fU/E3lk505MZ92/EaGvzgaoa9e7HGW+ai20aMMcFQopmQw/4cwcL4ML7xsXcA7wfy0A99EFntGL
 GPhRscW4owUXezQIOeeA/+1q4N4QMdA7ESgi91kHB4OboeoBPPToI8u3scsP2QAfwsN+DpoKksm
 d2u/nepRRlBJF6s04XaNdv2O5rZk1mFc0rjbAg57kAk1Nm3Clk1OCLQKO2JqME/IQmwgiw3BiGg
 GOnJDxC5dFuJd7EWkyEKlYTKo/SF7e1EjHIhN0ifgVrCpwu3gVgm4rPeDKxaCoZpzGc/NvaqpBp
 Ya26PBfFaZdcNkXIBb13eRR1J/av18Pe3SXiwev+XPiY0nmdBCYKHifkZxyRpNleotNA/GhkP5p
 EMhlpeEm45L952YCDlWD03mw2h9R6nQ3L9NQ2ACD+Byma8SwCzsFc7qHQ==
X-Received: by 2002:a05:600c:4f50:b0:49f:dc71:e609 with SMTP id
 5b1f17b1804b1-4a211cb10f0mr38801965e9.20.1792761646072; 
 Fri, 23 Oct 2026 06:20:46 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2a92a42adsm4163715e9.3.2026.10.23.06.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:45 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:42 +0200
Message-ID: <20261023132044.1606995-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017131247.1572149-3-peter@korsgaard.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/4] board/librecomputer/lafrite/readme.txt:
 document SPI flash dependency
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
> Running a modern kernel with old A-TF/U-Boot leads to various issues.  Add a
> note about updating the bootloader in the SPI flash.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  board/librecomputer/lafrite/readme.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
> index 86afa855e6..8747a9a23f 100644
> --- a/board/librecomputer/lafrite/readme.txt
> +++ b/board/librecomputer/lafrite/readme.txt
> @@ -6,6 +6,14 @@ s805x SoC (quad A53), 512MB/1GB DDR4 and a 16MB SPI NOR flash:
>  
>  https://libre.computer/products/boards/aml-s805x-ac/
>  
> +Ensure the the bootloader in the SPI flash is up-to-date. Updates are
> +available at:
> +
> +https://boot.libre.computer/release/aml-s805x-ac/
> +
> +To update, write aml-s805x-ac-spiflash.img to a USB flash drive and
> +boot it as described below.
> +
>  How to build it
>  ===============
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
