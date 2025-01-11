Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391D4E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 22:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C30556088D;
	Sat, 11 Jan 2025 22:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In2dervOMM_x; Sat, 11 Jan 2025 22:50:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C641F608D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C641F608D2;
	Sat, 11 Jan 2025 22:50:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 121DE950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 22:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED915812D8
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 22:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLwpKfVdxM5Y for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 22:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEDF383B7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEDF383B7F
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEDF383B7F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 22:50:45 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 41315240D11;
 Sat, 11 Jan 2025 23:50:43 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 1D9B3240550;
 Sat, 11 Jan 2025 23:50:43 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id CF048240C89;
 Sat, 11 Jan 2025 23:50:42 +0100 (CET)
To: Mattia Narducci <mattianarducci1@gmail.com>
Cc: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 23:49:38 +0100
Message-ID: <12587805.O9o76ZdvQC@kilian-laptop>
In-Reply-To: <2975060.e9J7NaK4W3@localhost>
References: <6118780.lOV4Wx5bFT@kilian-laptop> <2975060.e9J7NaK4W3@localhost>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1105
X-purgate-ID: 154282::1736635843-F7C3F29F-F340955A/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1736635843;
 bh=LTCzJHQrXxpVsXZo/aboNkflEb9VE99Fsmag7xh/ed8=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=p15xgh5Xn5Ipvwe+cPMCq0z3vNtzI4HqtcwOGr59c7pSKUXmk/7c85dnqJ8+tv26w
 Sx5zwPhojX8wpbSHey1YGfJdGhC+YI01kj9MPeD/PU29gaEwhXfF2JuhPrWpDxa+OC
 husteXq9NEWOZkao60enPI/jgxR7vH1SRG3liKJA6mNv65PIvTVSyQm59i/k+H+xUE
 vUluXkJEn/P9HbOeH3d5xFyU6FvsEKAXX1bpM4quOdWpK3iMe9yY43Cz1QrLkv1L09
 wbVgSRSgtP6g3b3CfBuAPRKakZpqyoONr+w6SP62G8H+bl5TNGbG+L2XQu7iZSODuV
 90RfYNtnFy6QA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=p15xgh5X
Subject: Re: [Buildroot] [Help] Using an external toolchain
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Mattia,

[--SNIP--]

> I just tried building qemu_riscv64_virt_defconfig with the same
> toolchain you selected:
> 
> diff --git a/configs/qemu_riscv64_virt_defconfig
> b/configs/qemu_riscv64_virt_defconfig index d9f715198a..aa7eb55091 100644
> --- a/configs/qemu_riscv64_virt_defconfig
> +++ b/configs/qemu_riscv64_virt_defconfig
> @@ -1,5 +1,6 @@
>  BR2_riscv=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
>  BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_SYSTEM_DHCP="eth0"
> 
> and I can't see any problem.
> 
> Maybe you missed BR2_riscv=y, the target architecture for your board,
> which the bootlin toolchain for RISCV64 depends on?

I do have BR2_riscv=y in my defconfig. However, I didn't remove the config for 
the custom headers, in my case BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y. 
Why is it necessary to remove this parameter, and could not removing it have 
caused my problems?

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
