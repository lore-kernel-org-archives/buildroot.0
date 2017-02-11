From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Feb 2017 23:21:51 +0100
Subject: [Buildroot] [PATCH 3/6] support/test-pkg: report number and
 types of failures
In-Reply-To: <CAAXf6LW6WkZx=KZTTVt9vSuq7kChPfa2sXMhYAPYh2MN53cwgw@mail.gmail.com>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <dcd8080c616142b0f7f761e3749c92306b2f6863.1486584734.git.yann.morin.1998@free.fr>
 <20170209225946.54b9b744@free-electrons.com>
 <CAAXf6LW6WkZx=KZTTVt9vSuq7kChPfa2sXMhYAPYh2MN53cwgw@mail.gmail.com>
Message-ID: <20170211222151.GD20146@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2017-02-11 20:48 +0100, Thomas De Schampheleire spake thusly:
> On Thu, Feb 9, 2017 at 10:59 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >
> > On Wed,  8 Feb 2017 21:15:26 +0100, Yann E. MORIN wrote:
> >
> >> +    if [ ${nb_dl} -ne 0 ]; then
> >> +        printf "%d configurations could not be downloaded\n" ${nb_dl}
> >> +    fi
> >> +    if [ ${nb_cfg} -ne 0 ]; then
> >> +        printf "%d configurations could not be applied\n" ${nb_cfg}
> >> +    fi
> >> +    if [ ${nb_skip} -ne 0 ]; then
> >> +        printf "%d configurations were skipped\n" ${nb_skip}
> >> +    fi
> >> +    if [ ${nb_clean} -ne 0 ]; then
> >> +        printf "%d configurations could not be dircleaned\n" ${nb_clean}
> >> +    fi
> >> +    if [ ${nb_build} -ne 0 ]; then
> >> +        printf "%d configurations would not build\n" ${nb_build}
> >> +    fi
> >
> > This is really verbose and not very useful. Instead what would be much
> > more useful is just:
> >
> >         successes = %d, failures = %d, skipped = %d
> >
> > (possibly presented in a different way, my point is really that number
> > of successes, number of failures and numbers of skipped configurations
> > is really all what matters)
> >
> 
> I agree with Thomas here. Especially because a failure in download,
> olddefconfig and dirclean steps is exceptional. Most failures will be
> due to build problems or to a lesser extent invalid cofigurations
> (either completely invalid == developer error in providing the
> snippet, or invalid in some toolchains only).
> Since the amount of toolchains that will be checked is limited, it is
> not a lot of work to scroll up to view the actual problems.

I already fixed it as per Thomas P. suggestion. It will be in the next
re-spin (tomorrow).

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
