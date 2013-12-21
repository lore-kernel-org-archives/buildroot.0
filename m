From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Dec 2013 18:35:15 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/providers
In-Reply-To: <20131220104904.7cb29c07@skate>
References: <cover.1387495624.git.yann.morin.1998@free.fr>
 <20131220103143.53d1434e@skate>
 <201312201043.01660.yann.morin.1998@free.fr>
 <20131220104904.7cb29c07@skate>
Message-ID: <20131221173515.GC3481@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-20 10:49 +0100, Thomas Petazzoni spake thusly:
> On Fri, 20 Dec 2013 10:43:01 +0100, Yann E. MORIN wrote:
> > > I must say I really like this proposal! It both makes virtual packages
> > > better, and solves the BR2_EXTERNAL problem without making invasive
> > > changes in the package infrastructure.
> > 
> > Note that I still intend to work on the post-pone patch, as this would
> > allow more integration of BR2_EXTERNAL.
> 
> Like what?

I just have to clear a case where a new external package enables a
feature for a built-in package. So, br2-external could provide extra
./configure options for a built-in package.

But that has deep implications, especially if Buildroot is then
distributed as part of a compliance effort: only providing Buildroot and
not br2-external would not be compliant.

So, in fact, I don't think we should make that easy.

> > > A few minor questions:
> > > 
> > >  *) Shouldn't we use 'qstrip' when doing:
> > > 
> > >     POWERVR_DEPENDENCIES = $(BR2_PACKAGE_PROVIDES_POWERVR)

OK, I've fixed that now.

> > >  *) The jpeg virtual package should also be converted in the same way.
> Don't know about cryptodev,

cryptodev is like jpeg: it provides a choice.

> but jpeg is really a virtual package,

I've now converted both of them, too.

> but
> it's true that it is handled in a different way than the OpenGL
> packages, in that jpeg/Config.in provides a choice between the
> different providers. Not sure what we want to do here. Maybe nothing, I
> don't know.

I think we should just convert them over to how other virtual packages
are implemented: there is nothing to prevent, eg. rpi-userland and
ti-gfx (both providers of EGL) to be selected at the same time.

OK, those are a bit special, since they are tied to the hardware, when
neither jpeg nor cryptodev are. But still, I think we should have a
single way of doing virtual packages.

Peter, what's your opinion?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
