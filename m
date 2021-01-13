From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Jan 2021 22:33:44 +0100
Subject: [Buildroot] Per package src+build directory
In-Reply-To: <1610516510799-0.post@n4.nabble.com>
References: <1610516510799-0.post@n4.nabble.com>
Message-ID: <6bc15ec5-a4eb-a223-b6bb-7b054cf9343a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/01/2021 06:41, scdrj wrote:
> How do I set a custom src/build directory for a particular package?

 That is not possible, period. Only the source can be overriden, but as you say,
it's always rsync'ed to the build directory.


> I have tried OVERRIDE_SRCDIR, but it always performs rsync to the build
> folder (makes an extra copy).
> 
> I want to perform the in-place build. 

 Is there a specific reason to want this? Doing the build inside the source
directory is not a good idea for many reasons.

 If it's for the size or the build time - normally, the compilation itself
should take a lot more time and produce a much bigger output, so the overhead
should be negligible.

 If it's because there's a large subtree that isn't actually used, *that* can be
avoided by using package-specific excludes, with
_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS (which is just a list of rsync argument, so
you can actually put anything there).


 Regards,
 Arnout

> Currently, I am doing it by creating a symbolic link in the build folder
> from the original src directory and by manually creating various
> downloaded/patched/extracted ".stamp_XXXXXX" files.
> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
