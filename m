Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973F9C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 09:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2802560F12
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 09:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2802560F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE95040286;
	Sat, 31 Jul 2021 09:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHEZckDvl_A0; Sat, 31 Jul 2021 09:19:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D275E4028F;
	Sat, 31 Jul 2021 09:19:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E11251BF2F3
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 09:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD766404CF
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 09:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4H3go6nia7bq for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 09:19:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC790404C8
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 09:19:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bd5f:2690:7a2e:30fd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E37A3780350;
 Sat, 31 Jul 2021 11:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627723149;
 bh=3LUmnKznkHm4YDDJkzIcKEGrY2RPNuvN9Fjlk0PXq6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D2We12+z99KrNvko64J+plWk7o5I9yEpb1CAyyteCWg6mJ9YKC3mlYNCvb8VYZ1R8
 yPBZACMQj8LBmfDQiOB66lgb2ZDUb3470IGpHQllwK8KUP+a6+LK95eWnDfxspJbii
 a9g+KSFEh869i5rrGMUWbP3+Q7L5PgrrgzVKRFU+JC2hgku+tDFeuh7TgqRuqUkB4X
 bmlyDXWo0iLIDlzv4XwAXHQ/P8ejRJQfZdXQC24tipaUsL60alz2IaHiFsiCKi0VU9
 ea9uD9xIq88MDy9ONkl0i2Rc/e3UcZ/XTeA0vTzCDbMPuyymBJ3qmua4dVQTNkCd6O
 mQd7M/dmsK/hQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Jul 2021 11:19:00 +0200
Date: Sat, 31 Jul 2021 11:19:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniil Stas <daniil.stas@posteo.net>
Message-ID: <20210731091900.GI3189549@scaer>
References: <20210725125746.1169974-1-daniil.stas@posteo.net>
 <20210726235821.58ea502b@windsurf>
 <20210729004347.15063008@ux550ve>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210729004347.15063008@ux550ve>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/htop: fix sources location
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Daniil, All,

On 2021-07-28 21:43 +0000, Daniil Stas spake thusly:
> On Mon, 26 Jul 2021 23:58:21 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > On Sun, 25 Jul 2021 12:57:46 +0000
> > Daniil Stas <daniil.stas@posteo.net> wrote:
> > > Change sources location from bintray to github since bintray doesn't
> > > work anymore.
> > > Use commit hash for version instead of git tag to avoid breaking
> > > existing source caches.
> I think the original htop-3.0.5.tar.gz was overwritten after Yann
> applied the first version of my patch. And looks like now it's removed
> from http://sources.buildroot.net/htop/.

Indeed, we finally understood why the original tarball was missing.

Thing is (which I was oblivious to), the caching process directly runs
on s.b.o, directly using the cache directory as BR2_DL_DIR.

So, when we download a file, and its hash is wrong, we ermove the file,
and continue the download to the next location (primary mirror, uptream
location, backup mirror).

However, in the s.b.o filling process, there is no backup mirror,
because we are the backup mirror already...

So, because the htop 3.0.5 archive had the wrong hash, it got removed.

And when I reverted the change, we had no other location where to grab
it from.

Thomas has now restored the archive on s.b.o:

    http://sources.buildroot.org/htop/htop-3.0.5.tar.gz

The CDN-backed s.b.n will eventually catch up...

Thanks for letting us now! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
