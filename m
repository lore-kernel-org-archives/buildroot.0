Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EB4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 09:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C343D60F13;
	Mon, 13 Dec 2021 09:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhFQYt9RYNIm; Mon, 13 Dec 2021 09:21:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FCA960F08;
	Mon, 13 Dec 2021 09:21:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D22161BF408
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 09:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C04C660F0E
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 09:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xq5oo2ccCz02 for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 09:21:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31A2660F07
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 09:21:00 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id AF3F1C0C7FCC;
 Mon, 13 Dec 2021 10:20:57 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 13 Dec 2021 09:20:57 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
In-Reply-To: <mailman.13094.1637403878.2795.buildroot@buildroot.org>
References: <mailman.13094.1637403878.2795.buildroot@buildroot.org>
Message-ID: <95d95463a351d4c6d2144cffd2824f92@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 1/1] linux: add dependency on host-libyaml
 for v5.16+
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear all,

On 2021-11-20 10:24, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Paul, All,
> 
> On 2021-11-17 22:06 +0000, Paul Cercueil spake thusly:
>> Starting with 5.16, host-libyaml seems to be required to build
>> Device Tree blobs.
> 
> So, as we've discussed on IRC, this is far from sufficient to make
> linux-5.16+ build.

With version -rc5, Linux 5.16 dropped the dependency on dtschema and 
yaml:

   "Revert schema checks on %.dtb targets. This was problematic for some
    external build tools."

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Makefile?h=v5.16-rc5&id=a84e0b319908e297b04392879bd8ce7a8338c1ab

Kind regards,
Andreas

<cut>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
