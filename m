From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Nov 2015 22:15:49 +0100
Subject: [Buildroot] [PATCH 06/21 RFC] package/gcc: add licensing
 information
In-Reply-To: <20151117122826.646069a0@free-electrons.com>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <ac61c991794df8089b615aee810b018840e37cc8.1447713615.git.yann.morin.1998@free.fr>
 <20151117122826.646069a0@free-electrons.com>
Message-ID: <20151117211549.GC3703@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-17 12:28 +0100, Thomas Petazzoni spake thusly:
> On Mon, 16 Nov 2015 23:47:01 +0100, Yann E. MORIN wrote:
> >  GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
> > +GCC_LICENSE = \
> > +	GPLv2+, GPLv3+, LGPLv2.1+ (w/ exception), LGPv3+ (w/ exception), \
> > +	BSD-3c, MIT, BSL-1.0
> 
> What I dislike a bit with this is that we don't clearly differentiate
> what goes on the target with what remains on the host. For many
> companies, having GPLv3 or LGPLv3 stuff on the target is (unfortunately)
> a no-go, so it would be good to make this clearer.
> 
> As per your implementation, such license information will only be part
> of the "host packages" license information, while libgcc gets actually
> installed in the target. To be honest, I am not entirely sure how to
> handle this properly with our package infrastructure.

Yes, the current legalese will only apply to the host variant.

We could add a target gcc-final that defines the needed legal-info
stuff, but installs nothing (like I did so far with the host-gcc
package). But I don't like it much either.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
