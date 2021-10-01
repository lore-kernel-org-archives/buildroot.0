Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07EAC433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 17:53:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8486115A
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 17:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A8486115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CD2984543;
	Fri,  1 Oct 2021 17:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2GxJ4EK-c6W; Fri,  1 Oct 2021 17:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F8284560;
	Fri,  1 Oct 2021 17:53:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C3031BF47E
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 17:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A51561510
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 17:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=broadcom.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_9SDSm1_FZY for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 17:53:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5FA6614FD
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 17:53:32 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id x8so6791014plv.8
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9ILTrjdiW2NxNkHwt9o42QNqvTZ+OLCFugVmENpiHKQ=;
 b=HPB1NpJapJf88NmTf5O18fE9RNmau2FwXdRo0PKPrU6zPY4sCqfDlgb1NulH/fyKPr
 voWqgaYOJYjG1zDlz3l+MoVXUE8LxLWPsTgq4Vx1UD20fZTmiDIZWg0IQVX3dnx9vyEx
 nW7I0eIHjwE9mkPavaKs43m9IuNz95nKlCaHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9ILTrjdiW2NxNkHwt9o42QNqvTZ+OLCFugVmENpiHKQ=;
 b=yOGqfCIZRYdb5o6rZs67l2wdh8xbCei94tle8Z6AwfqziI0+jYTBZ3WU06kToGqIRl
 Y6y1MbZfHWw8fUznCvTVilczBiUJEt39XeK0tb2Ncf8aj8R4Yj6Ie1SEo6TG+p/XMU8Z
 TSqIb/1Dpm3O3ONsXhbWCCY29idq2XmI58Sb8qslZhubCsDksPRauZPTXtQQgASXd1J6
 v3az+hRo5kFT3NNnYP4BsKuz4btHUfY1HR2FI6v5VGECUrngpho60ZgLjWITsFUl2w2X
 8fbU6CxvXI+BlCDhypVtHnsidQkCP0LEXNFJWkkd1oWciewOqo3jEa4Pd3LlU6y4J7fF
 4wgg==
X-Gm-Message-State: AOAM531p/WOBc7+KKjSy28Absy522qgXhLEmTU5PwMm7gGCenJZPhEQy
 jmbnwrlR3J6+YiYDvlMwOxQj4fG7RRg/hffy
X-Google-Smtp-Source: ABdhPJwB8HF+ktHZyuG8+yJ7DukZij4rV7si6SylGOofThIUopIJ0BNPvnj+HFYD5IHYSDqjFIcExQ==
X-Received: by 2002:a17:902:8209:b0:13e:3408:43ba with SMTP id
 x9-20020a170902820900b0013e340843bamr10681960pln.66.1633110812039; 
 Fri, 01 Oct 2021 10:53:32 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id o2sm8153630pja.7.2021.10.01.10.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:53:31 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id E99662A17C5B; Fri,  1 Oct 2021 10:53:29 -0700 (PDT)
Date: Fri, 1 Oct 2021 10:53:29 -0700
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20211001175329.GA1973888@lbrmn-mmayer.ric.broadcom.net>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
 <a87c586e-1e73-a3e3-7722-c56e48809d76@mind.be>
 <YVTIghzHs82uFBIe@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YVTIghzHs82uFBIe@pevik>
Subject: Re: [Buildroot] [PATCH 0/1] Build issue related to "command -v"
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: David Laight <David.Laight@aculab.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Petr, Arnout, all,

Thanks for all the feedback and for looking into this issue.

On Wed, Sep 29, 2021 at 10:11:46PM +0200, Petr Vorel wrote:
> Hi Markus, Arnout, all,
> 
> >  Hi Markus,
> 
> >  Thank you for this extensive investigation!

You are welcome. It was an interesting one as you can probably
imagine. :-)
 
> > On 28/09/2021 21:55, Markus Mayer wrote:
> 
> > > After commit ca6a2907c27c[1], our automated nightly builds
> > > started experiencing build failures. It took a little while to
> > > track down what was happening. I think I understand now what is
> > > going on.
> 
> > [snip]
> 
> > > One thing of note is that our post-build script calls "make
> > > legal-info", and that is when the problem happens. The purpose
> > > of doing it like this is to include the result of "make
> > > legal-info" in the image.
> 
> > Calling into Buildroot's Makefile recursively from within a
> > post-build script (or a package or whatever) is not something that
> > is supported, in the sense that it's not something that anybody
> > ever tests. The use case definitely makes sense though. I even
> > heard of people starting the build of a different configuration in
> > a post-build script (e.g. for an initramfs).
> 
> > So maybe we should add a test in support/testing that validates
> > this scenario.
> +1

Sounds good to me, as well. It does seem to be quite useful to support
this scenario.

> > > However, when make is invoked a second time with HOSTCC already
> > > defined to call ccache, it'll still assign
> > >     HOSTCC_NOCCACHE := $(HOSTCC)
> > > which now redefines HOSTCC_NOCCACHE to *INCLUDE* ccache (since
> > > HOSTCC does, from earlier)!
> 
> > This is clearly wrong. Your patch helps, but we still have a
> > similar situation with HOSTCC which will be .../ccache .../ccache
> > /usr/bin/gcc in the recursive invocation (i.e. with two times
> > ccache). Although maybe that's not really an issue - "ccache
> > ccache gcc -v" at least gives the expected results.
> Ah, sorry for not catching this.
> 
> > I'm thinking that maybe we should detect recursive invocation in
> > the top-level Makefile and behave differently. For example,
> > everything that is exported doesn't need to be exported again, and
> > stuff like that. Or at least we could protect the entire HOSTCC
> > etc. block against recursive override.
> +1

Definitely no objections from me. I'll defer to those more
knowledgeable about Makefile Magic to make the call what else might
need protection.
 
> > Also, the entire handling of HOSTCC is a bit flaky. It is still
> > from prehistoric commit 8027784 with no clear requirements (e.g. 
> > is HOSTCC allowed to be a command with arguments?  Is it allowed to
> > be a relative path?). It has been documented after-the-fact in
> > docs/manual/common-usage.txt, but I wonder if we really still need
> > it?  I guess it's a way for people to use a host compiler that is
> > more recent that the distro-provided one, but it could just as well
> > be added to $PATH and be done with it...

I think having a documented way of specifying a custom host compiler
(without "poisoning" the environment or being forced to use wrapper
scripts) is a handy thing to have.

Also, one thing you cannot do using PATH is specifying a different
compiler *name*. You can make it search different directories (such as
/opt/toolchains/gcc-x.y/bin or similar), but you can't make it look for
something other than gcc (or cc) or whatever compiler name is
hard-coded into the makefile. If you have HOSTCC, you can name the
actual compiler binary.

Somebody might just be willing to really live on the edge to try out
clang as host compiler. :-)

BTW, we are experimenting with clang as target compiler, but that is a
story for another day.
 
> > [snip]
> 
> > > Here is where it gets interesting. "which" will return two
> > > lines, one for each of the commands:
> 
> > > $ which $HOSTCC_NOCCACHE
> > > /local/users/mmayer/buildroot/output/arm64/host/bin/ccache
> > > /usr/bin/gcc
> 
> >  As mentioned by Nicolas, we really should quote the argument to
> > "command -v", or apply $(firstword ...) to avoid this issue. 
> > Indepedent of which or command -v.
> +1 
> IMHO quoting would require fixing unwanted redefinition
> HOSTCC_NOCCACHE, ($(firstword ...) would not but hide the issue, thus
> I'd prefer fixing the redefinition.

Personally, I like the $(firstword ...) idea.
 
> > [snip]
> 
> > > As such, relying on "command -v" seems a little risky in that it
> > > opens up the possibility for strange build errors that others
> > > cannot reproduce and that nobody would ever think to investigate
> > > as being related to the "command -v" implementation of a specific
> > > shell.
> 
> > It is solving an actual problem (i.e. that "which" is deprecated
> > in some distros), so the best we can do is make the change early
> > enough before a release so people can discover problems with it.

Fair enough. And with all the suggestions in this thread, it is looking
like it can be done safely and without causing nasty surprises down the
road. I think it's fine to proceed with "command -v" in lieu of "which".
 
> > > There is also the issue of some developers working with different
> > > distributions. Somebody developing a feature on distro 1 might
> > > create build problems for others using distro 2 and vice versa. 
> > > Neither would have a way of knowing ahead of time that there will
> > > be an issue.
> 
> > That issue exists regardless of "which" (which BTW has different
> > implementations on different distros anyway, so it can also cause
> > problems).

Good point.

> +1 FYI there is LTP script to cover some which functionality [1]. 
> IMHO type or command -v are more tested in shell implementation than
> this simple test.
> > We try to minimise the external dependencies of Buildroot, and
> > removing "which" from the external dependencies is a good thing
> > IMHO.
> > Bottom line: I think we need to take four actions here.
> 
> > 1. Apply your patch.
> > 2. Improve on it by detecting that the Buildroot overrides have
> > already been exported and don't need to be exported again.
> > 3. Verify all calls to "command -v" and make sure the argument is
> > either quoted or uses $(firstword).
> > 4. Consider the removal of HOSTCC and friends as user-settable
> > variables.

Definitely +1 on points 1-3. I am a little wary about 4 as mentioned
above. While most use cases it be addressed using PATH, it does seem
to be a bit of a heavy-handed approach to tweak a system-wide variable.
And you won't be able to set the compiler name that way.

Regards,
-Markus

> [1] https://github.com/linux-test-project/ltp/blob/master/testcases/commands/which/which01.sh
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
