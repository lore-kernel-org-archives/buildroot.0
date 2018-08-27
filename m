From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 11:38:04 +0200
Subject: [Buildroot] [git commit] dropbear: fix build with non-SSP
 capable toolchain
In-Reply-To: <20180428154800.1D6B57FF68@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 28 Apr 2018 17:37:43 +0200")
References: <20180428154800.1D6B57FF68@busybox.osuosl.org>
Message-ID: <87o9do8803.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=b0aafef6198ee292c4f426295e92cc9b601c2338
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > By default, Dropbear's configure script enables hardening
 > flags. Unfortunately, the check for SSP only uses AC_COMPILE_IFELSE(),
 > and therefore doesn't properly test for the availability of libssp,
 > visible only at link time.

 > In addition, Buildroot passes its own hardening flags, depending on
 > various global options. So, we simply disable hardening flags in
 > Dropbear.

 > This fixes a build failure with non-SSP capable toolchains happening
 > since the bump to 2018.76.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
