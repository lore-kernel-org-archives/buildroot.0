From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Sat, 27 Sep 2014 09:28:48 -0300
Subject: [Buildroot] [PATCH] package: libarchive: allow building as host
 package
In-Reply-To: <20140927085443.GA4298@free.fr>
References: <1411773795-7803-1-git-send-email-guido@vanguardiasur.com.ar>
 <20140927085443.GA4298@free.fr>
Message-ID: <20140927122848.GA1752@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sat, Sep 27, 2014 at 10:54:44AM +0200, Yann E. MORIN wrote:
> Guido, All,
> 
> What is the rationale for building it as a host-package?
>
> libarchive provides a library, but we have no in-tree host-package that
> uses libarchive.
I have a custom tool that uses it, and I wasn't aware that host packages
were only enabled as needed. It makes a lot sense now that I think about
that, so please ignore this patch.

Sorry!

> 
> On 2014-09-26 20:23 -0300, Guido Mart?nez spake thusly:
> > It works correctly without any changes, so just enable it.
> 
> This should not be part of the commit log. The commit log should just
> explain why you enable host-libarchive, especially because we have no
> in-tree user.
> 
> Regards,
> Yann E. MORIN.
> 
> > Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> > ---
> >  package/libarchive/libarchive.mk | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> > index 8c6951d..22914c2 100644
> > --- a/package/libarchive/libarchive.mk
> > +++ b/package/libarchive/libarchive.mk
> > @@ -69,3 +69,4 @@ LIBARCHIVE_CONF_OPT += --without-zlib
> >  endif
> >  
> >  $(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> > -- 
> > 2.1.0
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
