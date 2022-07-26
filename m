Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704DCC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EFB140133;
	Tue, 26 Jul 2022 21:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EFB140133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8eWvH5qvl3L; Tue, 26 Jul 2022 21:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA63440361;
	Tue, 26 Jul 2022 21:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA63440361
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0831BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44B984013F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44B984013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Tar63er0Dar for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:47:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21ECF400E5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21ECF400E5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:47:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 178451C0003;
 Tue, 26 Jul 2022 21:47:48 +0000 (UTC)
Date: Tue, 26 Jul 2022 23:47:48 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220726234748.29d5be38@windsurf>
In-Reply-To: <20220726202645.347259-1-fontaine.fabrice@gmail.com>
References: <20220726202645.347259-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658872069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQPP40CQkPbvcRyLN3JT3DBjKkLuIEq+YoYAbdazThk=;
 b=bHiAUVyVI/K16hU72eDleJIJ1vJecwL3MBJa8zPlANA6J2y9Q0wvnIjRjFoTuB4c7IowA3
 s78VBiEw8oFlVcrYlkYttwS3mehnpMuTlLLo6mwyLi39hinjSei7L3FNzm5+llndpUwVSA
 PgaAdgdrxVbZKtU0RVK/BRhOPPA24AfYT8UF7HgJ7ctf7Pxcav/V1fCRrLYLT6WPiSWBSf
 V+g+dcFEhf4/kNlN15ado6tUHq86FfKOS1p2exF2Tg8AxTp/JoqWV7t2ORnaU6SYtBIxnc
 N8PxvEMnngvvjfueH3bVjaLR2x+CDb+3jeuHsSm7Cp5pdwl/dPBZ+01k9+WMIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bHiAUVyV
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: disable cmocka
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
Cc: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 22:26:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable cmocka (enabled by default) to avoid the following uclibc build
> failure raised since the addition of the package in commit
> 8aaa7ecbce1d10cbcd880c3da5e429988f96176a:
> 
> In file included from p11test_common.h:30,
>                  from p11test_helpers.h:25,
>                  from p11test.c:24:
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/cmocka.h:2334:47: error: unknown type name 'va_list'
>  2334 | void vprint_message(const char* const format, va_list args) CMOCKA_PRINTF_ATTRIBUTE(1, 0);
>       |                                               ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/19d1171a76cd4789472b16aa24b44f58cd7e0a1e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/opensc/opensc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
