From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Feb 2014 19:09:35 +0100
Subject: [Buildroot] [RFC PATCH] Add OpenTyrian package (SDL game)
In-Reply-To: <52F51544.2060005@free.fr>
References: <1391624243-10898-1-git-send-email-julien.boibessot@free.fr>
 <52F2BE4F.3080600@mind.be> <52F51544.2060005@free.fr>
Message-ID: <20140207180934.GB3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beno?t, All,

On 2014-02-07 18:17 +0100, Julien Boibessot spake thusly:
[--SNIP--]
> >> +		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
> >> +		LDFLAGS="-lm" \
> >> +		WITH_NETWORK="$(OPENTYRIAN_NETWORK)" \
> >> +		-C $(@D) release
> >> +endef
> >> +
> >> +define OPENTYRIAN_INSTALL_TARGET_CMDS
> >> +	$(INSTALL) -D -m 0755 $(@D)/opentyrian $(TARGET_DIR)/usr/games/opentyrian
> >  We prefer to install everything in /usr/bin.
> 
> prboom & rubix packages already explicitly install everything in
> /usr/games/... What should I do ?

Send a patch so they install in /usr instead? ;-)

Those are packages that went in a loooong time ago, even before Peter
took over maintainership, so they might not follow the current
conventions.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
