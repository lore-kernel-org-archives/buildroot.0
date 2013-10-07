From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Oct 2013 18:59:56 +0200
Subject: [Buildroot] [PATCH] pkg-infra: log current message
In-Reply-To: <20131007164829.GB9561@free.fr>
References: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
 <30033387.d25L1SpIx8@sagittae> <20131007140733.173904b6@skate>
 <20131007164829.GB9561@free.fr>
Message-ID: <20131007165956.GE9561@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-10-07 18:48 +0200, Yann E. MORIN spake thusly:
> Thomas, J?r?me, All,
> 
> On 2013-10-07 14:07 +0200, Thomas Petazzoni spake thusly:
> > Dear J?r?me Pouiller,
> > 
> > On Mon, 07 Oct 2013 12:09:50 +0200, J?r?me Pouiller wrote:
> > 
> > > I have also in my local git some branches modified in a similar fashion. 
> > > Some weeks ago, Francois Perrad also suggested a patch with a similar 
> > > modification (http://patchwork.ozlabs.org/patch/265214). Thomas also 
> > > wrote a patch to get build time statistics   
> > > (http://lists.busybox.net/pipermail/buildroot/2011-October/046513.html). 
> > > 
> > > IMHO, these patchs are too much specific and should not be mainlined. 
> > 
> > I am not sure I agree here. The fact that several of us have such
> > patches, and that they would indeed be useful to produce build time
> > statistics, or help the autobuilders provide better diagnostics could
> > be useful. I believe that it's the real strength of the common package
> > infrastructure: we can add such additional features on all packages at
> > once, very easily. Of course, it should be implemented in a nice and
> > clean way that doesn't complexity too much the core package
> > infrastructure, but it's very likely easy to achieve with some hooks.
> 
> What about adding a new Kconfig option like:
> 
>     config BR2_BUILD_INFRA_STEP_SCRIPT
>         bool "script to run before and after each step"
>         help
>           Buildroot will call this script before executing any single
>           step in the build process. The arguments to this script are:
>               $1: either "pre" or "post", resp. meaning "before" or
>                   "after" the step
>               $2: name of the package
>               $3: version of the package
>               $4: action to be done
> 
>           Leave empty (the default) to not run any script.
> 
> It would then be the responsibility of the user to provide such a
> script. We could provide a simple script that just do this logging as an
> example.

I have another interesting idea about such a script: detect whether a
package overwrites or otherwise modifies a file already existing in
staging/ and/or target/ to assess for the sanity of the packaging.

We could also add another sanity-check to look at build issues (eg.
build-path in RPATH, build-path in scripts...).

Another not-so-much-interesting, wild idea is that this *could* be used
to prepare binary packages by looking at the list of files added by a
package, and creating an archive of just those files.

Really, I believe one could do such nice or nasty things with this! :-)
But that's no reason not to include it, mind you!. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
