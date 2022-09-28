Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656DAC32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B77830D7;
	Wed, 28 Sep 2022 21:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10B77830D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vAwuzyXwdQ3; Wed, 28 Sep 2022 21:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BDCE81471;
	Wed, 28 Sep 2022 21:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BDCE81471
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8CB1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17D634170B
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17D634170B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbuTPosdpq4h for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:38:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F4B41719
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71F4B41719
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:38:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 62889100006;
 Wed, 28 Sep 2022 21:38:57 +0000 (UTC)
Date: Wed, 28 Sep 2022 23:38:56 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20220928233856.77bb191c@windsurf>
In-Reply-To: <20220927221133.594071-1-f.fainelli@gmail.com>
References: <20220927221133.594071-1-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664401137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QjqBEc3lVZDH7bnt1qcg3LaJ8qYYDD77Ye/NwWS6PA=;
 b=b+679Wvt5xnG5Hcz4Uf7CqU8dz++nj/O5x4IS9znIdNRYIhIwdTRvq1BiyNPZw4EnkMwED
 dc7igWJ8leeBMdp2kyMi46v/UkNLWQ2PF/m57hR79EhvtXqITNUbXCQ5fzmkfv4LFg7uPY
 twQfEhYA7rHDzTIucLqNl8hKE/VVM4b9st8LBEfW8jV/3AWgDzn+zaCKss9XgKebNyVmV2
 kxwCxxwibj6wAX//Sqa8oEg3P5StrxC8mLq4zhAydqlmEwunAKNINLfA/e8uQR3w5cR55c
 H/Xj4ejpEGbMqXqpyJ61IGFCcZg/SbAyKGs81Z55nh/rit/2xS0UOXIDcSq5aQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b+679Wvt
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florian,

On Tue, 27 Sep 2022 15:11:33 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> Since upstream Linux commit ed21d6d7c48e6e96c2d617e304a7ebfbd17b1807
> ("perf tests: Add test for PE binary format support") present in >=
> v5.10 there is an unconditional installation of PE binaries which will
> be rejected by the check-bin-arch script.
> 
> Make sure that these binaries are excluded from being checked to allow
> the installation of the perf tests.
> 
> Fixes: 6fcdaa4c5096 ("package/linux-tools: Allow installation of perf scripts")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks for the patch! Before merging it, I'd like to understand a
little bit more how readelf behaves for these PE files. Indeed in
check-bin-arch, we are doing:

        arch=$(LC_ALL=C ${readelf} -h "${TARGET_DIR}/${f}" 2>&1 | \
                       sed -r -e '/^  Machine: +(.+)/!d; s//\1/;' | head -1)

        # If no architecture found, assume it was not an ELF file
        if test "${arch}" = "" ; then
                continue
        fi

for a PE file, I would expect readelf to badly fail, and therefore
${arch} to be empty, and the file simply ignored.

What is the behavior/output of readelf on these PE files?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
