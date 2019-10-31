From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:48:06 +0100
Subject: [Buildroot] [PATCH] package/grpc: work around gcc bug 85180
In-Reply-To: <20191028115010.49361-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Mon, 28 Oct 2019 12:50:10 +0100")
References: <20191028115010.49361-1-giulio.benetti@benettiengineering.com>
Message-ID: <87tv7ovdyx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > With Microblaze Gcc version < 8.x the build hangs due to gcc bug
 > 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
 > shows up when building grpc with optimization but not when building
 > with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
 > force using -O0. Doing this let's optimize already present
 > CFLAGS/CXXFLAGS tweaking by introducing GRPC_CFLAGS and GRPC_CXXFLAGS
 > variable.

 > Fixes:
 > http://autobuild.buildroot.net/results/6f3/6f301904002cdd50dc3a66fe782b04a05b116319/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
