From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Mar 2019 23:09:54 +0100
Subject: [Buildroot] [PATCH] package/gqrx: link with libatomic when
 needed
In-Reply-To: <1550841138-57083-1-git-send-email-gwenj@trabucayre.com>
 (Gwenhael Goavec-Merou's message of "Fri, 22 Feb 2019 14:12:18 +0100")
References: <1550841138-57083-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <874l8jk3t9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

 > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > On some architectures, atomic binutils are provided by the libatomic
 > library from gcc. Linking with libatomic is therefore necessary,
 > otherwise the build fails with:

 > sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

 > Fixes:
 >  - http://autobuild.buildroot.net/results/a003ad5324a0c0f55cb8db5d3e5d69bd21999e16/
 >  - http://autobuild.buildroot.net/results/464602175d026d135125e5baa00e0729aec7a931/

 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

We also need to ensure gqrx can only be enabled on architectures where
sync or libatomic is available, so I added that and a comment explaining
why and committed, thanks.

-- 
Bye, Peter Korsgaard
