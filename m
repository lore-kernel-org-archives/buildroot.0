Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D43FC4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 08:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0132416AB;
	Mon, 11 Dec 2023 08:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0132416AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1Fzn0XbVZXJ; Mon, 11 Dec 2023 08:51:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5EB416B0;
	Mon, 11 Dec 2023 08:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE5EB416B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63CF11BF3DD
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B689400EF
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B689400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tA-lLId8S8Cm for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 08:51:35 +0000 (UTC)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9791E40146
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9791E40146
X-QQ-mid: bizesmtp78t1702284688tbabm9ho
Received: from localhost.localdomain ( [116.30.124.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 11 Dec 2023 16:51:27 +0800 (CST)
X-QQ-SSF: 01200000000000E0Y000000B0000000
X-QQ-FEAT: LE7C6P2vL8RQYSUcwjNYc3bXFrNosd6ozgWh3OhJenaLUIvHX+bDYC0n1sytE
 ZjI8uOOHQzZjlJn9ZmjSG5ZDc6O0hPgVx07x/h6/uSHJiOB1Hx4Onz2vIL4aX5lN2zd6gfA
 IeghVPaAiqstwC2Gbv4Agnn6SrIslI/WTAWTGm2p+Q+NqQ8GzjLwj07SNWMyCBis/Tbaj75
 8tl3tH6FK7kz9C50eKT94djQxEI4fIklYuwaytvq3U6g/IAe44zzLjWEN38jEjnGzgaeoFz
 YYQ4T9tmUesw0/YAONiwfrJYyhI1lDOUedcMDMFPvo+kjH3WCDfaTYr/8NgFOmaSoMG1mCk
 qR7pKUGRC/o29VPZF3pzFijUQJbCkWGj4ox52Y8
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13288035735760165302
From: Zhangjin Wu <falcon@tinylab.org>
To: yann.morin.1998@free.fr
Date: Mon, 11 Dec 2023 16:51:26 +0800
Message-Id: <20231211085126.31657-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZXWeWoawTYeyYbOx@landeda>
References: <ZXWeWoawTYeyYbOx@landeda>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
Subject: Re: [Buildroot] [PATCH 1/1] package/mpfr: Fix GNU Mirror Path
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
Cc: falcon@tinylab.org, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Zhangjin Wu, All,
> 
> On 2023-12-10 09:36 +0800, Zhangjin Wu spake thusly:
> > > On 2023-12-10 00:21 +0800, Zhangjin Wu spake thusly:
> > > > Replacing http://www.mpfr.org with BR2_GNU_MIRROR variable
> [--SNIP--]
> > > What is the rationale for switching over to the GNU mirror rather than
> > > use the official upstream location?
> > I have found that the downloading of mpfr from its official site is very
> > slow in our region, sometimes, costs several hours and even fails at
> > last. But the downloading from one of its local GNU mirror sites is fast
> > and deterministic.
> > And I have checked that the latest version of mpfr has been stored in
> > the GNU mirror site too:
> > http://ftpmirror.gnu.org/mpfr-4.2.1.tar.xz
> 
>     $ wget http://ftpmirror.gnu.org/mpfr-4.2.1.tar.xz
>     HTTP request sent, awaiting response... 404 Not Found
>     2023-12-10 11:54:02 ERROR 404: Not Found.
> 
> (it's missing the /mpfr/ directory component in the path ;-) ).
>

Yeah, /mpfr/ is missing (but it is there for the patch, my typo issue), thanks ;-)

> > So, it should be reasonable and safe for us to do such switch ;-)
> 
> The thing is, we can't really switch away from the official site, just
> because it is slow for some people, as the alternative might be the
> other way around for others: for me, the GNU mirror is ~8 times slower
> than the official MPFR site: 8.80MBps vs 1.06MBps (mpfr is small, so
> that's not much consequential, but that's on principle).
>

For the speed issue above, perhaps the automatic selection of
http://ftpmirror.gnu.org didn't provide the best mirror instance or the select
logic itself costed some time, what about manually choose one from the
following list or another one even not in this list?

    https://www.gnu.org/prep/ftp.html

Of course, it still depends on the service quanlity of the local mirror site.

As you suggested, it is better to use the official site of a target package, I
understand the advantage, but to be honest, I'm still curious about that is it
possible to benefit from the GNU mirror variable for the packages that have
already been 'released' in the GNU mirror sites, mpfr is only one of such
packages, and for better availability with enough tolerance (some of the
official sites may down sometimes) and balanced average download speed (there
should be at least one mirror site there with a not that bad speed), the GNU
mirror like services may be a download candidate for such packages.

The only issue here may be how to guarantee the GNU mirror *always* store such
packages, keep update, or at least make sure the storing policy is long-term, I
didn't find any official document about this yet.

> So, I think you would have a few (complementary) options:
> 
>   - keep a local cache of your download directory: if BR2_DL_DIR is set
>     in the environment, then Buildroot will use that directory to look
>     for, and store, downloaded archives. That directory is never removed
>     by Buildroot (unless it is the default value of $(TOPDIR)/dl);
> 
>   - similar to the above, populate a directory on a machine in your
>     local network, serve that directory with an HTTP(S) server, and
>     point BR2_PRIMARY_SITE to that location;
> 
>   - change BR2_WGET to include one of the wget timeout options (see the
>     wget manual for the details): --timeout=seconds --dns-timeout=seconds
>     --connect-timeout=seconds --read-timeout=seconds. In your case, maybe
>     --read-timeout with a small-ish number of seconds would be enough to
>     trigger a failed download, and Buildroot will fallback to
>     downloading from BR2_BACKUP_SITE.
>

Thanks very much, dl/, BR2_PRIMARY_SITE and BR2_BACKUP_SITE are good solutions,
but all of them require further work locally. It is possible to build some
other mirror sites for dl/, but the GNU mirror sites have been there for many
years, perhaps we can let them work as a fallback (like BR2_BACKUP_SITE)?
 
> I know that the above might not be entirely satisfactory, but we really
> prefer to get the sources from the official location, unless there is a
> very strong reason not to. In this case, I don't think it is
> appropriate, especially since Buildroot has mechanisms in place to cope
> with such situations already.
>

Get it, thanks.

Best regards,
Zhangjin Wu
 
> Regards,
> Yann E. MORIN.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
