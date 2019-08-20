From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:35:11 +0200
Subject: [Buildroot] [PATCH v3] package/libnss: use correct CFLAGS and
 LDFLAGS
In-Reply-To: <20190729142610.21331-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Mon, 29 Jul 2019 16:26:10 +0200")
References: <20190729142610.21331-1-giulio.benetti@micronovasrl.com>
Message-ID: <8736hv9a74.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > Actually libnss is configure with BUILD_OPT=1 that doesn't take into
 > account TARGET_CFLAGS nor TARGET_LDFLAGS resulting in pre-chosen
 > optimizations and debugging symbols.

 > Can't pass TARGET_CFLAGS through CFLAGS or similar otherwise other
 > internal libnss one will be overwritten(i.e. -fPIC), so prefer to append
 > TARGET_CFLAGS at the end of Linux.mk as well as TARGET_LDFLAGS according
 > to internal libnss Makefile system's names. And obviously remove
 > BUILD_OPT=1 from BUILD_VARS. This reveals hidden bugs when building
 > with -Os due to uninitialized variables so add patches to fix those
 > bugs.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x and 2019.05.x, thanks (after the changes done by
Thomas to not patch).

-- 
Bye, Peter Korsgaard
