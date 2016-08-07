From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 7 Aug 2016 18:40:32 +0200
Subject: [Buildroot] cmake Release build overwrites Os
Message-ID: <20160807164032.GL22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

while doing the m68k patch for assimp, I realized that following is
used to configure cmake based packages:
package/pkg-cmake.mk:           -DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release)

This means that Cmake adds -O3 to the CFLAGS/CXXFLAGS _after_ -Os
and so get used.

Is this the correct behaviour or do I missed something?

best regards
 Waldemar
