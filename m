Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5300DFF8873
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 13:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 726D584CCB;
	Thu, 30 Apr 2026 13:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIChA6yKsYBS; Thu, 30 Apr 2026 13:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9390884C6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777556348;
	bh=gmXj2LMlrbA8/n7XT19Qc7vHYVER0o9Y+hc+uzB+92M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rhmmne0VjXgoU7vzkXp44mpLsatnj63NH0TIXvgxLrIMdGEl4PXASO7KTXPIhwS/V
	 lp69Bst+rgR0F+c3Fq4YE2cNwGqv8j0Fri/t6aZ3dIA3INPlOkl1tMS7kmadbsd76p
	 aaNd+/72hhL9tcuC4S0KyUNeu8tnNsWNY1QiIy0BwqlmJ+WShcYVuQR4wEKHHJvO7Y
	 yKLyqe6QziC0R10aKV9YGfQQqkjYuxi5kxLNI8DVhrzDx1q0DkXdd30bKRi/HveiQY
	 zCA86sgLa8/rmfpPGu6PcCxFf+1SOYR15DpelTeUj9z+GCBgpQMihI6ILoHaAOzrEB
	 6dQEIHhk8OAsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9390884C6E;
	Thu, 30 Apr 2026 13:39:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9678618E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BDDD84C6E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAwFI5f9iPvT for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 13:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B85CA84C66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B85CA84C66
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B85CA84C66
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:39:06 +0000 (UTC)
Received: from [192.168.178.45] (p579bcd04.dip0.t-ipconnect.de [87.155.205.4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 64FA12C86F8B;
 Thu, 30 Apr 2026 15:39:04 +0200 (CEST)
Message-ID: <02bf6de5-4e63-456f-9afc-a64386d1b379@bubu1.eu>
Date: Thu, 30 Apr 2026 15:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260425085657.474422-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777556344; bh=9HVzA+741Feh5vSJyCyDX0GevFC0pdr9UNTscuYxyJ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=k8WBNY392YUM42DSO0lj/RA+W7B6Mtq9wEeKTbF6HbJtjK8oXAwG4Hk7H/BXJyohp
 6JiApUlAD069r+YpmfdMUD7MwCeV/HRubWsdc15kJkgcafw4VcujGV0PQ1aEBTn9En
 BztxCK+CpWOpQfbtDgVYBR2rAri/u/OsuFB4pY1GibnI0K/XBWKcNJtePvbJp21zA6
 DvVC82Bz2wX2+zJPeK8Z76ripcdQrF0cdem0AxrPv1jywPTbj7mvjH6TU0BnHCT0Zn
 qw0zRZRTasPcKZQjV0ZsLNq0TxwX8OqXDgiHC/60C4v1BIdd2m4fVdWcDSe+GJizwA
 C/LzAA5NGH6gA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=k8WBNY39
Subject: Re: [Buildroot] [PATCH 0/5] package/kmod version 34 and Meson build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 4/25/26 10:56, Fiona Klute via buildroot wrote:
> Hi everyone,
> 
> this series updates package/kmod to 34.2, and switches it to the new
> Meson build. The upstream changelog for 34 states the old Autotools
> build will be removed with the next major version. I've structured the
> series to switch step by step:
> 
> 1: bump the version (should be backportable, if stable maintainers see
>     the need)
> 2 & 3: tidy up to prepare for build system switch

I applied this until here for now, thanks for the well prepared series! :)

See my replies to the other two patches for some clarifying questions.

> 4: do the build system switch
> 5: enable the new dlopen feature for compression libraries (if any)
> 
> Best regards,
> Fiona

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
