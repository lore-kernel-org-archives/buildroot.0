From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Aug 2018 22:29:22 +0200
Subject: [Buildroot] [PATCH 3/3] New <pkg>-update-last-config-fragment
 target in pkg-kconfig.mk
In-Reply-To: <20180815193528.6fc47d7b@windsurf>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
 <20180730155153.24091-4-m.patzlaff@pilz.de>
 <20180730234643.34315d11@windsurf> <20180731154948.GB8537@scaer>
 <20180814162705.505476fe@windsurf>
 <83afeab5-baf8-122e-15ab-17889c3a300d@mind.be>
 <20180815140413.62984968@windsurf> <20180815161657.GC2556@scaer>
 <20180815193528.6fc47d7b@windsurf>
Message-ID: <20180815202922.GE2556@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-15 19:35 +0200, Thomas Petazzoni spake thusly:
> On Wed, 15 Aug 2018 18:16:57 +0200, Yann E. MORIN wrote:
> > Indeed, it is not to be considered to be a diff of any of the fragment,
> > but of the configuration *as a whole*.
> > 
> > That's why I initially did not write a full diff, but only the delta
> > snippet, not the context, because it is a diff, not a patch.
> > 
> > But I think we should instead use the scripts/diffconfig script that is
> > in the linux kernel tree, and which outputs looks like:
> > 
> >     $ cat config.000
> >     CONFIG_FOO=y
> >     $ cat config.001
> >     CONFIG_FOO is not set
> >     $ ./scripts/diffconfig config.000 config.001
> >      FOO y -> n
> > 
> > which IMNSHO is exactly the message we want to convey.
> 
> Indeed, this looks very good, and diffconfig is an existing tool.

Note that this was the diffconfig tool frm the kernel. The one we have
behave differently (and badly I think), given the same config files as
input:

    $ ./utils/diffconfig linux-config.000 linux-config.001
    +IG_FOO n

Which is not nice... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
