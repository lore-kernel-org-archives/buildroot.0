From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun, 9 Sep 2018 14:44:24 +0100
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <20180909133341.GJ2841@scaer>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
 <20180909073616.GC2841@scaer> <20180909141037.69b16e95@windsurf.home>
 <CA+_SqVbJqv2On+9UPE4pcoyiK1wfDZp=t1h1yMdfVB-CQGp91g@mail.gmail.com>
 <20180909133341.GJ2841@scaer>
Message-ID: <CA+_SqVafj+DAsaBtSPJkf2bwbmh_3JojRjBrzG0oT6GduKTG4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,
On Sun, Sep 9, 2018 at 2:33 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Angelo, Thomas, All,
>
> On 2018-09-09 13:25 +0100, Angelo Compagnucci spake thusly:
> > On Sun, Sep 9, 2018 at 1:10 PM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> [--SNIP--]
> > Thomas said evrithing exceptionally well, but I would like to
> > underling another thing: automated building infrastructures like
> > continuos integration.
> >
> > If a project hasa nedd of reproducibility, the countinous integration
> > could check if a random developer introduced something not
> > reproducible and mark the build as invalid. I think this is really a
> > big plus of this solution.
>
> I do understand the concern, trust me, I do.
>
> What I am saying is that the solution you propose will not allow that,
> because there is no way to decide whether a specific .config is or is
> not reproducible, as per the examples I provided in the nodejs case.
>
> If a build is imprperly marked as tainted, then users will just
> disregard that information and never consult it, and just not use it in
> their automated buildsystemsd (jenkins, gitlab-ci, whatever). And even
> if they do have a job doing the check, that job can detect a change from
> "not tainted" to "tainted" because the job will always report "tainted".

My concern here is that you start from a reproducible build, add your
packages right and so maintain your build reproducible, buildroot will
work as before. As soon you use a package manager tainting will be
signaled.

Taint is mean to signal that there is a potential problem, and if you
don't want to slip into it, you can always do the right thing and
package your software and packaging also it's dependencies.

As soon as you do this, the taint disappear. I thin it could even be a
deterrent to package the software randomly!

Sincerely, Angelo



>
> So, your solution does not even cover your automated builds use-case
> either.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
