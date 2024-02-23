Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264B2C54798
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 16:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF29140540;
	Fri, 23 Feb 2024 16:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzPwRRYz9Au0; Fri, 23 Feb 2024 16:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A30D441C94
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A30D441C94;
	Fri, 23 Feb 2024 16:24:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CF5D1BF405
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 16:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69BD541C99
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 16:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9W-M9F8opNFB for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 16:24:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C82E240540
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C82E240540
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C82E240540
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 16:24:09 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dYLGrHzBKTxvVdYLHrhQtA; Fri, 23 Feb 2024 17:24:07 +0100
Message-ID: <197750aa-c25f-44d9-89ac-872053953422@benettiengineering.com>
Date: Fri, 23 Feb 2024 17:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20240222130716.1311432-1-fancp2007@gmail.com>
 <20240223131603.2313178-1-fancp2007@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240223131603.2313178-1-fancp2007@gmail.com>
X-CMAE-Envelope: MS4xfKyPt9etL0IezTHX08Fq9nTM4X7qhq6m3vgEWprSjUYD0iNN3ODwfqWZs9M/zXhtfbxy3w5bYvLJ6l/yMVaTmzSFFJR2cLKHz1W6P2CEu5lOMfHrW4sr
 KCx+syLFp1+dl8soybyrAzwQIjDBawNfEyLdW8Xfr4XXenC7w6Rht5RpgHWetLSu11DoSvdLd4vW2JKrNkWVtJafno4dfMnNSA/q/JG7+UzaAfySVcDVuQlg
 pkZCiTi5i0Xi+mruXhgQTA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708705447; bh=dU2e/byCAytiX239dU0KBi0jB0hD5DNBrBwzEt1Mnz4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Hh1jn4QgNHj/GlgWGkVNa/wc28p8Dl6xwaCmJ8ITbVxGCl9n29Xl03vPfUYW4gqKy
 CFMJWmPff13zmzyhaK9AdkMXH9pInvbycyMwa6NBR5uvjabdxO5a27jTRWX7FRpSss
 biRKl5nEdJcR1ltXvkOiYI4+RTF39T5ZrgwtGQDq7S/OIBG/sjJs8rVOpPutkGXvvJ
 W7yAn+sJW9YU6RDVStdxcPww77sMcaSBU9HPk5NVdK8MVB6m4yAbMJrIw89bSGpGT7
 HQkHuW5FphIUQ2wWxpuCDIqgDBEooWeKqoaE4BaWhYReRIuRdJXCVU/CMFVNo/d8qD
 XLmlunV47+QMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Hh1jn4Qg
Subject: Re: [Buildroot] [PATCH v7]
 configs/friendlyarm_nanopi_neo2_defconfig: new board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Scott,

On 23/02/24 14:15, Scott Fan wrote:

[ SNIP ]

> +
> +# System
> +BR2_TARGET_GENERIC_ISSUE="Welcome to FriendlyARM NanoPi NEO2"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

What do you need MDEV by default for? Is there some peripheral that
needs to show up automatically otherwise the basic functionality is
compromised?

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
