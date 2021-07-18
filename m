From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 21:01:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/tftpd: fix static build
In-Reply-To: <CAPi7W83fQbvzDfFGDMN4zh-VjfUCUZqQt2z_84Xe52-T_j3-oQ@mail.gmail.com>
References: <20210710084313.893425-1-fontaine.fabrice@gmail.com>
 <20210716232144.7a9d3371@windsurf>
 <CAPi7W83fQbvzDfFGDMN4zh-VjfUCUZqQt2z_84Xe52-T_j3-oQ@mail.gmail.com>
Message-ID: <20210718190136.GH12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, Thomas, All,

On 2021-07-16 23:36 +0200, Fabrice Fontaine spake thusly:
> Le ven. 16 juil. 2021 ? 23:21, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
> > On Sat, 10 Jul 2021 10:43:13 +0200
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/913e8b75422c8beba60df5ea2e2c9e431364566e
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  .../0002-__progname-is-provided-by-libc.patch | 65 +++++++++++++++++++
> > >  1 file changed, 65 insertions(+)
> > >  create mode 100644 package/tftpd/0002-__progname-is-provided-by-libc.patch
> > Thanks for the patch. However as usual, the question is: why is this
> > suddenly happening? There hasn't been any recent update to the tftpd
> > package, so why are we seeing this now? Or this an old issue we had
> > never fixed?
> I don't know why this is suddenly happening perhaps this is related to
> a specific uclibc configuration or bug.
> I know that uclibc does not always define __progname and had some bugs
> in the past, for example
> https://github.com/wbx-github/uclibc-ng/commit/64a2e37a0edd0b6fadb734b98eb0d828240d485d
> 
> However, given that this is an upstream commit that was applied 7
> years ago, I think it is pretty safe to apply it to LTS.

I was confused, because both commits (on tftpd and uClibc) are about 7
years old, so I was wondering which you were referring to...

But yes, you were rerferring to the tftpd commit. Which got me wondering
why we needed to apply a patch that have been applied upstream 7 years
ago. Why can't we just bump the version rather than backport patches?

Ah, tftpd hasn't had any new release for the past 10 years now, so *are*
up-to-date...

But then, yes, why can't we just switch to the latest commit in the git
tree, then, rather than backport the fix? Given that tftpd hasn't seen
any commit since 2015, we would not take too big a risk...

Regards,
Yann E. MORIN.

> >
> > All this investigation is necessary to know if the fix is needed on our
> > LTS branch.
> >
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> Best Regards,
> 
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
