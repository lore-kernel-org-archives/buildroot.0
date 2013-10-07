From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 07 Oct 2013 21:46:28 +0200
Subject: [Buildroot] [PATCH] pkg-infra: log current message
In-Reply-To: <20131007164829.GB9561@free.fr>
References: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
 <20131007140733.173904b6@skate> <20131007164829.GB9561@free.fr>
Message-ID: <3623578.UApTusJAiV@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 07 October 2013 18:48:29 Yann E. MORIN wrote:
> Thomas, J?r?me, All,
> 
> On 2013-10-07 14:07 +0200, Thomas Petazzoni spake thusly:
> > Dear J?r?me Pouiller,
> > 
> > On Mon, 07 Oct 2013 12:09:50 +0200, J?r?me Pouiller wrote:
> > > I have also in my local git some branches modified in a similar
> > > fashion. Some weeks ago, Francois Perrad also suggested a patch
> > > with a similar modification
> > > (http://patchwork.ozlabs.org/patch/265214). Thomas also wrote a
> > > patch to get build time statistics
> > > (http://lists.busybox.net/pipermail/buildroot/2011-October/046513.
> > > html).
> > > 
> > > IMHO, these patchs are too much specific and should not be
> > > mainlined.
> > 
> > I am not sure I agree here. The fact that several of us have such
> > patches, and that they would indeed be useful to produce build time
> > statistics, or help the autobuilders provide better diagnostics
> > could
> > be useful. I believe that it's the real strength of the common
> > package infrastructure: we can add such additional features on all
> > packages at once, very easily. Of course, it should be implemented
> > in a nice and clean way that doesn't complexity too much the core
> > package
> > infrastructure, but it's very likely easy to achieve with some
> > hooks.
> 
> What about adding a new Kconfig option like:
> 
>     config BR2_BUILD_INFRA_STEP_SCRIPT
>         bool "script to run before and after each step"
>         help
>           Buildroot will call this script before executing any single
>           step in the build process. The arguments to this script are:
> $1: either "pre" or "post", resp. meaning "before" or "after" the
> step
>               $2: name of the package
>               $3: version of the package
Let's try to find a way to pass all VARIABLE relative to the package 
(version, dependencies, url, buildir, etc...). We may also want to pass 
TARGETDIR, HOSTDIR, etc... I thought to pass them using environment.

Else, it's good for me.

>               $4: action to be done
> 
>           Leave empty (the default) to not run any script.
> 
> It would then be the responsibility of the user to provide such a
> script. We could provide a simple script that just do this logging as
> an example.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
