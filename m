Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E777C83F14
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 10:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B08A60803;
	Tue, 29 Aug 2023 10:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B08A60803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sw26wVT9nS9D; Tue, 29 Aug 2023 10:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0528607C0;
	Tue, 29 Aug 2023 10:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0528607C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3BB1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 10:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 649A340912
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 10:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 649A340912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DyE9swhqy-1N for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 10:30:27 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFF21404A0
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 10:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFF21404A0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:12c4:970b:7d89:ea5e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4E0555FFDA;
 Tue, 29 Aug 2023 12:30:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 12:30:19 +0200
Date: Tue, 29 Aug 2023 12:30:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230829103019.GA3579@scaer>
References: <ad574a2a-a776-d7e5-8dcb-f3693d222558@carnegierobotics.com>
 <20230828224540.61f54e95@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230828224540.61f54e95@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693305023;
 bh=zQo8UyKjorkWUsOEeX2uD2mKzcxVDbOCBwITEmYmGGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WwOc29h2VOy0h7sdHJQRPC0NGWIgy87oWQEFYUVR12LdwgpddvMBLJI4Tyautz8Gp
 vQ4YbyNZ4dpi2rbdNDcHxmVWwPT28NKmWXQJj+vjxf/o8NEdc+FY7pmlzawAnOWeFy
 oXFbbWDc8bsXXLS5eW2O02kfjKvsYExRKZPBX4AurXKZWLR8TbSgrqSG+7mJFw1MDz
 aggtn++JjorKxeU4Zm2rXySbJOKcdAkXqcgukhH/Y438pjL1f3I65a0jZ5eRMCM3OB
 x64VG2CHZ3RCLgyl3u+TwJdJAFwR4P1IGE7+EvtWIiIOiNnC0EumKI1YtccpPGLKNW
 09BQNIttTJ+AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WwOc29h2
Subject: Re: [Buildroot] Github download helper possibly not working
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
Cc: Woody Douglass <wdouglass@carnegierobotics.com>,
 Woody Douglass via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Woody, All,

On 2023-08-28 22:45 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Mon, 28 Aug 2023 20:02:34 +0000
> Woody Douglass via buildroot <buildroot@buildroot.org> wrote:
> > I've noticed that packages that use the `github` download helper are 
> > falling over to buildroot mirrors. I've tried with packages `yaml-cpp`, 
> > `zlog`, `swupdate`, and `pcm-tools` -- all are redirected before 
> > eventually getting a 403 from codeload.github.com and falling back to 
> > sources.buildroot.net. Is anyone else seeing this behavior? I'm trying 
> > to find a workaround now, but I'd appreciate any help!
> It works fine here:

Works fine here too.

[--SNIP--]
> However, for pcm-tools, we do have a problem (though not the one you
> mentioned):
> $ make pcm-tools-source
[--SNIP--]
> ERROR: pcm-tools-202110.tar.gz has wrong sha256 hash:
> ERROR: expected: aa48ab1473720aeb7837b67bfc612100f484748720a8b8034daff00419709057
> ERROR: got     : 90a5931cea24f1b0da76e22c712e55375df157e87f26edaa70b9660405852725
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack

I also have this issue, and indeed the cntent changed; here's the diff:

    diff -durN pcm-202110.old/version.h pcm-202110.new/version.h
    --- pcm-202110.old/version.h    2021-10-25 16:07:54.000000000 +0200
    +++ pcm-202110.new/version.h    2021-10-25 16:07:54.000000000 +0200
    @@ -1 +1 @@
    -#define PCM_VERSION " (2021-10-25 16:07:54 +0200 ID=93fc9193)"
    +#define PCM_VERSION " (2021-10-25 16:07:54 +0200 ID=93fc919)"

That's all: a delta in the length of the short hash.

So, what does version.h looks like in git (at the tag):

    $ cat version.h
    #define PCM_VERSION " ($Format:%ci ID=%h$)"

OK, does that ring a bell? Yes, that's the same thing that we solved for
subversion in c92be85e3a29 (support/download: make the svn backend more
reproducible):

    $ man 5 gitattributes
       Creating an archive
         export-subst
           If the attribute export-subst is set for a file then Git
           will expand several placeholders when adding this file to
           an archive. The expansion depends on the availability of
           a commit ID, i.e., if git-archive(1) has been given a tree
           instead of a commit or a tag then no replacement will be
           done. The placeholders are the same as those for the option
           --pretty=format: of git-log(1), except that they need to be
           wrapped like this: $Format:PLACEHOLDERS$ in the file. E.g.
           the string $Format:%H$ will be replaced by the commit hash.

This is something that is then done when the archive is generated, i.e.
on the github side. So, Github again changed the way they generate their
archives, except this is a very sneaky change.

So, for pcm-tools, the only solution we have is to drop use of the
github helper and switch over to a git download...

Long term, I am still of the opinion that we should no longer, ever,
rely on the remote to generate the archive, and we should always do
that localy, even at the cost of download bandwidth, because we too
often have similar issues, and this one is indeed very, very sneaky, and
there is nothing that prevents a remote to change their archive
generation on a whim (Github never guaranteed stability for those
autogenerated archives to begin with...)

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
