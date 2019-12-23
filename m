From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:14:30 +0100
Subject: [Buildroot] [PATCH] package/kf5/kf5-kcoreaddons: don't treat ld
 warnings as errors
In-Reply-To: <20191218161957.110979-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 18 Dec 2019 17:19:57 +0100")
References: <20191218161957.110979-1-giulio.benetti@benettiengineering.com>
Message-ID: <87imm6u1tl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Microblaze ld emits warnings like:
 > '
 > FDE encoding in
 > CMakeFiles/KF5CoreAddons.dir/KF5CoreAddons_autogen/mocs_compilation.cpp.o(.eh_frame)
 > prevents .eh_frame_hdr table being created
 > '
 > Since '-Wl,--fatal-warnings' is passed by default, build fails, so don't
 > treat warnings as errors by appending "-Wl,--no-fatal-warnings" to
 > CMAKE_SHARED_LINKER_FLAGS that is previously defined in package
 > dependency kf5-extra-cmake-modules.

 > Fixes:
 > http://autobuild.buildroot.net/results/f19/f198c86930535c50393e17fc7a70fb4f27b096ee/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
