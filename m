Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB3AC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 687814063F;
	Wed, 27 Jul 2022 14:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 687814063F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vz9MBnyM1BWc; Wed, 27 Jul 2022 14:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7811640608;
	Wed, 27 Jul 2022 14:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7811640608
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC721BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2A6180C98
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2A6180C98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id raikJQdEYlpH for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:58:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD8980C34
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBD8980C34
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:58:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 599EB20009;
 Wed, 27 Jul 2022 14:58:32 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:58:31 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20220727165831.56080dca@windsurf>
In-Reply-To: <20220726134436.2014032-1-thomas.petazzoni@bootlin.com>
References: <20220726134436.2014032-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658933914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cr9VHXfyCylTseF2spWkgSwFB9FqKGdmy6T6C7g5r2U=;
 b=KKjSm/p36HqrrGw/S/oFvab7VLKhIemUvjkmyXs5qcST5QXqCo9grNapRs86nCGgFQ1UNz
 /WF046pd3wFuPFGNOFl9WHE8ExJKMhiriw+qHi4sG0Jckf8xvW5apur3tZeQMuOGGb4AVs
 2lgkVaKBHNcvs1u3JVEaka68WLU/67ZVuxHUTIX6+c864Y5XHVR2vYoJ3Mnh0fmE6TL3Tf
 cVLsh+CLemuvC2UxIbaP9UcJNdd+FQi26KxnB93tIOTVBhdCpBthujwU3pkV0PjrAHluGI
 qelAl0flq61u0vfds6RucyBHFVE21U5scHJ5Nn6D3481mpHRUV2bsNN6NFLFpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KKjSm/p3
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-buildroot,
 package/glibc: sync glibc dependency comments
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 15:44:35 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> In commit fd839aeb7f40596e60bc53a96b7a65892924cc26 ("package/glibc:
> introduce and use BR2_PACKAGE_GLIBC_ARCH_SUPPORTS and
> BR2_PACKAGE_GLIBC_SUPPORTS") we moved the Config.in logic about glibc
> dependencies from toolchain/toolchain-buildroot/Config.in into
> package/glibc/Config.in.
> 
> Unfortunately, it is not possible to move the Config.in comments that
> tell the user, within the choice..endchoice for the C library why
> glibc is not currently selectable, so we had to keep them in
> toolchain/toolchain-buildroot/Config.in.
> 
> Turns out that the comments were out of sync with the dependencies,
> and two comments were missing. This commit adds the missing ones, and
> adds a comment in package/glibc/Config.in explaining that we need to
> be careful about updating toolchain/toolchain-buildroot/Config.in as
> well.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/glibc/Config.in                 | 3 +++
>  toolchain/toolchain-buildroot/Config.in | 8 ++++++++
>  2 files changed, 11 insertions(+)

Seems like I was stupid: I mistakenly pushed this patch *before*
submitting it... So well, it's applied. Don't hesitate to let me know
if you see anything wrong with it, of course, and I'll fix it!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
