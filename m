From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:20:42 +0200
Subject: [Buildroot] [git commit] package/flare-engine: re-enable
 package on microblaze
In-Reply-To: <20190527213701.2BAC18DAA9@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Mon, 27 May 2019 23:37:42 +0200")
References: <20190527213701.2BAC18DAA9@busybox.osuosl.org>
Message-ID: <87ftomivud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=1203cca1b51eefb4ee236d998ab6ec32bdd087d8
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > With Microblaze Gcc version < 8.x the build hangs due to bug 85180:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
 > To avoid this, the flare-engine package has a
 > !BR2_TOOLCHAIN_HAS_GCC_BUG_85180 dependency. However, gcc bug 85180 only
 > triggers when optimization is enabled, so we can work around the issue
 > by passing -O0, which is what we do in other Buildroot packages to work
 > around this bug.

 > So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_85180, and
 > re-enables flare-engine on Microblaze. It is not enough to set
 > CMAKE_CXX_FLAGS, because flare-engine's CMakeLists.txt sets
 > CMAKE_CXX_FLAGS_<BUILD_TYPE> (depending on the value of
 > CMAKE_BUILD_TYPE), and the build-type-specific flags come after the
 > generic flags, so our -O0 gets overridden again. Therefore, also set
 > CMAKE_BUILD_TYPE to the dummy value Buildroot.

 > Fixes:
 > http://autobuild.buildroot.net/results/706/7065e14917a8bbc0faf21b29183ac55b6c800ee3/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > [Arnout: extend explanatory comment and update commit log]
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
