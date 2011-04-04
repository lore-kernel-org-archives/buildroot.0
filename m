From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Apr 2011 12:31:47 +0200
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
In-Reply-To: <1300923770-13698-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Wed, 23 Mar 2011 19:42:50 -0400")
References: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
Message-ID: <871v1iz4rw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
 Mike> ---
 Mike> note: not really tested since external toolchain support is totally broken

Have you had a chance to test it now? It seems to be crashing on all the
configs I've tried (arm9 / x86, gcc 4.3.x / 4.5.x, uClibc 0.9.31 /
0.9.32-rc3).

The problem is a null pointer access in tgetent. It seems to load the
terminfo file ok, but something goes wrong.

Reverting back to 5.7 everything works fine aagain.

 Mike>  package/ncurses/ncurses.mk |    2 +-
 Mike>  1 files changed, 1 insertions(+), 1 deletions(-)

 Mike> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
 Mike> index 0a49887..362f3ed 100644
 Mike> --- a/package/ncurses/ncurses.mk
 Mike> +++ b/package/ncurses/ncurses.mk
 Mike> @@ -23,7 +23,7 @@
 Mike>  # USA
 
 Mike>  # TARGETS
 Mike> -NCURSES_VERSION = 5.7
 Mike> +NCURSES_VERSION = 5.8
 Mike>  NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 Mike>  NCURSES_SOURCE = ncurses-$(NCURSES_VERSION).tar.gz
 Mike>  NCURSES_INSTALL_STAGING = YES
 Mike> -- 
 Mike> 1.7.4.1

-- 
Bye, Peter Korsgaard
