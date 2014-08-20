From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Aug 2014 14:22:38 +0200
Subject: [Buildroot] [PATCH 2/4] package/ncurses: fixup wide support for
 static targets
In-Reply-To: <CAAXf6LXsfoHafOY9cdVfP1waNcaWkrM8xMgyiqswE4LHX56wMA@mail.gmail.com>
References: <1408474091-25947-1-git-send-email-gustavo@zacarias.com.ar>
 <1408474091-25947-3-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LXsfoHafOY9cdVfP1waNcaWkrM8xMgyiqswE4LHX56wMA@mail.gmail.com>
Message-ID: <20140820142238.404d0c48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 19 Aug 2014 21:47:55 +0200, Thomas De Schampheleire wrote:

> Here you could also do something like
> ifeq ($(BR2_PREFER_STATIC_LIB),y)
> NCURSES_LIB_EXT = .a
> else
> NCURSES_LIB_EXT = .so
> endif
> define NCURSES_LINK_LIBS
>        for lib in $(NCURSES_LIBS-y); do \
>                ln -sf $${lib}$(NCURSES_LIB_SUFFIX)$(NCURSES_LIB_EXT) \
>                        $(1)/usr/lib/$${lib}$(NCURSES_LIB_EXT); \
>        done
> endef
> to avoid duplicating the hook content.

Except that for now, the semantic is:

 * BR2_PREFER_STATIC_LIB=y -> install only static libraries

 * BR2_PREFER_STATIC_LIB undefined -> install *both* static and shared
   libraries.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
