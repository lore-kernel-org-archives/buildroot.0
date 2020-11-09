From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 21:36:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-m2crypto: fix build on
 arm and mips
In-Reply-To: <20201108172822.63987-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 Nov 2020 18:28:22 +0100")
References: <20201108172822.63987-1-fontaine.fabrice@gmail.com>
Message-ID: <87blg6qncn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build failure on arm and mips (perhaps also other)
 > Fixes:
 >  - http://autobuild.buildroot.org/results/7f63e6a2d8681cc3408f344556afd5dd16eb7368
 >  - http://autobuild.buildroot.org/results/d115a082418321e7dc4715c635f94b30b3cad387

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  ...swig-default-includes-before-openssl.patch | 53 +++++++++++++++++++
 >  1 file changed, 53 insertions(+)
 >  create mode 100644 package/python-m2crypto/0001-setup.py-move-swig-default-includes-before-openssl.patch

 > diff --git
 > a/package/python-m2crypto/0001-setup.py-move-swig-default-includes-before-openssl.patch
 > b/package/python-m2crypto/0001-setup.py-move-swig-default-includes-before-openssl.patch
 > new file mode 100644
 > index 0000000000..57fbd0126c
 > --- /dev/null
 > +++ b/package/python-m2crypto/0001-setup.py-move-swig-default-includes-before-openssl.patch
 > @@ -0,0 +1,53 @@
 > +From 1aab31787a8d1ef9436d9cf81832691f729b6282 Mon Sep 17 00:00:00 2001
 > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > +Date: Sat, 7 Nov 2020 23:26:30 +0100
 > +Subject: [PATCH] setup.py: move swig default includes before openssl
 > +
 > +Move swig default includes before openssl to avoid the following build
 > +failure when cross-compiling for some architectures (e.g. arm, mips):
 > +
 > +swig -python -py3 -D__x86_64__
 > -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/python3.9
 > -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include
 > -I/srv/storage/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/openssl
 > -I/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/8.3.0/include
 > -I/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/8.3.0/include-fixed
 > -I/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/8.3.0/../../../../mipsel-buildroot-linux-gnu/include

The mailer / patchwork didn't like this very long line, so I had to fix
that up manually and commit, thanks.

-- 
Bye, Peter Korsgaard
