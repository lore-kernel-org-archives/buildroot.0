From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 9 Sep 2014 19:40:01 +0000
Subject: [Buildroot] [PATCH] openssh: fix static linking
In-Reply-To: <20140909213435.565e0234@free-electrons.com>
References: <F9C551623D2CBB4C9488801D14F864C68C8AE2F4@ex-mb3.corp.adtran.com>
 <20140909213435.565e0234@free-electrons.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C68C8AE362@ex-mb3.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ifeq ($(BR2_PREFER_STATIC_LIB),y)
> SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
> TARGET_CFLAGS += -static
> TARGET_CXXFLAGS += -static
> TARGET_LDFLAGS += -static
> else
> SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
> endif
> 
> So, TARGET_CFLAGS does have -static.

OOOHHHH!!  Maybe that is the problem.  I changed this a few
years back:

-static gets eaten by autoconf.  --static doesn't.  I wonder if
that has been the problem the whole time?

> 
> Please make sure to test your patches against the latest master. I'm
> sure you're again testing against 2014.02, and there has been quite a
> few changes since then in terms of static library support.

Yeah, I hear ya.  I'll get to it eventually.  I've done too much
testing with 2014.02 and we're getting ready for a release.

I'll bump that rev later and may have to go through all this again.

Till then, I'll quit submitting patches until I'm at tip again :).

Andy
