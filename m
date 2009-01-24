From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 07:33:05 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
In-Reply-To: <20090123230218.44A1376564@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Fri\, 23 Jan 2009 23\:02\:17 +0000 \(UTC\)")
References: <20090123230218.44A1376564@busybox.osuosl.org>
Message-ID: <87ocxxi57i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-23 23:02:15 +0000 (Fri, 23 Jan 2009)
 ulf> New Revision: 24992

 ulf> Log:
 ulf> Fix static lib dep for ncurses

 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/ncurses/ncurses.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/ncurses/ncurses.mk	2009-01-23 21:06:05 UTC (rev 24991)
 ulf> +++ trunk/buildroot/package/ncurses/ncurses.mk	2009-01-23 23:02:15 UTC (rev 24992)
 ulf> @@ -130,7 +130,9 @@
 ulf>  	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 ulf>  	touch -c $@
 
 ulf> -$(TARGET_DIR)/usr/lib/libncurses.a: $(STAGING_DIR)/lib/libncurses.a
 ulf> +$(NCURSES_DIR)/lib/libncurses.a: $(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
 ulf> +
 ulf> +$(TARGET_DIR)/usr/lib/libncurses.a: $(NCURSES_DIR)/lib/libncurses.a

That looks odd. Why not simply always install the development stuff to
target, and simply rely on the BR2_HAVE_DEVFILES setting to clean it
up if it isn't desired?

-- 
Bye, Peter Korsgaard
