From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:47:00 +0200
Subject: [Buildroot] [PATCH-2018.02.x] cramfs: fix minor()/major() build
 failure due to glibc 2.28
In-Reply-To: <20180927150910.17401-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Thu, 27 Sep 2018 17:09:10 +0200")
References: <20180927150910.17401-1-giulio.benetti@micronovasrl.com>
Message-ID: <87tvm72wzf.fsf@dell.be.48ers.dk>
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
 > cramfsck.c and mkcramfs.c where minor() and major() macros are used.

 > Fixes:
 > http://autobuild.buildroot.net/results/8c5/8c5997017568f8be1d2f664998fb2fdc433a51d3/
 > http://autobuild.buildroot.net/results/fad/fad1553d45a8c35ba84c5c340410e99322e21c44/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
