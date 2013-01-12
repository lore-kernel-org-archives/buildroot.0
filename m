From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 19:56:42 +0100
Subject: [Buildroot] [PATCH] package/dvb-apps: requires iconv
In-Reply-To: <201301121436.46822.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 12 Jan 2013 14:36:46 +0100")
References: <1357995215-26554-1-git-send-email-yann.morin.1998@free.fr>
 <874nim8r7e.fsf@dell.be.48ers.dk>
 <201301121436.46822.yann.morin.1998@free.fr>
Message-ID: <87vcb26xhx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 Yann> define DVB_APPS_BUILD_CMDS
 Yann> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) V=1
 Yann> +	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(DVB_APPS_LDFLAGS)" $(MAKE) -C $(@D) V=1
 >> 
 >> Ehh, so if you have locale you pass an empty LDFLAGS?

 Yann> Strangely enough, this build fine with a toolchain with or without
 Yann> locales. :-(

Well, yes - By default TARGET_LDFLAGS is empty, so it normally doesn't
really matter.

 Yann> OK, break, will come back to this later... :-/

Don't worry - I've fixed this up and committed, thanks.

-- 
Bye, Peter Korsgaard
