From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:10:38 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] open-plc-utils: fix build with static musl
In-Reply-To: <20181011182013.16467-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 11 Oct 2018 20:20:13 +0200")
References: <20181011182013.16467-1-fontaine.fabrice@gmail.com>
Message-ID: <87d0rzd2hd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Pass TARGET_LDFLAGS to EXTRA_LDFLAGS to fix following issue:
 > /home/buildroot/autobuild/run/instance-3/output/build/host-gcc-final-7.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1545:
 > undefined reference to `raise'

 > Also pass TARGET_CFLAGS to EXTRA_CFLAGS and TARGET_CXXFLAGS to
 > EXTRA_CXXFLAGS and move all these variables to
 > OPEN_PLC_UTILS_MAKE_OPTS for readability

 > Fixes:
 >  - http://autobuild.buildroot.org/results/67bc5e7ac8ae1c49c035b022a394d2f746705cf2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Instead of passing -static to EXTRA_LDFLAGS, use TARGET_LDFLAGS
 >  - pass TARGET_CFLAGS to EXTRA_CFLAGS
 >  - pass TARGET_CXXFLAGS to EXTRA_CXXFLAGS

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
