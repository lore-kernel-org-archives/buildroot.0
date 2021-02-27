From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:11:35 +0100
Subject: [Buildroot] [PATCH v2] package/fakeroot: fix glibc detection on
 patch for new wrappers
In-Reply-To: <20210221223828.2750676-1-ryanbarnett3@gmail.com> (Ryan Barnett's
 message of "Sun, 21 Feb 2021 16:38:27 -0600")
References: <20210221223828.2750676-1-ryanbarnett3@gmail.com>
Message-ID: <875z2ds7mw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > Commit f45925a951318e9e53bead80b363e004301adc6f add the patch:
 > 0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch

 > which allowed fakeroot to be compiled with GLIBC 2.33 or above.
 > However, this introduce a bug for building with a non-GLIBC based
 > toolchain as a GLIBC macro - __GLIBC_PREREQ - is used on the same line
 > as the detection of GLIBC.

 > Fix this by backporting the fix to this incorrect macro from upstream
 > commit:

 > https://salsa.debian.org/clint/fakeroot/-/commit/8090dffdad8fda86dccd47ce7a7db8840bdf7d7b

 > CC: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
 > ---
 > v1 -> v2:
 >  - added patch as standalone patch (suggested by Yann)

Committed to 2020.11.x, thanks.

The patch does not apply to 2020.02.x. Is it needed there as well?
Presumably yes - Care to send a patch?

Are you really running Buildroot under MacOS? Does that work?

-- 
Bye, Peter Korsgaard
