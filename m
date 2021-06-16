From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jun 2021 21:59:02 +0200
Subject: [Buildroot] [External] [PATCH] core/pkg-generic: fix
 instrumentation for packages that install nowhere
In-Reply-To: <DM2P110MB0105D1560BC1E8EC48F2F8AAF2309@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
References: <20210613143207.2445691-1-yann.morin.1998@free.fr>
 <DM2P110MB0105D1560BC1E8EC48F2F8AAF2309@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
Message-ID: <20210616195902.GR2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2021-06-15 19:40 +0000, Weber, Matthew L                            Collins spake thusly:
> > From: Yann E. MORIN <yann.morin.1998@gmail.com> on behalf of Yann E. MORIN <yann.morin.1998@free.fr>
> > Sent: Sunday, June 13, 2021 9:32 AM
> > To: buildroot at buildroot.org <buildroot@buildroot.org>
> > Cc: Yann E. MORIN <yann.morin.1998@free.fr>; Weber, Matthew L Collins <Matthew.Weber@collins.com>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Subject: [External] [PATCH] core/pkg-generic: fix instrumentation for packages that install nowhere 
> > ?
> > A (target [0]) package can independently declare installing in various
> > locations: target, staging, or images. The default is to only install
> > in target.
[--SNIP--]
> > Fixes: #13836
> >
> > [0] a host package can't opt out of installing anything.
> > [1] that one is actually missing AUFS_INSTALL_TARGET = NO, so this
> > ??? hides the issue.
> > [2] even us are not 100% clean on that topic: gcc will install files in
> > ??? staging and target as part of the same step (not the build, granted,
> > ??? but still...)
> >
> > Reported-by: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Tested-by: Matthew Weber <matthew.weber@collins.com

Applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
