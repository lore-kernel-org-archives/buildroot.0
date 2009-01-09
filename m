From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Jan 2009 10:17:16 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090108225832.382AD77108@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Thu\, 8 Jan 2009 22\:58\:31 +0000 \(UTC\)")
References: <20090108225832.382AD77108@busybox.osuosl.org>
Message-ID: <87ljtkrg83.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-08 22:58:30 +0000 (Thu, 08 Jan 2009)
 ulf> New Revision: 24727

 ulf> Log:
 ulf> Linux26 requires "mkimage" from u-boot to be in the PATH
 ulf> if an uImage is to be built for arm, avr32, blackfin and sh.

 ulf> PATH has therefore been set to have $(STAGING_DIR)/usr/bin
 ulf> as the first item allowing linux to find mkimage.

 ulf> This patch will, if an uImage is built, create a "u-boot-to?\195?\179ls"
 ulf> directory in the PROJECT_BUILD_DIR directory.
 ulf> $(STAGING_DIR)/usr/bin/mkimage is copied to this directory
 ulf> and the PATH variable will now include "u-boot-tools"

Why the extra dir? Why isn't mkimage just installed into
STAGING_DIR/usr/bin and used from there?

-- 
Bye, Peter Korsgaard
