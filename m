From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 May 2020 21:12:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/cracklib: add python3 support
In-Reply-To: <20200519190436.GG27030@scaer>
References: <20200202205306.1785085-1-fontaine.fabrice@gmail.com>
 <20200202205306.1785085-2-fontaine.fabrice@gmail.com>
 <20200519190436.GG27030@scaer>
Message-ID: <20200519191223.GH27030@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-19 21:04 +0200, Yann E. MORIN spake thusly:
> On 2020-02-02 21:53 +0100, Fabrice Fontaine spake thusly:
> > python bindings supports python3 since version 2.8.19 and
> > https://github.com/cracklib/cracklib/commit/219de98766b9f1e4c8c5b174de770158ffda3a93
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Applied to master, thanks.
> (but I forgot to add a reference to a recent build failure...)

I eventually had to revert it, as the preparatory patch against python
was not applied, as upstream believes it is dangerous, and are still
debating the proper way:
    https://bugs.python.org/issue39026#msg369309

Hint: they believe removing the include is the best course of action.

Can you have anotherlook, please?

Thanks, and sorry for the long delay.,..

Regards,
Yann E. MORIN.

> Regards,
> Yann E. MORIN.
> 
> > ---
> >  package/cracklib/cracklib.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
> > index 91d510ff34..be1b50f138 100644
> > --- a/package/cracklib/cracklib.mk
> > +++ b/package/cracklib/cracklib.mk
> > @@ -19,9 +19,9 @@ else
> >  CRACKLIB_CONF_OPTS += --without-zlib
> >  endif
> >  
> > -ifeq ($(BR2_PACKAGE_PYTHON),y)
> > +ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
> >  CRACKLIB_CONF_OPTS += --with-python
> > -CRACKLIB_DEPENDENCIES += python
> > +CRACKLIB_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
> >  else
> >  CRACKLIB_CONF_OPTS += --without-python
> >  endif
> > -- 
> > 2.24.1
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
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
