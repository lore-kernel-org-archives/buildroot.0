From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Aug 2011 16:17:13 +0200
Subject: [Buildroot] external buildroot toolchain: LD_LIBRARY_PATH needed
Message-ID: <CAAXf6LV8wL4wAp1eETK7mtwqCFCgoJWFBScnhGzhERZMs2R+Ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

If I build a buildroot toolchain on machine A, package the
output/host/usr directory and use that as an external toolchain on
machine B, I get errors that cc1 cannot find libmpfr.so.4.
The location of that library is hardcoded in some compiler tools, and
since we are on another machine, the original location does not exist.

I can work around this by specifying
LD_LIBRARY_PATH=<buildroot>/output/host/opt/ext-toolchain/lib in the
environment, but this is an annoying and not so clean solution.

How is this supposed to work?
How do other external toolchains handle this?

Thanks,
Thomas
