From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 17:14:58 +0100
Subject: [Buildroot] [PATCH 1/2] SDL_mixer: Add option to prefer Tremor
 over libvorbis
In-Reply-To: <1576166814.3.0@crapouillou.net> (Paul Cercueil's message of
 "Thu, 12 Dec 2019 17:06:54 +0100")
References: <20191209191554.821230-1-paul@crapouillou.net>
 <1576166814.3.0@crapouillou.net>
Message-ID: <87y2vhh665.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

Hi,

 >> > +ifeq ($(BR2_PACKAGE_SDL_MIXER_USE_TREMOR),y)
 >> > +SDL_MIXER_CONF_OPTS += --enable-music-ogg-tremor
 >> > +SDL_MIXER_DEPENDENCIES += tremor
 >> > +else
 >> >  ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 >> 
 >> Do we need an explicit option for this? Can't we just check for
 >> BR2_PACKAGE_TREMOR here? I doubt there is any situations where
 >> tremor is
 >> enabled but the user doesn't want to use it.

 > That's up to you really. I can send a v2 with the Config.in option
 > removed.

Yes please - Thanks.

-- 
Bye, Peter Korsgaard
