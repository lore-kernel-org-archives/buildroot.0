From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 27 Dec 2017 19:53:38 +0100
Subject: [Buildroot] [PATCH 7/9] libcurl: add host variant
In-Reply-To: <20171218054048.mfakm2dfbaybnlz3@sapphire.tkos.co.il>
References: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
 <20171217175808.31392-8-eric.le.bihan.dev@free.fr>
 <20171218054048.mfakm2dfbaybnlz3@sapphire.tkos.co.il>
Message-ID: <20171227185338.GA16314@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-12-18 07:40:48, Baruch Siach wrote:
> Hi Eric,
>
> On Sun, Dec 17, 2017 at 06:58:06PM +0100, Eric Le Bihan wrote:
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  package/libcurl/libcurl.mk | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> > index 0aab58a7de..c95b0eea6b 100644
> > --- a/package/libcurl/libcurl.mk
> > +++ b/package/libcurl/libcurl.mk
> > @@ -88,4 +88,17 @@ endef
> >  LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
> >  endif
> >
> > +HOST_LIBCURL_DEPENDENCIES = host-openssl
> > +HOST_LIBCURL_CONF_OPTS = \
> > +	--disable-manual \
> > +	--disable-ntlm-wb \
> > +	--disable-curldebug \
> > +	--without-gnutls \
> > +	--without-mbedtls \
> > +	--without-polarssl \
> > +	--without-nss
>
> What about --with-ssl=...? Isn't that needed for the linking with
> host-openssl?

Though the configuration script properly detects the openssl library and
enables support for it, it is true that it might be better to explicitly
enable it. I'll add this in the next spin. Thanks.

Regards,

--
ELB
