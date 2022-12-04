Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060D2C4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 14:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C3C440490;
	Sun,  4 Dec 2022 14:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C3C440490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLARMmdmYwRm; Sun,  4 Dec 2022 14:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A812B400C4;
	Sun,  4 Dec 2022 14:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A812B400C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 492421BF3A6
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DE6D607F5
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DE6D607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyQsDyYDdOLP for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 14:05:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E62D60768
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E62D60768
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 14:05:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d16b:268a:13f6:6145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 84D2719F55C;
 Sun,  4 Dec 2022 15:05:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Dec 2022 15:05:33 +0100
Date: Sun, 4 Dec 2022 15:05:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20221204140533.GO3302@scaer>
References: <38529777-79a9-dfb5-ec42-b7c37e617281@gmail.com>
 <20221203155247.428cb5a1@windsurf> <20221203160506.GD3302@scaer>
 <af070396-0597-e1c6-dc6c-956c5453badf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af070396-0597-e1c6-dc6c-956c5453badf@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670162736;
 bh=26dJKF0+odK5OP71ZQVewqnpPYEbXXD4LhxCQzD3knQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oqmiyLgto6prvFTy540HuSmG5NAnCo0t1gJnQrOVaQ9GEjKb1Y4YWaMWmoN+hpnuk
 wqsH2/W3UEB0S29TtYZlcIcJiAc9FpVlNpzkpMaNPkyZKNLSjydQFXtFRWEB2RzFe8
 Jg1RMQSSklAlN7afYG6/0WyWPy4dcTefYCC+GGvQJ1fCf19vlwCTexqQwy8ZMD5gTS
 DwI6XppRVznfH+kEI1iiYYeSV1Xk+fALFTaQb+FYCqHWr1K688xu+As7kuo2Cv7yjQ
 A+das+jLIw6ShQ87uzn04x8w7ne8IEfwBcm7ALWoKrCD4cUiKMEh7pAe2uNMNFH85g
 EO1bKgUTGn3DQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oqmiyLgt
Subject: Re: [Buildroot] <PACKAGE>_SOURCE with <PACKAGE>_SITE_METHOD = git
 can result to tar.gz with mismatched file extension
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailman <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bagas, All,

On 2022-12-04 19:31 +0700, Bagas Sanjaya spake thusly:
> On 12/3/22 23:05, Yann E. MORIN wrote:
> >> I guess we have two options here:
> >>  (1) Detect this situation, and error out, to prevent this situation
> >>  from happening
> >>  (2) Actually support overriding _SOURCE, but in this case, we should
> >>  comply with the specified compression algorithm
[--SNIP--]
> > So, yes: detect and abort.
> Actually I think we can just do ``tar xvf`` since tar will automatically
> figure out the decompressor to use.

The issue is not so much about decompressing, than about compressing.

The download backends for VCS all expect to generate gzip-compressed
tarballs; see: support/download/git@231, support/download/svn@67,
support/download/cvs@70. For mercurial, it's even going deeper, as this
is ingrained in hg itself, and we rely on hg to generate the archive,
see support/download/hg@48..50 (it knows other compression formats, but
that may not align with the one we'd choose for the others).

The reason to request for a compression other than gzip is to achieve
one or more of:
  - decreasing the size of the generated archives;
  - decreasing the time needed to compress the archives;
  - decreasing the time needed to decompress the archives.

Aiming for those goals I believe only really makes sense globally, not
on a per-package basis.

If we were to go for a per-package support, we would need to convert all
our download backends anyway, and as I said previously, I don't think it
would be too cumbersome to migrate all the packages in one go at the
same time:
  - no cvs-hosted package;
  - a single svn-hosted package for which we have a hash: libxmlrpc (the
    other four have no hash);
  - two hg-hosted packages: dvb-apps, python-pygmes (the other three
    have no hash);
  - 112 git-hosted packages, so a bit more than 100 with a hash, and
    updating them can be easily scripted (that's what I did when we
    introduced the -br1 suffix for git).

Sure, we would also need to add that support to {go,cargo}-post-process,
but we do not have that many impacted packages either. However, for
those, I could well see a reason to have a per-package support, that we
shoved aside when introducing the download post-process: if we have to
download an unvendored archive that is not a tar.gz already, then we'd
have no way to represent that. But we assumed that all the packages that
would require vendoring would come from github or gitlab, they would all
be .tar.gz already, and that if we were to download a released archive,
it would already be vendored; this is turning to be actually the case
in practice: we only use archives from github/gitlab, so the point is
mostly academic.

So I still think we do not need support for different per-package
compression support, and that we shouldddetect the case that _SOURCE is
not set for a VCS-based download.

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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
