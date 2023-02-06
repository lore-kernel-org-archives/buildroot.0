Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB40C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DDE04055D;
	Mon,  6 Feb 2023 21:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DDE04055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aHCQtTkUQR1u; Mon,  6 Feb 2023 21:23:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67B7D40531;
	Mon,  6 Feb 2023 21:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67B7D40531
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9BE21BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C395841751
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C395841751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gLzT3IcvPnt for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:23:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40B3840913
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40B3840913
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:23:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6E93060002;
 Mon,  6 Feb 2023 21:23:08 +0000 (UTC)
Date: Mon, 6 Feb 2023 22:23:07 +0100
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20230206222307.74337e30@windsurf>
In-Reply-To: <20220731193521.1217825-4-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
 <20220731193521.1217825-4-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675718588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kZAoUW9D4oVVlp4LAGzW6+V/ioqKM5GA0pC5LVJnNw=;
 b=X4fS4v45CuTjposXR96jwhJlpzIbJGAne2Yh5LLbWGsibd2edHbYo+rJgflHcnfwGunNDP
 nI9qqjxogJfkFNyt8op/2Nb4oJaZvAjvbCvqJBH4tPTl/+DxcNWjcltCzWVsygoyMyX2CH
 kQOeduRQ+gxGuiyEZHmChGPoq7Hkq911sNn9oTATuIbbcpTe/t2wB8tYFGhcYrtQ8lkytY
 nVhVRPOBh1UGWr9li/Q1v1k7+cC8wwdbvEihAbDMMAt61dTad2NJPW8K2HnGvxTVrIeaqe
 CcAuAPTFNuIkYEXKIT27C3kSSTUXXX4WYN/ecL+stWpyC9hHbu20H7Ufxw3FJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X4fS4v45
Subject: Re: [Buildroot] [PATCH v2 03/14] Makefile: add target to update
 .checkpackageignore
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

On Sun, 31 Jul 2022 16:35:10 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> When a developer fixes an ignored warning from check-package, he/she
> needs to update .checkpackageignore
> By running './utils/docker-run make check-package' the developer
> receives a warning about this.
> Make that change easier to make, by adding a helper target on Makefile.
> 
> Add an option --failed-only to check-package that generates output in
> the format:
> <filename> <check_function> [<check_function> ...]
> This is the very same format used by check-package ignore file.
> 
> Add the phony target .checkpackageignore
> 
> So one can update the ignore file using:
> $ ./utils/docker-run make .checkpackageignore
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - on check-package, do not return error code when --failed-only is
>     used
>   - add a target to the makefile
>   - completely rewrite commit message, in order to clarify why it is
>     needed
> ---
>  Makefile            |  5 +++++
>  utils/check-package | 13 ++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)

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
