From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 15 Nov 2017 22:33:04 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/feh: Fix build issue with
 some older cross-compilers
In-Reply-To: <20171115220935.03b64e14@windsurf.lan>
References: <20171115132754.9755-1-petr.vorel@gmail.com>
 <20171115220935.03b64e14@windsurf.lan>
Message-ID: <20171115213303.i5uyauphzo6pplyv@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> On Wed, 15 Nov 2017 14:27:52 +0100, Petr Vorel wrote:

> >  define FEH_BUILD_CMDS
> > -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
> > -		-C $(@D) all
> > +	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -std=gnu11" $(MAKE1) \

> std=gnu11 was only added in gcc 4.7, so using this would break the
> build with gcc < 4.7. According to the error message, only C99 is
> needed, so could you try instead -std=c99, which is available since at
> least gcc 4.2 ?

Would it be -std=gnu99 sufficient for buildroot? Or it's a problem for some compilers?
If yes, I'll patch the sources as it depends on alphasort(), which is not available on c99.


Kind regards,
Petr
