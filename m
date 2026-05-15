Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8589BCD4F49
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D27A84254;
	Fri, 15 May 2026 13:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tzffn5ev_O_2; Fri, 15 May 2026 13:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7968484339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852051;
	bh=FmNXGCcSUAnGd72YZEvx89o1HeifiX3pyQoB5jSf5cI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FjoEC0jvrYgich7N6iMpAKm1KVsSRc/5oZmy5reZOL9pb6WTqoSV4dv54UdVgwWms
	 kDJaNHJRz2Z1qNzUpcBWHaHQTTxQ4i+Hb9a+UKWmBk8oIIvWXvaiP03FYv816nMler
	 ZMfar3T++0UqpuNwBXBI8kc7QusVHEwN5NwHYgEbtFBbebGZYoNbU16gsL+tP8ZFNb
	 d+6Vsvnli7N0urwA4uFXG9cP4JkKL1iJZvGFdgz/9Z7iP7/acaX9m1c7MgXgSXjQ4C
	 W/WDis352v+48O31S+JwCVIDP33skkvTBjYoUuXk+b+lsF5DwjfhfmTMTf3xJP75m6
	 /hoP2R7vUrlWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7968484339;
	Fri, 15 May 2026 13:34:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D41936E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 137E78433E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YofnKNBONuiS for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFD8684333
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD8684333
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFD8684333
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:07 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso5183323f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852046; x=1779456846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D9olSkaY1fUiGzSzs7eeg5zRbt3iUUwY9WrdZ3jzf6Y=;
 b=N6oRu1f40JlXlWqTModk7VeQ6vNJWD4Dk9aN06UQ1HgyX4wKb06tzhSAMXn1MrEg9h
 F+guEOVeGHnbzYTa1mUOjvrADMTl+KhBq1Ji3oaRCkSgd78J13J+482mHCtaYW67dtCm
 02wx5G6fcCQANvr5jA3iCwYCYlMS4e7pP0ySA6HaoeaiArSnOza/r0jMxOWH2IPVk5Rc
 lei6N22Btk2xdSUT/N+agTi7c4jdCV+dyH64HKgKxMVF/gWsrzyZvOfpimtGOToP7uD6
 N3Hiq/hvOVCt+3K7kMsj2+d3nhPY2aDS80TKDhQ+0uOK2Iy4ZO/lFo5uLdLSGtjtPsN1
 3bUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Aw0SOpEYqf03//T8oTT7k6skeWL1c2hvHMIIjCNvP+1Aw6CD54SC3iceFRKASElcPbAk3HUiekGY=@buildroot.org
X-Gm-Message-State: AOJu0Yx1oamDca8C5b2LEMI0GG6MqwrWSg4iD+NrPN3YnAxG98sOyJUn
 11jpqBvPUa8x/mQEqpk2QH66TWD/V76/nidKiS5qVYeuvSax6nShhoy2noAaaRfyJTY=
X-Gm-Gg: Acq92OFkGmzjrP2qaO6l1iPU2QA/oCQ62OYr2deCTIVBJ00K5Kk+9KqfNorGeyTUhp5
 tS/bzVIjxtetXxRwAcpbh07cAONtWagcuhfzvnkzDRyhiwAKzNbAy2moNZKSKVz3TQZMNQ5EHah
 z4IKKs4shtUBR5VOUD5n2gKX3JSWMuRekVGy80FoLWTdQyX8f87cxggjJUE9SG2AvWTiUG6rIYv
 tzOU9Ln0Q0oeiKiCLixfuQwTJDVTFizK4DAkndIbhkQZcuSSteaKZ9o/IaXFtCgPCyfAgR4IBcx
 VHQOdU8JRyTy5ntwxmwxAilBy9xHVvWiT0+xWSqf2qfn1+nIZwCjfI9hi3AjUMSwZxtJnBCYYZ5
 riRX7yyvY23eayM0HazVvl+VKTARVN0EgEHGups4gubAvG6voRP4BNdA6X4E+HxtTYtqEwK0Ffp
 OAfe1sXWTN226+RLPQwPUtCcEEeO6rfsgzzfqFvdGdH8rE25koS7Rc+jllridgYmolJQ==
X-Received: by 2002:a05:6000:188e:b0:452:c246:ab6a with SMTP id
 ffacd0b85a97d-45e5c5cf9a8mr5297801f8f.26.1778852045587; 
 Fri, 15 May 2026 06:34:05 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768bcesm16028823f8f.4.2026.05.15.06.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:05 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:04 +0200
Message-ID: <20260515133404.316167-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425085657.474422-4-fiona.klute@gmx.de>
References: <20260425085657.474422-4-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852046; x=1779456846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D9olSkaY1fUiGzSzs7eeg5zRbt3iUUwY9WrdZ3jzf6Y=;
 b=BUvrtjgnh6sLIgl9TpVoOCBKI5/hgBJzcAsubIMxvie+Uii5cZFhuP5mR/S12xAriw
 IQa9tSPmLyE5Aha80vRAVuA7CHd8C9LG7CTTbAJX2bYuAflB/WfETPfR1bKue3DQLnNJ
 MwJEL+jJr3czjpyX8bd1E6M6xUc2CeStJ5692dsv8iXeLRy7iqK6/9Qo/0GtiDqr8Bsz
 qJLuO1Bg/nGHo6rbEviJrmldCY6MoCoQ4cgcRFWaEeiElO3SdWhqLFGLAteL4k71pQrI
 CGXLxmIkULK6w24h6TF9JH+9LaUG9qwRbvxowzEWZcEYPgHAlmyb4Zzf0v1WusiXvRru
 THIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BUvrtjgn
Subject: Re: [Buildroot] [PATCH 3/5] Revert "kmod: workaround for microblaze
 ld bug"
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This reverts commit 0d81107f021bf2a663f102bace1e3f9590641170. The bug
> the workaround is for was fixed in binutils 2.29.51 (first release
> listed in bfd/ChangeLog after the fix), which is by now far older than
> any version supported by Buildroot.
> 
> Compile tested with qemu_microblazeel_mmu_defconfig plus
> BR2_PACKAGE_KMOD=y.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/kmod/kmod.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index db9b3cdf21..bcf65fd9be 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -17,12 +17,6 @@ KMOD_LICENSE_FILES = libkmod/COPYING
>  
>  KMOD_CPE_ID_VENDOR = kernel
>  
> -# --gc-sections triggers binutils ld segfault
> -# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
> -ifeq ($(BR2_microblaze),y)
> -KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=false
> -endif
> -
>  # static linking not supported, see
>  # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
>  KMOD_CONF_OPTS = --disable-static --enable-shared
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
