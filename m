From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Dec 2012 10:03:44 +0100
Subject: [Buildroot] Chances in skeleton don't appear in filesystem
In-Reply-To: <slrnkbqn5h.1p8.narkewoody@zuhnb712.local.com>
References: <slrnkbqn5h.1p8.narkewoody@zuhnb712.local.com>
Message-ID: <20121204100344.3167d0e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Tue, 4 Dec 2012 02:16:11 +0000 (UTC), Woody Wu wrote:

> After some intial builds, I come up with idea to make chances in the
> default filesystem contents. Then I change the config to use customized
> filesystem skeleton (fs/skeleton) and changed the
> fs/skeleton/network/interfaces with expection that change could appear
> in the generated target file system.  After another run of make,
> however, I did not see my chances by untar the rootfs.tar.bz2.

The skeleton is copied to output/target during the first make, and is
not copied again during subsequent invocations of make. If you want to
see your filesystem skeleton changes to be taken into account, you have
to do a "make clean; make" cycle.

>  Then I
> tried to remove the output/target directory, this time I even got
> another error, 'output/target/etc/hosts: no such file or directory'.

Removing the output/target directory does not make sense and cannot
work. Buildroot does not know that it has been removed and therefore
does not retrigger the installation of all packages.

> What's the correct method to modify the defualt filesystem? Thanks.

Do use a custom skeleton, use a custom post-build script to copy/modify
files in output/target. See
http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf starting
slide 22, and particularly slides 24 and 25.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
