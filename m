From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 May 2015 19:02:19 +0200
Subject: [Buildroot] [PATCH] package/gcc: backport PR56780 patches
In-Reply-To: <20150511170731.003c9663@free-electrons.com>
References: <1431284486-4996-1-git-send-email-romain.naour@openwide.fr>
 <20150511170731.003c9663@free-electrons.com>
Message-ID: <20150511170219.GA4279@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-05-11 17:07 +0200, Thomas Petazzoni spake thusly:
> On Sun, 10 May 2015 21:01:26 +0200, Romain Naour wrote:
> > --disable-install-libiberty configure option is broken
> > in gcc 4.8.x, so libiberty.a is always installed in HOST_DIR.
> > 
> > This library broke the host-gdb build due to a fpic/fPIC issue.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/28f/28f3074e99a35f4321dad2fa6c5abdad14d2d2c6/
> > 
> > And many more.
> > 
> > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/gcc/4.8.4/851-PR-other-56780.patch | 244 +++++++++++++++++++++++++++++
> >  1 file changed, 244 insertions(+)
> >  create mode 100644 package/gcc/4.8.4/851-PR-other-56780.patch
> 
> We also need this on other gcc versions:
> http://autobuild.buildroot.org/results/408/4089d707339291073f48187466817dd17198a3b2/

Right, even though this is also a gcc-4.8 (but the ARC variant).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
