Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C11E77173
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 08:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A8C380F6C;
	Mon,  9 Dec 2024 08:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCWq-2iSXpKg; Mon,  9 Dec 2024 08:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 096D880F68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 096D880F68;
	Mon,  9 Dec 2024 08:19:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68B3BED2
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 486A44038F
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIwr8BSFkTfF for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 08:19:12 +0000 (UTC)
X-Greylist: delayed 447 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 09 Dec 2024 08:19:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B3BF4038D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B3BF4038D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B3BF4038D
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:19:11 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 86C95C0C2A
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 09:11:40 +0100 (CET)
Message-ID: <dcbd3f77-e737-41a2-9f23-87141d0bdf9b@grenoble.cnrs.fr>
Date: Mon, 9 Dec 2024 09:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241208214748.524923-1-geomatsi@gmail.com>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20241208214748.524923-1-geomatsi@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1733731900;
 bh=+Hyys/pVORN4M3b9BYLnhJrNdnAy/q1/arpQ2fSE99Q=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=HQLj9jBmpXJiNjnj/L7dv6VGJtYMouCTaSy54QNEMPi5qda/HSH1tsY6hAGWb07cq
 W9TQ8hLX9hEEMgPIswsVNVZQvV97mqkgZ5JOqRf9g/JPgzOiWXevcBGK5vLERMK8AX
 zZwzLW8RMkztVdhLxC5Y9R8BJFBXFEJj6P72jpJPs2tBzflGBpdvtTELoltGa1Qfs8
 Te/5EMk1y7VBadh6Zw0/sy9Xekecql4Q4mRCv1W+qJM8mlcy17/8bT41XKQ9w8r22v
 TCoD/V3IYonQ0NzU1Ln4Bz9Eynx+qhOWl4GcH5X24NgWeeUpRAvppWO5E3PusLTcyx
 LiAuixIIV7sgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=HQLj9jBm
Subject: Re: [Buildroot] [PATCH 0/3] {linux,
 linux-headers}: add support for 6.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everybody!

Sergey Matyukevich wrote:
> I have been waiting for the new LTS Linux v6.12 in Buildroot to start
> sending Christmas updates for some of my OrangePi boards. Now v6.12.3
> is already available, but the latest kernel is still have 6.11.x. So I
> decided to undertake a copy-paste exercise using the latest kernel and
> headers update series by Bernd.

Nice!

Note, however, that there is an issue with Linux v6.12: the kernel build
process won't build the device trees provided by Buildroot. The issue
has been raised by Chris Packham both on the Buildroot mailing list[1]
and on the kernel mailing list.[2] I think this should be fixed before
bumping "latest kernel" to v6.12.

In the kernel thread, there is this solution suggested by Masahiro
Yamada:

> I have [the yet-to-upstream device tree files] in the proper directory
> location, and add
>
>   dtb-$(CONFIG_ARCH_FOO)  += foo-downstream-custom1.dtb
>   dtb-$(CONFIG_ARCH_FOO)  += foo-downstream-custom2.dtb
>     ...
>
> just like how they would look when they were upstreamed.

Maybe this approach could be adapted to Buildroot?

Regards,

Edgar.

[1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
[2] https://lore.kernel.org/all/20241016194149.4178898-1-chris.packham@alliedtelesis.co.nz/T/#u
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
