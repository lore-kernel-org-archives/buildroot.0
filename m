From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 02 Sep 2012 10:32:40 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-09-01
In-Reply-To: <20120902063244.629BF428001@lolut.humanoidz.org>
References: <20120902063244.629BF428001@lolut.humanoidz.org>
Message-ID: <504319A8.5070903@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 02.09.2012 08:32, schrieb Thomas Petazzoni:
> Hello,
>
> On 2012-09-01, 83 random build tests have been done and
> submitted on autobuild.buildroot.net.
>  56 builds have been successful
>  27 builds have failed
>
>
> Build 225b282a1e6ebf8f754d176a6732d80111856d8e
> ==============================================
>
> Status         : NOK
> Failure reason : alsa-lib-1.0.25
> Architecture   : bfin
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-09-01 06:51:36
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=666eb02be3cd4115a1ef8b78a63d64d12b24469e
> End of log     : http://autobuild.buildroot.net/results/225b282a1e6ebf8f754d176a6732d80111856d8e/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/225b282a1e6ebf8f754d176a6732d80111856d8e/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/225b282a1e6ebf8f754d176a6732d80111856d8e/config
> Defconfig      : http://autobuild.buildroot.net/results/225b282a1e6ebf8f754d176a6732d80111856d8e/defconfig
>
Hello,

I just started looking at this. The cause of the problem is that the
tool chain lacks suppot for the "versionsort" routine.

In uClinux there is a patch adding a versionsort to alsalib locally, but
this doesn't seem to be a good solution to me, especially since I assume
that most other toolchains have versionsort so that such a patch would
breal other architectures.

There are also some other patches for alsa-lib that would be needed to
support blackfin. How shall we handle such architecture dependent patches?

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
