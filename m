From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 20:30:54 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: audio/libogg
	audio/libvorbis docker edit etc...
In-Reply-To: <200810261437.05446.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Sun\, 26 Oct 2008 15\:37\:05 +0200")
References: <20081026061944.0F6DE3C2B3@busybox.net>
	<200810261437.05446.markus.heidelberg@web.de>
Message-ID: <87r663f91t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

Hi,

 >> -					PKGCONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
 >> -					PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
 >> -					PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 >> +					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"

 Markus> I think this will break docker, because MAKE_OPT is affected,
 Markus> not CONF_OPT.  And I just noticed that docker doesn't use
 Markus> autotools at all.

Yes, I re-added PKG_CONFIG=.. in r23796 - With that, it works for me.

-- 
Bye, Peter Korsgaard
