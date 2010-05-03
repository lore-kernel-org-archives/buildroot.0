From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 May 2010 08:43:53 +0200
Subject: [Buildroot] [PATCH] ncurses: convert to autotools infrastructure
In-Reply-To: <1272840373-20446-1-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Mon, 3 May 2010 00:46:13 +0200")
References: <20100501130651.546a957a@surf>
	<1272840373-20446-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <87zl0heb86.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 
 llandwerlin>  ifneq ($(BR2_PACKAGE_NCURSES_TARGET_HEADERS),y)
 llandwerlin> -NCURSES_WANT_STATIC=--disable-static
 llandwerlin> +NCURSES_CONF_OPT += --disable-static
 llandwerlin>  endif

Not your fault, but I don't see the relation between headers (which
should use the global BR2_HAVE_DEVFILES instead?) and wanting to be able
to link statically?

Otherwise it looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
