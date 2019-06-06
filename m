From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:44:36 +0200
Subject: [Buildroot] [PATCH] package/gcc: don't build a toolchain for
 powerpc with spe ABI with gcc >= 8.x
In-Reply-To: <20190526201542.18904-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 26 May 2019 22:15:42 +0200")
References: <20190526201542.18904-1-romain.naour@gmail.com>
Message-ID: <87y32een17.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The powerpc*-*-*spe* support has been deprecated in GCC 8 [1] and has
 > been removed in GCC 9 [2].

 > While building with GCC 8, the build stop since we don't provide --enable-obsolete
 > option.

 > For now, keep powerpcspe support in Buildroot but only for older compiler
 > up to GCC 7.

 > Note: Although we can't select Glibc for powerpcspe since commit [4], this
 > support has been removed for the next version of Glibc (the upcoming 2.30).

 > [1] https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 > [2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=b31d0348ddada49453e3edaaf93a423fdc61dc79
 > [3] https://sourceware.org/git/?p=glibc.git;a=commit;h=a053e878494080f7070cf92890e546057236c9c9
 > [4] https://git.buildroot.net/buildroot/commit/?id=5777e3ffd99132a57e3d29659850eec14b1625f8

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
