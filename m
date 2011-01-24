From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 22:59:30 +0100
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <201101241648.15991.vapier@gentoo.org> (Mike Frysinger's message
	of "Mon, 24 Jan 2011 16:48:15 -0500")
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
	<201101231607.30938.vapier@gentoo.org> <20110124171642.6cff75a4@surf>
	<201101241648.15991.vapier@gentoo.org>
Message-ID: <87tygyotdp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 >> LIBPCAP_INSTALL_STAGING_OPT = DYEXT=none DESTDIR="$(STAGING_DIR)" install
 >> LIBPCAP_INSTALL_TARGET_OPT  = DYEXT=none DESTDIR="$(TARGET_DIR)" install

 Mike> yes, that would make it work, but that just makes me want to cry.
 Mike> it makes a lot more sense imo to have $(PKG)_MAKE_OPT be passed
 Mike> for all steps (and grepping the tree doesnt show any cases where
 Mike> this would be a problem).  if people still want a hook specific
 Mike> to the build step, then it'd make sense to add $(PKG)_BUILD_OPT
 Mike> or something similiar.

Yeah, similar to the recent patch to pass $PKG_MAKE_ENV for host
packages Thomas sent earlier today.

-- 
Bye, Peter Korsgaard
