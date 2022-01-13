Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0AEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 423824010C;
	Thu, 13 Jan 2022 21:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uoMeHVmNPjwp; Thu, 13 Jan 2022 21:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AC7540A6D;
	Thu, 13 Jan 2022 21:58:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98F041BF616
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 871F5415A1
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rnA_5DE2VJv for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:58:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E0E841572
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:58:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:84d2:7b0:3327:1b6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0E47019F574;
 Thu, 13 Jan 2022 22:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642111093;
 bh=4zu/bJk4w0LCrNUcEcBOpqyzjdxERLo7tczRVbc6HoI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qh/GmchHQ9D5KGl8XaByFxC/H15dK09CLd+NmzuOZDGdNL5Vh640dNxhKtydQveM7
 3QK9fzqmjtbam4wEG4lgu9lCIF1wmHt4rbJMJVxa3+Hp+dEnaMXmSlln0/vC0mnLOk
 Ux/koUk0lbI8ormEe2qnu8WNLogLoF+xxHUkEHjdeoGkGNdGeNuGWgZGtExOHG2e+o
 egwWc7L6QlGdYRKiRevkh3TiHxpDkkXNA2cV9ruTzf6maRxZgvKJTfkPHwxZNA3Z5o
 YnT8MrQr+/u6c4iWIOFodHk0gVgw0V43/rmlFlkOekr4n0X4huyel1/tpJZKLBh6z7
 4qqzBMJ/yw4OQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 13 Jan 2022 22:58:05 +0100
Date: Thu, 13 Jan 2022 22:58:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220113215805.GM1477939@scaer>
References: <cover.1641663315.git.yann.morin.1998@free.fr>
 <91348c3073b0dcf57a8ea3227bae74c23a122713.1641663315.git.yann.morin.1998@free.fr>
 <e0fb6796-834f-f23f-a388-37c35b59ec99@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0fb6796-834f-f23f-a388-37c35b59ec99@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/3] core/pkg-generic: fixup all PPD paths
 in a generic fashion
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
Cc: Andreas Naumann <anaumann@ultratronik.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Louis-Paul CORDIER <lpdev@cordier.org>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-01-12 21:42 +0100, Arnout Vandecappelle spake thusly:
> On 08/01/2022 18:35, Yann E. MORIN wrote:
> >Some files contain hard-coded absolute paths that point to the host
> >and/or staging directories.
> >
> >With per-package directories (aka. PPD), these paths point to the PPD
> >of the package that created the files, when we want them to point to the
> >PPD of the package that uses them.
[--SNIP--]
> >+define PPD_FIXUP_PATHS
> >+	$(Q)grep -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \
>  This will trawl to large binary files and potentially take a long time...

I too thought of that, and I even discussed it slightly with Peter K.
here about what would be most efficient: grep-then-file, or file-then-grep?

But if we add --binary-files=without-match to grep, then it will
bail-out early on binary files, which would be more efficient. And then
we still pass that through file to really get only text files.

But a text-file with utf8 is really a binary file, so would grep ignore
it?

> >+	|while read -d '' f; do \
> >+		file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
> ... just to be ignored here.

Again, not sure, because text/plain but utf8-encoded?

>  More importantly though: if a file is a symlink, it's going to be hit
> twice.

No, I don't think so:

    $ man grep
    [..]
    -r, --recursive
        Read all files under each directory, recursively, following
        symbolic links only if they are on the command line. [...]

And that seems to be the case:

    $ echo Pouet >foo
    $ ln -s foo bar
    $ grep -r Pouet .
    foo:Pouet

So, seems OK to me?

> Worse, if it's a symlink to an absolute path (which most likely
> points *outside* of STAGING_DIR), we may end up sed'ing something on the
> host...
>  I notice now that the same (theoretical) issue exists in relocate-sdk.sh.
> Obviously that script doesn't get thoroughly tested so it may very well be
> the wrong thing to do...
> 
>  Do you remember perhaps why we don't simply do
> 
> find $(HOST_DIR) -type f -print0 \

Maybe we should. But grep -r was an elegant way to combine the recursive
feature of find, and limit to the matching files at the same time...

I can try to time things to see what's the fastest / less-slow... But
given that the symlinks are not an issue in practice, so we care?

> ? I was going to say that we can skip the grep, but then we're back at the
> large (text) file thing.
> 
> >+		printf '%s\0' "$${f}"; \
> 
>  Why not do the sed right here, like is done in relocate-sdk.sh? In fact,
> I'd keep the code as close as possible to relocate-sdk.sh to make later
> refactoring easier.

Using xarg allows to spawn only a few sed. printf is a shell built-in so
it's basically free.

[--SNIP--]
> >  define FIXUP_PYTHON_SYSCONFIGDATA
>  Maybe rename to REMOVE_PYTHON_SYSCONFIGATA_PYC

OK

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
