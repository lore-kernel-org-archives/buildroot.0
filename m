From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Feb 2021 18:00:41 +0100
Subject: [Buildroot] [PATCH 2020.02.x] package/fakeroot: fix glibc
 detection on patch for new wrappers
In-Reply-To: <20210227194338.54649-1-ryanbarnett3@gmail.com> (Ryan Barnett's
 message of "Sat, 27 Feb 2021 13:43:38 -0600")
References: <20210227194338.54649-1-ryanbarnett3@gmail.com>
Message-ID: <87pn0kqg92.fsf@dell.be.48ers.dk>
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

 > CC: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
 > ---
 > Backport to: 2020.02.x from commit
 > e41b170b328cc086334948ff3b8038075e2c09ce

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
