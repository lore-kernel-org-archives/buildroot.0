From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Thu, 8 Oct 2015 14:37:25 -0600
Subject: [Buildroot] liquid-dsp: new package
Message-ID: <1444336646-12586-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Liquid-DSP is a DSP library using pure C and only relying on libm.
This patch clones the master branch because the latest tag is quite old,
and configure.ac does not know of armv7|armv8 in that version for instance.

Autoconf requires to include -I(PACKAGE_DIR)/scripts, so I did my best
to have something working, you guys might have suggestions to improve that.

Finally, ./configure does not work with an uclibc toolchain, so I added BR2_TOOLCHAIN_GLIBC
as a dependency. The error is crealf() is not found (<complex.h>). The ARM and NEON
optimizations work fine though.
