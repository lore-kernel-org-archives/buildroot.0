From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 11:59:26 +0200
Subject: [Buildroot] [PATCH 01/11] package-infra: add helper to build
 kernel modules
In-Reply-To: <20150607032235.GA2671@tarshish>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <7f37dfb955f969acf85ea5044c1c4020096d2270.1433628825.git.yann.morin.1998@free.fr>
 <20150607032235.GA2671@tarshish>
Message-ID: <20150607095926.GA3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-06-07 06:22 +0300, Baruch Siach spake thusly:
> On Sun, Jun 07, 2015 at 12:20:37AM +0200, Yann E. MORIN wrote:
> > +################################################################################
> > +# inner-kernel-module -- generates the make targets needed to support building
> > +# a kernel module
> > +#
> > +#  argument 1 is the lowercase package name
> > +#  argument 2 is the uppercase package name, including a HOST_ prefix
> > +#             for host packages
> > +#  argument 3 is the uppercase package name, without the HOST_ prefix
> > +#             for host packages
> 
> What is the meaning of building "host" kernel module? These are the target 
> kernel headers we are using here.

Indeed, I just forgot to strip it out when I copied from another infra.

> Besides, you do not provide a 
> host-kernel-module macro, at least in this patch.

And I explicitly dociument that it is not availble (see below, as you
already noticed, and the manual, in the following patch).

> > +#  argument 4 is the type (always 'target')
> 
> And here only target is allowed.

Yup.

I'll fix that before resubmitting. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
