From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 11 Sep 2020 10:07:42 +0200
Subject: [Buildroot] package/localedef: parallel build failing. python3
 dependency missing?
Message-ID: <727a47d7-de5f-22a4-d8fb-1a3455e3a768@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


I tried to move my build to parallel and the package host-localedef is
failing with this message:


checking if /build/build/per-package/host-localedef/host/bin/ccache
/usr/bin/gcc is sufficient to build libc... yes
checking for x86_64-pc-linux-gnu-nm... /usr/bin/nm
checking for python3... no
checking for python... python
checking version of python... 2.7.18, bad
configure: error:
*** These critical programs are missing or too old: python
*** Check the INSTALL file for required versions.


The system I'm building on is a Ubuntu 20.04 with only python 2
installed. On my other dev machine where python 3 is installed the
package is successfully built.

But from my understanding the python from package host-python3 should be
used for building?
This package is being built but I guess the host-localedef package is
missing the dependency?


Regards,
Michael
