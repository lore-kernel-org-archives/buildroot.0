From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jun 2014 19:37:31 +0200
Subject: [Buildroot] [PATCH] packages: replace command install by
 $(INSTALL)
In-Reply-To: <9904698c937856394f641361bee0ffed.squirrel@sysmic.org>
References: <1401626281-29034-1-git-send-email-maxime.hadjinlian@gmail.com>
 <9904698c937856394f641361bee0ffed.squirrel@sysmic.org>
Message-ID: <20140604173731.GB3325@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-06-04 16:00 +0200, "J?r?me Pouiller" spake thusly:
> On Sunday 01 June 2014 14:38:01 Maxime Hadjinlian wrote:
> > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> [...]
> > diff --git a/package/alsa-utils/alsa-utils.mk
> > b/package/alsa-utils/alsa-utils.mk index 48b4bfd..2083c97 100644
> > --- a/package/alsa-utils/alsa-utils.mk
> > +++ b/package/alsa-utils/alsa-utils.mk
> > @@ -41,7 +41,7 @@ LSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST)
> > += usr/bin/speaker-tes define ALSA_UTILS_INSTALL_TARGET_CMDS
> >       mkdir -p $(TARGET_DIR)/var/lib/alsa
> >       for i in $(ALSA_UTILS_TARGETS_y); do \
> > -             install -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i; \
> > +             $(INSTALL) -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i; \
> >       done
> >       if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ]; then \
> >               mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
> [...]
> 
> Just out of curiosity, why '$(INSTALL)' is preferred over 'install'?

Because it's been there for the past 9+ years? The commit #9cc9476c (more
dhcp updates) introduced this variable in 2005-02-16.

And because that's what we document in the manual? ;-)

More seriously, there's no much reason for now. But in the grand scheme
of the Universe, not all 'install' commands were made equal, so this
would allow us (in the case it is needed) to point $(INSTALL) to a
select 'install' command that we control.

Again, it's mostly historical bagage, but we want consistency acros
packages.

> And what about '$(RM)' versus 'rm'?

We do not have $(RM) currently, since all 'rm' commands are pretty much
on par with each others, so it is not really needed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
