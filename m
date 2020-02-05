From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 10:30:33 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/mesa3d: add v3d driver
 support
In-Reply-To: <20200204234048.69648d1e@gmx.net>
References: <20200204144412.6666-1-ps.report@gmx.net>
 <20200204144412.6666-2-ps.report@gmx.net>
 <20200204205516.GB6335@scaer> <20200204224540.23f620c0@gmx.net>
 <20200204230027.014f4603@gmx.net> <20200204221427.GE6335@scaer>
 <20200204234048.69648d1e@gmx.net>
Message-ID: <20200205093033.GB3131@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-02-04 23:40 +0100, Peter Seiderer spake thusly:
> On Tue, 4 Feb 2020 23:14:27 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Slo it means the code you provided is not complete! Why do you not
> > select the requried options?
> >     select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
> Because none of the other drivers does so...

So they too are broken? That is still not good at all.. :-(

> >     select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> Because I do not know if all use-cases need a mesa3d-vc4 driver
> (my use case definitely ;-) )...

So, if all you could test is that situation, then just catter for it.
Users that would be interested for a more fine-grained choice and are
able to test it will send further patches.

> > We don't want to let the user resolve the dependencies manually. This is
> > what the config options are for.
> All freedom for the empowered users ;-)

But we do not even have a way to know whtehr this is a valid situation
or not. We do not want to generate broken configuration when we know
that they are broken.

And if it is indeed not needed, then there is no reason to say so in the
help text either.

Either something is needed, and we select it via config symbols, and it
is not needed to say so in the help text, or they are not needed, and
then we don;t need to say so in the help text.

The current situation is very confusing.

[--SNIP--]
> > This is definitely not nice at all... :-(
> Yes, not all possible buildroot configs lead to an usable system...
> My reasoning was that the help text hint should be enough...

I disagree.

Could you please send further patches that drop the '(need stuff)' from
the help text and replace them with 'select' to the appropriate options,
please?

Overall, we also discussed that mesa3d package during the deve-days in
Brussels, and we really find that this is a bit of a mess currently...
This package has evolved organically over the years, so the current
situation is not totally unexpected, but still, it may benefit from a
new round of refactoring... (hint, hint)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
