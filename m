From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 22 Apr 2008 00:07:57 +1000
Subject: [Buildroot] Improper device nodes created
	inside	project_build_arm/uclibc/root/dev/
In-Reply-To: <16803332.post@talk.nabble.com>
References: <16803332.post@talk.nabble.com>
Message-ID: <20080421140757.GC21702@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 20, 2008 at 11:14:31PM -0700, Hebbar wrote:
> I am trying to build arm9 toolchain using recent buildroot toolchain.
> everything works fine except the device nodes inside my
> project_build_arm/uclibc/root/dev/ directory.
> 
> oot at guru_vlinux:/opt/buildroot_plain# ls -la
> project_build_arm/uclibc/root/dev/
> total 0
> drwxr-xr-x  3 root root 192 Apr 17 23:23 .
> drwxr-xr-x 16 root root 408 Apr 17 22:44 ..
> -rw-rw-rw-  1 root root   0 Apr 18 00:36 console

That's normal. They are only real devices within the fakeroot instance
used during the build. They are only normal files on disk (fakeroot is
playing tricks). Outside of fakeroot you see the regular files.

> I have to manualy delete them and cp the basic one from my system root/dev.

You should not need to do that.

What output image format are you using? (ext2fs etc)? Please post the
output of the final stages of make, where the fakeroot script is
generated and the image creation tool is run.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
