From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 15:16:43 +0100
Subject: [Buildroot] [PATCH v2] make: fix build with glibc 2.27
In-Reply-To: <c227a9cdeda9e93de8bd9cb9dd796eddb75ed502.1521321066.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 17 Mar 2018 23:11:06 +0200")
References: <c227a9cdeda9e93de8bd9cb9dd796eddb75ed502.1521321066.git.baruch@tkos.co.il>
Message-ID: <87in9tfoz8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > glibc 2.27 changed _GNU_GLOB_INTERFACE_VERSION to 2. This triggers build
 > of the internal glob implementation in make. This internal
 > implementation needs the __alloca symbol that glibc does not define.

 > Add upstream patch that adds support for _GNU_GLOB_INTERFACE_VERSION 2.

 > Add host-pkgconf dependency for the PKG_CHECK_MODULES macro. This macro
 > is only used for guile, which we currently disable unconditionally. So
 > host-pkgconf is only needed now so that autoreconf generate a valid
 > configure script.

 > Fixes:
 > http://autobuild.buildroot.net/results/8ff/8ff06ad8438cfcac85577b24675dd1d66f7d3d03/
 > http://autobuild.buildroot.net/results/5cc/5ccee6bb332e800e81052a3094746edde83403b1/
 > http://autobuild.buildroot.net/results/841/8418f5ed56dacd6900946e7d56ad36ad03c7bf7e/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: Add a note on the added host-pkgconf dependency (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
