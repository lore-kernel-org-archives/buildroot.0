From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Nov 2012 00:22:38 +0100
Subject: [Buildroot] [PATCH 09/47] package/libcegui: new package
In-Reply-To: <50A2D3C3.3060809@mind.be>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-10-git-send-email-yann.morin.1998@free.fr>
 <50A2D3C3.3060809@mind.be>
Message-ID: <201211140022.38300.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 14 November 2012 Arnout Vandecappelle wrote:
> On 24/10/12 23:25, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> 
>   I guess this again has to be a specific version for spice?  Could be good
> to document that in the commit message.

Ok, will do.

>   It fails to build in a toolchain without threads.

OK, will fix.

Note: I am testing with a known-working toolchain so far to smooth-out
rough edges. When the series is in good shape, I'll do more testing
to find out all the dependencies.

Basically, my toolchain has all the features that buildroot checks for:
LFS, Threads, and so on... It's uClibc-based, and for x86_64 for now.

> [snip]
> > diff --git a/package/cegui06/Config.in b/package/cegui06/Config.in
> > new file mode 100644
> > index 0000000..7225f9c
> > --- /dev/null
> > +++ b/package/cegui06/Config.in
> > @@ -0,0 +1,14 @@
> > +config BR2_PACKAGE_CEGUI06
> > +	bool "libcegui06"
> 
>   Naming is inconsistent: cegui06 is the package name, but here you call it
> libcegui06 and in the commit message libcegui.

Gah. Sometime, I should better go to sleep rather than code...

> [snip]
> > diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
> > new file mode 100644
> > index 0000000..2f562ac
> > --- /dev/null
> > +++ b/package/cegui06/cegui06.mk
> > @@ -0,0 +1,34 @@
> > +#############################################################
> > +#
> > +# libcegui
> > +#
> > +#############################################################
> > +
> > +CEGUI06_VERSION         = 0.6.2
> > +CEGUI06_SOURCE          = CEGUI-$(CEGUI06_VERSION)b.tar.gz
> > +CEGUI06_SITE            = http://downloads.sourceforge.net/project/crayzedsgui/CEGUI%20Mk-2/$(CEGUI06_VERSION)
> 
>   I would use CEGUI06_VERSION_MAJOR = 0.6.2 and
> CEGUI06_VERSION = $(CEGUI06_VERSION_MAJOR)b

OK, will do.

Thank you! :-)

Regards,
Yan E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
