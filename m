From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:23:23 +0200
Subject: [Buildroot] [git commit] package/hiredis: fix installation
	logic of library
In-Reply-To: <20170412193436.95F9C80270@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 12 Apr 2017 21:34:12 +0200")
References: <20170412193436.95F9C80270@busybox.osuosl.org>
Message-ID: <87r30hwqxg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=96daacb720cffe1f83259462bef9d3da92925cd9
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > While testing minetest with libhiredis library, the game crached due to
 > missing libhiredis.so.0.13 library.

 > The hiredis.mk doesn't use "make install" because "make install" depends
 > on building both the shared and static libraries, which fails in
 > static-only scenarios.

 > However, the installation logic in hiredis.mk is bogus: it installs the
 > library as libhiredis.so, while its SONAME is libhiredis.so.0.13. We fix
 > this by using the same logic as the one done by the package "make
 > install" process: install the library as libhiredis.so.0.13, and create
 > libhiredis.so as a symbolic link to it.

 > While at it:

 >  - Install the library 0755, this is more common.

 >  - Do not create $(TARGET_DIR)/usr/lib, since $(INSTALL) -D will create
 >    the necessary directories for the destination path.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > [Thomas: rework to use the same installation logic as the one from
 > hiredis "make install".]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
