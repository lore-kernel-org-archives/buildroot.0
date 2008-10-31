From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2008 11:33:07 +0100
Subject: [Buildroot] Problem with program_transform_name and naming of
 installed binaries
Message-ID: <20081031113307.14125656@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

For some reason, the binaries installed by DirectFB and Lite (but maybe
other packages are affected, I don't know), get prefixed with
arm-unknown-linux-uclibcgnueabi-. That doesn't happen for the binaries
of libgif, libjpeg, libfreetype and libpng.

Examples:
arm-unknown-linux-uclibcgnueabi-dfbdump
arm-unknown-linux-uclibcgnueabi-dfbg
arm-unknown-linux-uclibcgnueabi-lite_checktest
arm-unknown-linux-uclibcgnueabi-lite_dfbspy

(These are in my $(STAGING_DIR)/usr/bin).

My understanding is that the Makefile does a sed on the destination
binary name, using the 'program_transform_name' variable, computed
at ./configure time.

In my config.log, I can see the value of this variable:

program_transform_name='s&^&arm-unknown-linux-uclibcgnueabi-&'

Which indeed will transform "foo" into "arm-blablabla-foo".

Of course, this is not the desired behaviour, since binaries on the
target also end up with the arm-blablabla prefix. However, after a
quick look at ./configure, I don't really understand what's the logic
to compute this program_transform_name variable.

Any clue ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
