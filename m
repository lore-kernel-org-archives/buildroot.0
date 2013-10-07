From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Oct 2013 18:48:29 +0200
Subject: [Buildroot] [PATCH] pkg-infra: log current message
In-Reply-To: <20131007140733.173904b6@skate>
References: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
 <30033387.d25L1SpIx8@sagittae> <20131007140733.173904b6@skate>
Message-ID: <20131007164829.GB9561@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, J?r?me, All,

On 2013-10-07 14:07 +0200, Thomas Petazzoni spake thusly:
> Dear J?r?me Pouiller,
> 
> On Mon, 07 Oct 2013 12:09:50 +0200, J?r?me Pouiller wrote:
> 
> > I have also in my local git some branches modified in a similar fashion. 
> > Some weeks ago, Francois Perrad also suggested a patch with a similar 
> > modification (http://patchwork.ozlabs.org/patch/265214). Thomas also 
> > wrote a patch to get build time statistics   
> > (http://lists.busybox.net/pipermail/buildroot/2011-October/046513.html). 
> > 
> > IMHO, these patchs are too much specific and should not be mainlined. 
> 
> I am not sure I agree here. The fact that several of us have such
> patches, and that they would indeed be useful to produce build time
> statistics, or help the autobuilders provide better diagnostics could
> be useful. I believe that it's the real strength of the common package
> infrastructure: we can add such additional features on all packages at
> once, very easily. Of course, it should be implemented in a nice and
> clean way that doesn't complexity too much the core package
> infrastructure, but it's very likely easy to achieve with some hooks.

What about adding a new Kconfig option like:

    config BR2_BUILD_INFRA_STEP_SCRIPT
        bool "script to run before and after each step"
        help
          Buildroot will call this script before executing any single
          step in the build process. The arguments to this script are:
              $1: either "pre" or "post", resp. meaning "before" or
                  "after" the step
              $2: name of the package
              $3: version of the package
              $4: action to be done

          Leave empty (the default) to not run any script.

It would then be the responsibility of the user to provide such a
script. We could provide a simple script that just do this logging as an
example.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
