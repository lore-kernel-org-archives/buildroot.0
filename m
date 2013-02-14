From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 14 Feb 2013 22:21:49 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-02-12
In-Reply-To: <20130213073425.9C3C052C6D2@lolut.humanoidz.org>
References: <20130213073425.9C3C052C6D2@lolut.humanoidz.org>
Message-ID: <511D556D.3060503@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hello,
>
> On 2013-02-12, 152 random build tests have been done and
> submitted on autobuild.buildroot.net.
>   104 builds have been successful
>   48 builds have failed
>
> Below the results of the failed builds. Successful builds are omitted.
>
...
> Build 648265012591280fa592a239f86ee39aec2d5fa6
> ==============================================
>
> Status         : NOK
> Failure reason : qt-4.8.4
> Architecture   : arm
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2013-02-12 07:22:08
> Git commit ID  :http://git.buildroot.net/buildroot/commit/?id=6056de8971bf25c9853c38583dc50b5abcb982de
> End of log     :http://autobuild.buildroot.net/results/648265012591280fa592a239f86ee39aec2d5fa6/build-end.log
> Complete log   :http://autobuild.buildroot.net/results/648265012591280fa592a239f86ee39aec2d5fa6/build.log.bz2
> Configuration  :http://autobuild.buildroot.net/results/648265012591280fa592a239f86ee39aec2d5fa6/config
> Defconfig      :http://autobuild.buildroot.net/results/648265012591280fa592a239f86ee39aec2d5fa6/defconfig

This is a build with Linaro 2012.11. Linaro 2013.01 fails with the same 
message.
Building with Sourcery 2011.03 succeeds.

The log ends with an issue about precompiled headers:

> moc util/qcompleter.h
> compiling ../3rdparty/pixman/pixman-arm-neon-asm.S
> cc1: fatal error: .pch/release-shared-emb-arm/QtGui: No such file or directory
> compilation terminated.


I don't know the exact cause, but adding -no-pchto QT_CONFIGURE_OPTS 
makes it
compile again with Linaro.

Should I send a patch to set -no-pch? I'm reluctant because it's not a real
fix, and compile time could increase significantly, I guess.

Thomas, this probably affects Qt5 Beta 1 as well, according to this blog 
post:
http://gpupowered.org/node/14. Would you mind testing it on your Qt5 branch?

Luca
