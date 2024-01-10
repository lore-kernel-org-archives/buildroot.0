Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A72C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90F69400C1;
	Wed, 10 Jan 2024 20:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90F69400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9Yg64lPOz2C; Wed, 10 Jan 2024 20:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 939114378A;
	Wed, 10 Jan 2024 20:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 939114378A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 249851BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F20FF8132B
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F20FF8132B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7egQ3UlpHh8r for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:38:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E153380C12
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E153380C12
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12AD860004;
 Wed, 10 Jan 2024 20:38:27 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:38:26 +0100
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20240110213826.576052c7@windsurf>
In-Reply-To: <20240105180422.424279-1-abrodkin@synopsys.com>
References: <20240105180422.424279-1-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704919107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=au4m8U/VaisEx1juB9RL4EwSWXc6CiP5ccQzGVorRt0=;
 b=jAl7EEoMVIxAoE4km3iylyLyv6RsFEq/jq068A0cwaTVShVOW6Eh706ncx5/snBCLHyfYU
 r36+le6bQYclhKvvVAsqK/2O700VGiXkZH/IGEEMMgzV2jWOcqQNpQ9uaIcH0erkWkiFbl
 cwjRjMGQAN+wVIKJYFC8TbD0hsRPE0pPR6civaSeIZNVooobKGUXu5locAQfWQC22YVTQI
 7D3tXy7AGC3jbUiMDEzoiV5AzC7A6VbLbsKjPYU0HaNDr4Jt7lxB8D0EgIPLRh5aE3pP9T
 NpcVa659ip+xk5zxp+D6tc+zRz8r/9NeptdEHOU9+KDOOo+wi/6RqR995mpfnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jAl7EEoM
Subject: Re: [Buildroot] [PATCH] package/binutils: ARC: Re-add poison system
 directories patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Jan 2024 10:04:22 -0800
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> While updating ARC GNU toolchain version (see [1]) we unintentionally
> got rid of "0001-poison-system-directories.patch" which still makes
> sense.
> 
> Even though one may think that we do not need these Binutils patches
> because we do "poisoning" of system directories in toolchain wrapper,
> but these wrappers don't exist for tools originated from Binutils, only
> for gcc, g++ etc.
> 
> So we need to keep that patch still, sorry.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=045ab73702b8bc09f94ca1f3b8e5bf3acb0b0843
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  .../0001-poison-system-directories.patch      | 309 ++++++++++++++++++
>  1 file changed, 309 insertions(+)
>  create mode 100644 package/binutils/arc-2023.09-release/0001-poison-system-directories.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
