From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Nov 2010 17:11:43 +0100
Subject: [Buildroot] Crosstool-NG depends on awk/gawk
Message-ID: <20101124171143.7e1c497a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've finally tried the Crosstool-NG backend and it doesn't work because
it needs awk/gawk on the host, which isn't installed on my limited
Debian environment:

=======================================================================

Checking for 'grep'... /bin/grep
Checking whether '/bin/grep' supports -E... yes
Checking for 'sed'... /bin/sed
Checking whether '/bin/sed' supports -i and -e... yes
Checking for 'bash'... /bin/bash
Checking for 'cut'... /usr/bin/cut
Checking for 'install'... /usr/bin/install
Checking for 'make'... /usr/bin/make
Checking for 'gcc'... /usr/bin/gcc
Checking for 'awk'... no
Checking for 'gawk'... no

GNU awk was not found

Either you are missing entirely the needed tool,
or the version you have is too old.

=======================================================================

So probably we should build host-gawk before running Crosstool-NG
build, or make it a mandatory Buildroot dependency.

Other comment: Yann, it'd be really great if Crosstool-NG was hosted
behind a better connection than a DSL connection. Downloading at 50
KB/s is really frustrating :)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
