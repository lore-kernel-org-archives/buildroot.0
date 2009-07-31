From: Mark Constable <markc@renta.net>
Date: Fri, 31 Jul 2009 14:19:03 +1000
Subject: [Buildroot] x86_64 error2
Message-ID: <4A7270B7.3000308@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Continuing on from the previous error with a manual make, uclibc
and gcc apparently built but the build ended with this error...

...
/home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/build_x86_64/makedevs-host
/usr/bin/gcc -Wall -Werror -O2 /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/build_x86_64/makedevs-host/makedevs.c -o /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/build_x86_64/makedevs-host/makedevs
/usr/bin/install -m 755 /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/build_x86_64/makedevs-host/makedevs /home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/build_x86_64/host_dir/usr/bin/makedevs
make: /usr/bin/install: Command not found
make: *** [/home/sources/srcpkgs/eth-os/cli/buildroot/src/buildroot-2009.05/build_x86_64/host_dir/usr/bin/makedevs] Error 127

My Archlinux based hosts coreutils package installs "install"
as /bin/install. Sure I can make a softlink, but shouldn't the
buildroot procedure just use "install" from the $PATH?

--markc
