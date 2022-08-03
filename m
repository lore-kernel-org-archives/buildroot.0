Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BF4C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B433828D1;
	Wed,  3 Aug 2022 16:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B433828D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WTBlTCwUvNy; Wed,  3 Aug 2022 16:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5721C828B5;
	Wed,  3 Aug 2022 16:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5721C828B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8079F1BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40E0B600C7
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E0B600C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTFuBNTj94J2 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:20:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE3C6600C5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE3C6600C5
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 16:20:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E3D0240004;
 Wed,  3 Aug 2022 16:20:23 +0000 (UTC)
Date: Wed, 3 Aug 2022 18:20:22 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220803182022.29e43972@windsurf>
In-Reply-To: <20220803153324.814454-1-sen@phobosdpl.com>
References: <20220803153324.814454-1-sen@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659543624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3hXMuHZZt1Xn4+iol6PYdBHkZ65n/slLtmhAG8FcJU=;
 b=J8Z76lr5XttvMZkNelBSlm2SzU2TkNiHaYOFto1gICwOOQFUx1roECYzfr+Mf80fYAf8qJ
 POggk18Pun4+cFKwFaXhPk6+pC93VUZHtNB7VG3614hcF0KJ70b+EZPHUjYciPrtvrU25b
 Qhf0MBGTUNyNtqqa/gWmtrumN0g6GrlADobrlRGNPYHXPs/87quYkVPXgzWNIghFjPjrET
 P9TWDVlTpKPqF0Rs2VxOTCmf7Zga50auoGHYhcna3e1a6WomAB5BsLArGoozIpNX1xXJoT
 dxfTQxELL7/NCeYJ2qiot7qduQ5tzScn5/IPn1XVCTe/ih9+i5ZqvxVg0Sr5yA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J8Z76lr5
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: add
 linebreak opportunity in CPE ID
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Aug 2022 10:33:24 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> This adds an optional linebreak at the vendor attribute in the CPE ID.
> 
> It should be noted this is purely for formatting/layout purposes
> and does not actually insert any additional characters
> (newline or otherwise) into the rendered text.
> 
> This means that even though the text renders across two lines,
> copy-pasting will still yield one line of text.
> 
> example: https://sen-h.github.io/pkg-stats/c245575.html
> 
> see also: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/wbr
> 
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> ---
>  support/scripts/pkg-stats | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

I had initially thought we would add a <wbr> at every : separator in
the CPE ID. Your choice to add only one after the 4th field makes the
code slightly more complex, but probably avoids wrapping occurring at
too many different locations. So I've applied as-is, we can always
revisit/improve if needed later.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
