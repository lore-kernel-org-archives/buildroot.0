From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Sep 2012 22:15:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-09-14
In-Reply-To: <20120915063228.2C36B52D5D8@lolut.humanoidz.org>
References: <20120915063228.2C36B52D5D8@lolut.humanoidz.org>
Message-ID: <20120916221531.5d7d1293@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Sep 2012 08:32:28 +0200 (CEST), Thomas Petazzoni wrote:

> Build 6f9c09d76af40e57eb2963df80fcf15f2709aa04
> ==============================================
> 
> Status         : NOK
> Failure reason : make: *** [/home/test/test/output/stamps/ext-toolchain-checked] Error 1
> Architecture   : powerpc
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-09-14 01:47:51
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=ef500345220e72d8dda96a380ca083351529255f
> End of log     : http://autobuild.buildroot.net/results/6f9c09d76af40e57eb2963df80fcf15f2709aa04/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/6f9c09d76af40e57eb2963df80fcf15f2709aa04/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/6f9c09d76af40e57eb2963df80fcf15f2709aa04/config
> Defconfig      : http://autobuild.buildroot.net/results/6f9c09d76af40e57eb2963df80fcf15f2709aa04/defconfig

Fixed. It was a wrong default toolchain configuration in the
autobuilder: the configuration was still referencing a
locally-installed toolchain, which doesn't exist anymore since now all
toolchains are hosted at
http://autobuild.buildroot.org/toolchains/tarballs/.

Configuration fixed on the autobuilder machine and on
http://autobuild.buildroot.org/toolchains/configs/free-electrons/ctng-powerpc-e500v2-eglibc.config
as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
