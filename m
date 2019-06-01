From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Jun 2019 22:50:46 +0200
Subject: [Buildroot] [PATCH 2/2] arch/arc: arc7x0 always needs -matomic
In-Reply-To: <20190601223735.4057b840@windsurf>
References: <cover.1559421222.git.yann.morin.1998@free.fr>
 <16241cb355b045ba585ba806f0f4c829f5aea9f8.1559421222.git.yann.morin.1998@free.fr>
 <20190601223735.4057b840@windsurf>
Message-ID: <20190601205046.GI3407@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-06-01 22:37 +0200, Thomas Petazzoni spake thusly:
> On Sat,  1 Jun 2019 22:33:51 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
> > new file mode 100644
> > index 0000000000..d324e5c1e1
> > --- /dev/null
> > +++ b/arch/arch.mk.arc
> > @@ -0,0 +1,4 @@
> > +# ARC7x0 needs -matomic, always
> > +ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
> > +ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
> > +endif
> So can we drop 
> TARGET_ABI += -matomic
> from package/Makefile.in ?

Ah, I see that the condition there is not the same as the one I wrote.

Alexey, last time I asked [0], you did not reply, so here goes again: what
variants of ARC really require -matomic, as you reported on [2] [3].

From [1], I understood that only arc700 was impacted, but the existing
condition to add -matomic for arc [4] is not the same.

So, quid?

[0] https://patchwork.ozlabs.org/comment/2169504/
[1] https://patchwork.ozlabs.org/comment/2159927/
[2] https://patchwork.ozlabs.org/patch/1087471/
[3] https://patchwork.ozlabs.org/patch/1087480/
[4] https://git.buildroot.org/buildroot/tree/package/Makefile.in#n106

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
