From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Feb 2021 09:57:00 +0100
Subject: [Buildroot] [PATCH 19/25] support/config-fragments/autobuild:
 use Bootlin toolchain for SH4 uclibc
In-Reply-To: <20210204102212.4db73a8b@windsurf.home>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
 <20210202225339.2157480-20-thomas.petazzoni@bootlin.com>
 <20210203212753.GI2384@scaer>
 <20210204102212.4db73a8b@windsurf.home>
Message-ID: <20210205085700.GQ2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-02-04 10:22 +0100, Thomas Petazzoni spake thusly:
> On Wed, 3 Feb 2021 22:27:53 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > > diff --git a/support/config-fragments/autobuild/bootlin-sh4-uclibc.config b/support/config-fragments/autobuild/bootlin-sh4-uclibc.config
> > > new file mode 100644
> > > index 0000000000..3d8f69b3e4
> > > --- /dev/null
> > > +++ b/support/config-fragments/autobuild/bootlin-sh4-uclibc.config
> > > @@ -0,0 +1,4 @@
> > > +BR2_sh=y
> > > +BR2_sh4=y  
> > 
> > BR2_sh4 is the default, so I dropped it from the fragment when applying.
> 
> In fact, I intentionally re-added it to be sure that whatever the
> default SuperH arch variant, this configuration is for SH4.

But we don't do so for the other fragments, and the previous fragment
did not have it either, and you did not explain n the commit log either,
so I took that as a (minor) oversight due to the large amount of changes
in this series...

> I in fact also included some "extra" options in a few of those other
> .config files. For example, for some platforms, the Bootlin toolchain
> is the only external toolchain available, and therefore the default.
> But I nevertheless made that explicit in the .config file.

Well, to be honest, I did not validate that all the new fragments were
indeed minimal; I only looked for the obvious difference with the
previous fragments...

> Thanks for taking a look at the patch series, and merging it!

Cheers, thanks for taking care of that stuff!

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
