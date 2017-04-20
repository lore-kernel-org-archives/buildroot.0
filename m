From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 19 Apr 2017 20:55:58 -0500
Subject: [Buildroot] uboot-tools autobuild failures
Message-ID: <CANQCQpb0U3tO7Z-Lsz1pxmekaKYC8JyU7BJgtcXwLDWDgh1xNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It looks like all of these recent failures are because the python swig
build does a "$(if $(shell which swig 2> /dev/null),_libfdt.so)" to
determine if the host system has swig and if so, try to build the
python bindings.  Obviously not taking into account any prefix we'd
provide to the host/ in out build.

http://autobuild.buildroot.org/?reason=uboot-tools-2017.03

I don't directly have a need for those bindings, would a patch that
disables this swig detect be reasonable at this point?  Other option
would be to rewrite how they're doing it to search a prefix path vs
using the shell's which.  Then work upstreaming of that change.

-Matt
