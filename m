From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Nov 2018 10:06:51 +0100
Subject: [Buildroot] [PATCH] Config.in: security hardening: disable
 FORTIFY_SOURCE for gcc < 6
In-Reply-To: <20181105200750.6039-1-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 5 Nov 2018 21:07:50 +0100")
References: <20181105200750.6039-1-romain.naour@gmail.com>
Message-ID: <87y3a6bmms.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As reported in the bug report [1], gcc < 6 doesn't build when
 > FORTIFY_SOURCE is set to 1 or 2. The issue is related to the
 > upstream bug report [2] but the patch fixing the issue for gcc 6
 > has not been backported to earlier gcc versions.

 > Add a dependency on gcc at least version 6 to BR2_FORTIFY_SOURCE_1
 > and BR2_FORTIFY_SOURCE_2.

 > [1] https://bugs.busybox.net/show_bug.cgi?id=11476
 > [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61164
 > [3] https://github.com/gcc-mirror/gcc/commit/55f12fce4ccf77513644a247f9c401a5b1fa2402

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > To be backported up to Buildroot 2018.02.x.

Committed after adding the internal toolchain dependency as pointed out
by Matthew, thanks.

-- 
Bye, Peter Korsgaard
