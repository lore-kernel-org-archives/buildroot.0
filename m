From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 20:26:59 +0100
Subject: [Buildroot] svn commit: [25683] trunk/buildroot: package project
In-Reply-To: <20090316200849.2beaada3@surf> (Thomas Petazzoni's message of
	"Mon\, 16 Mar 2009 20\:08\:49 +0100")
References: <20090316154844.13B657643C@busybox.osuosl.org>
	<20090316200849.2beaada3@surf>
Message-ID: <87fxhdp8u4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I haven't read the whole patch in its context, but from a
 Thomas> quick look, I would I've written:

 Thomas>  PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 Thomas>  PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig/:$(PKG_CONFIG_PATH)"

 Thomas> since the pkg-config binary compiled by Buildroot should probably be
 Thomas> installed in $(HOST_DIR) (since it's a host binary) and the .pc files
 Thomas> for the target architecture are installed in
 Thomas> $(STAGING_DIR)/usr/lib/pkgconfig.

Yes, but I didn't want to move pkgconfig just yet. The PKG_CONFIG_PATH
is correct though, as this is HOST_CONFIGURE_OPTS, E.G. the options to
configure where you're compiling for the host.

I'll move over the existing host tools (pkgconfig, auto*, libtool)
soonish.

-- 
Bye, Peter Korsgaard
