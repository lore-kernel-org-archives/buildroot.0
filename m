Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CC9C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589A4403CC;
	Wed, 28 Dec 2022 19:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 589A4403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuG6T_hll0hD; Wed, 28 Dec 2022 19:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76809402EF;
	Wed, 28 Dec 2022 19:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76809402EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6141BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5443E402EF
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5443E402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1V433NRwZu0E for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:54:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFB954027B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFB954027B
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:54:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C682340002;
 Wed, 28 Dec 2022 19:54:26 +0000 (UTC)
Date: Wed, 28 Dec 2022 20:54:25 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221228205425.16d9a202@windsurf>
In-Reply-To: <20221228083918.3762-1-fontaine.fabrice@gmail.com>
References: <20221228083918.3762-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672257267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n37DdBE1LsLUnccNG7uCMy91CoVyFI4xP+DqzaKkM6o=;
 b=Zxz+mboCKXGeG0NN4y4HiNrYbEuNXa40q7WEdDrH7A9uWhmmhCv1ElzWS1nGtul+hqK7bW
 Jvtm9BcnV+2wN/Ap9ak1ix21Wy/yClW19x4LIYrmeGeyx7ohPtXhVMZedG4hLyXmDvqLEe
 UXPTvA/rhV3vL6cv5iDbEfxiefcBKmCS91AD4bF6M/5MBecTt+Y/rj+CW+MdGTng1EKKe/
 DflCgfHcUic5uL2+inqvHFejHt08p254UQUcd9vlMmp85qZhzBecQzQLIXjMfNb+5hiBk9
 Zst7vmbRTCKj4fPgofUjhFeR7XfbQwmA6AnvaYQDKB3BTwzg5Id75echTSwcbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zxz+mboC
Subject: Re: [Buildroot] [PATCH v2,1/1] DEVELOPERS: drop ucl
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

On Wed, 28 Dec 2022 09:39:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 85c5af46ad6c18841576c0f7abe241a617a44cb7 forgot to drop ucl from
> DEVELOPERS file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Fix typo: upx -> ucl

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
