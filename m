From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:15:39 +0200
Subject: [Buildroot] [git commit] libnspr: use __nios2__ instead of nios2
In-Reply-To: <20170406141359.88F768271B@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 6 Apr 2017 16:13:52 +0200")
References: <20170406141359.88F768271B@busybox.osuosl.org>
Message-ID: <87a875zkf8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=9a521546ed553d2be23740bbf1a7aa05bce9eb09
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Our patch adding nios2 support to libnspr uses the built-in compiler
 > define "nios2". However, this doesn't work with C++11, where only the
 > __nios2__ define is available. Since __nios2__ is always available,
 > use that instead:

 > $ ./output/host/usr/bin/nios2-linux-gcc -dM -E - < /dev/null | grep -E "( nios2 | __nios2__ )"

 > $ ./output/host/usr/bin/nios2-linux-gcc -std=c++11 -x c++ -dM -E - < /dev/null | grep -E "( nios2 | __nios2__ )"

 > Patch 0001-nios2.patch is therefore changed to use __nios2__ (the rest
 > of the change noise is due to using quilt to format the patch). Patch
 > 0002-microblaze.patch is simply updated to apply correctly on top of
 > the modified 0001-nios2.patch.

 > This fixes the build of the poppler library on nios2. It is built with
 > -std=c++11, and includes nspr headers (through nss), causing a build
 > issue.

 > Fixes:

 >   http://autobuild.buildroot.net/results/9fee58076157d814616fa0da51afde8da21a8973/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
