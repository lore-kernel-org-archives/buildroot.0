From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 16:46:51 +0200
Subject: [Buildroot] [PATCH] android-tools: fix minor()/major() build
 failure due to glibc 2.28
In-Reply-To: <20180909095939.17089-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Sun, 9 Sep 2018 11:59:39 +0200")
References: <20180909095939.17089-1-giulio.benetti@micronovasrl.com>
Message-ID: <87d0strag4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
 > and therefore <sys/sysmacros.h> must be included explicitly when
 > major()/minor() are used.

 > This commit adds a patch to directly include <sys/sysmacros.h> into
 > all usb_linux.c files where minor() and major() macros are used.

 > Fixes:
 > http://autobuild.buildroot.net/results/901/9011c6af71fb81988c2a05f2acee913a2bae2eff//
 > http://autobuild.buildroot.net/results/142/142c5672fdc44f2d68f18df3509e5051b3295df5//
 > http://autobuild.buildroot.net/results/b55/b55aa69654e758af5232ae69618ba1ea5c245074//

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
