Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CECEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C66541736;
	Wed, 12 Jul 2023 21:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C66541736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21HE8_UC6u11; Wed, 12 Jul 2023 21:27:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C31A44172A;
	Wed, 12 Jul 2023 21:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C31A44172A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D31E1BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDB4583BE3
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB4583BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmIJ-d5ETttv for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:24:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B44EE83BD1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B44EE83BD1
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:24:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B6E7E0006;
 Wed, 12 Jul 2023 21:24:34 +0000 (UTC)
Date: Wed, 12 Jul 2023 23:24:33 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230712232433.6fc72760@windsurf>
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689197085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZePx3KNmeOcju6xLsbMxa519ph620zyjfsHFP6NJME=;
 b=ZZQ5zwXsbdMrWC9ZFAyL+Kmzf3G+gQ254AAJKiQUlA3dlTXlkQa8Tl4oulrNaIPmo8/eAV
 SSl/U6KE/wiQJJeytj5+DjztZSlUdk9+E2vVFsl2lB3mNxhYVIIvjkMzfRIAnaRsnOpTye
 EBHErn15SesaRzXKCXSu+INIdsyQBQXCuc3D/hAQa3pMdtIAjGsLrPp84msHlv/uaTd+w0
 d+M1ycf0CFlFPDMFP+zwwNzoFYR1gHxKmhO8Vzn8xLoLNdYdaSUiQFw77qV/uP/naK68cT
 jxAJBx2rM2PvcdwHoyTEg8mNmHz168FsghGHkWoHNra1vQctbhgflZXzrUOuHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZZQ5zwXs
Subject: Re: [Buildroot] [PATCH v2 01/17] package/python-iptables: fix
 _find_library()
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

On Fri,  9 Jun 2023 01:28:43 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> While the commit [1] already fixed some runtime issue with
> uClibc toolchain, the same test TestPythonPy3Iptables fail
> with Glibc toolchain.
> 
>   xtables_version = 12
>   if xtables_version:
>       _searchlib = "libxtables.so.%s" % (xtables_version,)
>   else:
>       _searchlib = "xtables"
>   _lib_xtables, xtables_version = find_library(_searchlib)
> 
>   _lib_xtables and xtables_version are null with glibc
> 
> The implementation of find_library() rely on the custom
> _find_library() that try to use the IPTABLES_LIBDIR
> environment variable (that does not exist in the context
> of Buildroot).
> 
> Within the scope of buildroot we can determine what
> IPTABLES_LIBDIR should be at build time and replace the
> calls to os.environ.get('IPTABLES_LIBDIR', None) with
> the correct value.
> 
> [1] d341ec035067120b456f669a826e26eb594c0237
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> I don't know why TestPythonPy3Iptables pass succesfully
> with a uClibc toolchain but not with a glibc toolchain.
> The current python code searching for xtables, modules
> and libraries seems fragile...
> ---
>  package/python-iptables/python-iptables.mk | 1 +
>  1 file changed, 1 insertion(+)

There hasn't been much feedback on the overall principle, but I found
it reasonable: we're using glibc as the default C library now, so it
kind of makes sense to use it primarily in our test cases.

So I've applied the entire series, thanks for this work! 

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
