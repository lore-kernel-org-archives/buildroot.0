From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 19 Dec 2015 10:35:02 +0100
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable compile in thumb
 mode configuration option
In-Reply-To: <567480E6.20407@mind.be>
References: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
 <1450056520-18750-1-git-send-email-paul.enman@gmail.com>
 <20151215230351.5dc6e91d@free-electrons.com>
 <5671E0D0.3030002@mind.be>
 <CAEp4hJ1hwzskLYz1J--Y3Z7GfJnsLzSA=D6tFQO3jBMdQQAXqA@mail.gmail.com>
 <567480E6.20407@mind.be>
Message-ID: <20151219093502.GG19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

>  Hi Paul,
> 
>  [Please don't top-post, but reply inline like I do below.]
> 
> On 18-12-15 01:11, Paul Enman wrote:
> > Hi All,
> > Thanks for your feedback and insight. Buildroot does build a working Cortex-M
> > (thumb instructions only) uClibc toolchain by touching up the uClibc(-ng) config
> > file with
> > 
> > Enable COMPILE_IN_THUMB_MODE
> > and
> > Disable UCLIBC_HAS_CONTEXT_FUNCS
> > 
> > ARMv5 and thumb1 targets shouldn't be effected by this patch; I'll look into
> > guarding packages that depend on (obsolescent?) context control functions and
> > prepare an updated version for review.
> 
>  It will be quite hard to find such packages - especially longer term. There
> probably should be a thumb2 toolchain added to the autobuilders to cover this case.
> 
>  Also, finding a good explanation for the comment is going to be difficult...
> Something like "foo needs ARM instructions or a (e)glibc or musl toolchain".

Other architectures also have no support for context functions.
So a more general solution would be better. What packages use
context functions anyway?

best regards
 Waldemar
