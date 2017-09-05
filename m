From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 00:02:29 +0200
Subject: [Buildroot] [PATCH] libcurl: fix build on uncommon architectures
In-Reply-To: <20170811183420.12238-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 11 Aug 2017 20:34:20 +0200")
References: <20170811183420.12238-1-thomas.petazzoni@free-electrons.com>
Message-ID: <878thskdmy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since the bump to 7.55.0, libcurl fails to build on a number of
 > uncommon architectures (ARC, OpenRISC, etc.). This is due to upstream
 > commit 73a2fcea0b4adea6ba342cd7ed1149782c214ae3 ("includes: remove
 > curl/curlbuild.h and curl/curlrules.h"), which makes libcurl rely on
 > more architecture-specific related defines in include/curl/system.h.

 > This commit therefore adds a patch that fixes the 32-bit vs. 64-bit
 > detection for all architecture, using gcc's __SIZEOF_LONG__
 > definition. It has been tested successfully with test-pkg on all 47
 > toolchain configurations.

 > Fixes:

 >   http://autobuild.buildroot.net/results/bf26c08cf3267214278674472f931603f69951ae/
 >   (and many similar issues)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
