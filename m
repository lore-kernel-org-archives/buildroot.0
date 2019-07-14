From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 14:38:59 +0200
Subject: [Buildroot] [PATCH] package/cpio: add host version
In-Reply-To: <7761512e-bb70-ea06-14e8-a7f0df882964@mind.be>
References: <20190714090301.26552-1-yann.morin.1998@free.fr>
 <7761512e-bb70-ea06-14e8-a7f0df882964@mind.be>
Message-ID: <20190714123859.GA8912@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-07-14 14:19 +0200, Arnout Vandecappelle spake thusly:
> On 14/07/2019 11:03, Yann E. MORIN wrote:
> > The latest cpio has a --reproducible option, which may come handy when
> > we try to, well, be reproducible...
> > 
> > Reported-by: Arnout Vandecappelle <arnout@mind.be>
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Atharva Lele <itsatharva@gmail.com>
> > ---
> >  package/cpio/cpio.mk | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
> > index 9a09279572..d2814b87a5 100644
> > --- a/package/cpio/cpio.mk
> > +++ b/package/cpio/cpio.mk
> > @@ -16,4 +16,7 @@ ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> >  CPIO_DEPENDENCIES += argp-standalone
> >  endif
> >  
> > +HOST_CPIO_CONF_OPTS = --bindir=$(HOST_DIR)/bin
> 
>  Why is this needed? For target it is needed because --prefix is set to /usr so
> it would end up in /usr/bin and we want it in /bin. But for hsot, --prefix is
> $(HOST_DIR).

You know what? That is exactly what I think, too. ;-)

I just did a quick hack locally to test the build time of cpio, and did
not try to think further, so I stupidly copied the target variant as-is
without thinking too much.

Then I saw it worked, got the required timings from a batch of 5 runs,
finished my reply to Atharva's fs/cpio patch, and decided to send this
patch too, without realising that it needed a bit more love.

Atharva, when you respin your fs/cpio patch, can you grab this one in
your tree and fix it as Arnout pointed out?

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > +
> >  $(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
