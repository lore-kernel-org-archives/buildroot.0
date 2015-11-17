From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Nov 2015 22:40:45 +0100
Subject: [Buildroot] [PATCH 06/21 RFC] package/gcc: add licensing
 information
In-Reply-To: <20151117222506.2faa3bbf@free-electrons.com>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <ac61c991794df8089b615aee810b018840e37cc8.1447713615.git.yann.morin.1998@free.fr>
 <20151117122826.646069a0@free-electrons.com>
 <20151117211549.GC3703@free.fr>
 <20151117222506.2faa3bbf@free-electrons.com>
Message-ID: <20151117214045.GF3703@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-17 22:25 +0100, Thomas Petazzoni spake thusly:
> On Tue, 17 Nov 2015 22:15:49 +0100, Yann E. MORIN wrote:
> > > As per your implementation, such license information will only be part
> > > of the "host packages" license information, while libgcc gets actually
> > > installed in the target. To be honest, I am not entirely sure how to
> > > handle this properly with our package infrastructure.
> > 
> > Yes, the current legalese will only apply to the host variant.
> > 
> > We could add a target gcc-final that defines the needed legal-info
> > stuff, but installs nothing (like I did so far with the host-gcc
> > package). But I don't like it much either.
> 
> It's not super nice indeed, but I don't really see a better option. We
> could always make this package actually do something "useful":
> installing the gcc libraries to the target. I.e essentially move the
> following part of host-gcc-final to this package:

Yes, I like that idea. Even if that makes the package a bit more
complex, it helps in separating the host/target/staging stuff (like what
we already discussed about hte extrenal toolchain, remember?).

[--SNIP--]
> This is really making the code more complicated just for the sake of
> legal-info, though. Which isn't super nice. But at least we would have
> the gcc libraries properly mentioned in the legal-info output for the
> target.

Yes, and that's a very good reason for doing it.

I'll send patches and we can discuss further with actual code.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
