From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 21:13:58 +0200
Subject: [Buildroot] [PATCH] libkrb5: disable rpath
In-Reply-To: <88c0c62f-cb6c-4dcc-2b0c-b5b450b21142@dawncrow.de>
References: <2d3716532e37e7fd57c930fcca6e4656ec7fa649.1526236679.git.baruch@tkos.co.il>
 <88c0c62f-cb6c-4dcc-2b0c-b5b450b21142@dawncrow.de>
Message-ID: <20180513191358.GD22130@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2018-05-13 20:59 +0200, Andr? Hentschel spake thusly:
> Am 13.05.2018 um 20:37 schrieb Baruch Siach:
> > The default rpath value for krb5 is /usr/lib. On some hosts this might
> > confuse the build time linker as it looks for target libraries in the
> > host /usr/lib directory.
> > 
> > Should fix:
> > http://autobuild.buildroot.net/results/6df/6df84ed325ddd92248741d2f4737423b1b999489/
> > http://autobuild.buildroot.net/results/049/049f5147288b418402b6e5a4181eff4d426c8d7a/
> > http://autobuild.buildroot.net/results/432/432d5d0295f77cd34b78e70e8b4b7d77ef19ae3c/
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/libkrb5/libkrb5.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> > index c40be632786b..d9d7160ae8d5 100644
> > --- a/package/libkrb5/libkrb5.mk
> > +++ b/package/libkrb5/libkrb5.mk
> > @@ -28,7 +28,8 @@ LIBKRB5_CONF_OPTS = \
> >  	--without-system-et \
> >  	--without-system-ss \
> >  	--without-system-verto \
> > -	--without-tcl
> > +	--without-tcl \
> > +	--disable-rpath
> >  
> >  ifeq ($(BR2_PACKAGE_OPENLDAP),y)
> >  LIBKRB5_CONF_OPTS += --with-ldap
> > 
> 
> Thank you!
> Sorry for not catching those myself, I just had no clue what was going on here and with the other failures.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

"Signed-off-by" is when you are part of the submission chain, i.e. you
participated in the chain that goes from the author down to the one that
sends it on the mailing list.

If you agree with a patch, you can provide:

    Reviewed-by: you looked at the patch, it looks OK for you, but you
                 can't guarantee there so side effect;

    Acked-by: same as Reviewed-by, but you would commit it if you had
              commit rights;

    Tested-by: you actually tested the patch, and it behaves as expected.

Regards,
Yann E. MORIN.

> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
