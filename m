From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Aug 2018 17:29:23 +0200
Subject: [Buildroot] [PATCH 3/3] New <pkg>-update-last-config-fragment
 target in pkg-kconfig.mk
In-Reply-To: <20180814162705.505476fe@windsurf>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
 <20180730155153.24091-4-m.patzlaff@pilz.de>
 <20180730234643.34315d11@windsurf> <20180731154948.GB8537@scaer>
 <20180814162705.505476fe@windsurf>
Message-ID: <20180814152923.GK7915@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Marcel, All,

On 2018-08-14 16:27 +0200, Thomas Petazzoni spake thusly:
> Adding Arnout and Peter in Cc, in case they want to give their opinion
> on the patch series.
> On Tue, 31 Jul 2018 17:49:48 +0200, Yann E. MORIN wrote:
> > I would just suggest that we do not add any new rule, but trying to
> > update the defconfig when there are fragments would fail as it currently
> > does, but also would display the delta if there is one. I.e.:
> > 
> >     $ make linux-menuconfig
> >     [change stuff]
> >     $ make linux-update-defconfig
> >     Unable to perform linux-update-defconfig when fragment files are set
> >     Configuration changes that you want to propagate to one of the fragments:
> >     -CONFIG_FOO=y
> >     +# CONFIG_BAR is unset
> >     linux/linux.mk:511: recipe for target 'linux-update-defconfig' failed
> >     make[1]: *** [linux-update-defconfig] Error 1
> 
> I think we could do that in *addition* to having a new rule. Indeed,
> when you know what you're doing, having to run something that doesn't
> make sense ("make linux-update-defconfig") and which causes a failure
> is a bit silly. I'd rather run "make linux-diff-config" (or whatever
> name we chose).

OK by me.

> Marcel, do you think you could rework your patch series to go in the
> direction of showing a diff rather than arbitrarily adjusting the last
> fragment ?

Yes, please! ;-)

Regards,
Yann E. MORIN.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
