From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 15:16:50 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707124143.GB15840@mx.loc> (Bernhard Fischer's message of
	"Mon\, 7 Jul 2008 14\:41\:43 +0200")
References: <20080706073442.174E03C67A@busybox.net>
	<20080707124143.GB15840@mx.loc>
Message-ID: <87abgt7s1p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> +HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "which glib-genmarshal" || echo /usr/bin/glib-genmarshal)`
 >> +HOST_GLIB:=$(shell $(CONFIG_SHELL) -c "dirname $(HOST_GLIB_BIN)" || echo /usr)

 Bernhard> I don't see why
 Bernhard> 1) "/usr" is a valid fallback here?
 Bernhard> 2) this stuff is needed in the first place.

 Bernhard> If glib-genmarshal is not in your PATH then it is perfectly fine to
 Bernhard> fail. If it is in your PATH (which it should be, iff you have it
 Bernhard> installed), the it should be found by configure.

 Bernhard> Put short, this change should be dropped in my POV.

Agreed.

 >> ifndef CFLAGS_FOR_BUILD
 >> CFLAGS_FOR_BUILD:=-g -O2
 >> endif
 >> @@ -522,3 +520,4 @@
 >> @echo LOCAL=$(LOCAL)
 >> @echo BR2_DL_DIR=$(BR2_DL_DIR)
 >> @echo HOST_GLIB=$(HOST_GLIB)
 >> +	@echo HOST_GLIB_BIN=$(HOST_GLIB_BIN)

 Bernhard> As already said, you're leaking your local debug stuff into the tree,
 Bernhard> please don't do that.

Agreed.

-- 
Bye, Peter Korsgaard
