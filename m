From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Dec 2017 16:23:44 +0100
Subject: [Buildroot] [PATCH 8/8] gitlab-ci: run check-package
In-Reply-To: <20171201105453.2d415b5a@windsurf.lan>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <b9a9596c19817cf5a70c17acaa23657ed3597f01.1511996903.git.yann.morin.1998@free.fr>
 <20171130085950.0dc9a144@windsurf.home>
 <20171130153458.GA3519@scaer>
 <20171201105453.2d415b5a@windsurf.lan>
Message-ID: <20171201152344.GB2885@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-01 10:54 +0100, Thomas Petazzoni spake thusly:
> On Thu, 30 Nov 2017 16:34:58 +0100, Yann E. MORIN wrote:
> > On 2017-11-30 08:59 +0100, Thomas Petazzoni spake thusly:
> > > On Thu, 30 Nov 2017 00:08:45 +0100, Yann E. MORIN wrote:  
> > > > +check-package:
> > > > +    script:
> > > > +        - find . -type f -name '*.mk' -exec ./utils/check-package {} +  
> > > 
> > > Does it run without warning on all .mk files?  
[--SNIP--]
> > So I would at least limit it to Config.in, .mk, .hash, .patch files.
> > And even that generates 305+566+230 = 1101 warnings.
> 
> That's indeed a lot. In addition, I want the thing to "fail" if there
> are some warnings, otherwise Gitlab CI will not report the job as
> failed.

Agreed.

> So, let's do this:
> 
>  1. Fix check-package to avoid the false warning on asterisk

Waiting for Ricardo's change to trickle in. Ricardo, can you send an
official patch, please?

>  2. Add the Gitlab CI job testing only .mk files, but making sure that
>     if there is a single warning, it returns with a non-zero error code
>     so that the job is considered as failed if we have a warning

Then this series is ready as it is, minus the comment in asterisk.mk.

>  3. Over time, fix warnings in Config.in and .hash files, until the
>     point where we can enable checking them in Gitlab CI as well.

Agreed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
