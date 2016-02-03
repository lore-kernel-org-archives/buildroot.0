From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Feb 2016 00:07:17 +0100
Subject: [Buildroot] [PATCH v9] board: add support for ARM Juno r0 and
 r1 Development Boards
In-Reply-To: <04784686a5d1ac9de8cb2f74b686ae60cd4447a4.1454523321.git.jpinto@synopsys.com>
References: <04784686a5d1ac9de8cb2f74b686ae60cd4447a4.1454523321.git.jpinto@synopsys.com>
Message-ID: <20160204000717.1be2fd28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joao,

On Wed,  3 Feb 2016 18:20:30 +0000, Joao Pinto wrote:
> The Juno ARM Development Platform (ADP) is a software development
> platform for ARMv8-A, it includes the Juno Versatile Express board 
> and an ARMv8-A reference software port available through Linaro.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>

I am not sure why your v9 does not appear in patchwork, but v8 does.
Anyway, this is still not good, because the kernel commit your
defconfig uses no longer exists in the Linaro Git repository, so the
download fails:

>>> linux 0d752ce2de3057e12e220d104beb02744147be4f Downloading
Doing full clone
Cloning into bare repository 'linux-0d752ce2de3057e12e220d104beb02744147be4f'...
fatal: not a tree object

It works for you because you have the tarball'ed kernel in your
$(BR2_DL_DIR), but it won't work for anyone else.

You should make sure to use a commit in a branch that the Linaro
developers will not rebase, otherwise the commit will disappear in the
future.

Also, another problem of your submission is that you're adding two
defconfigs, while there's no reason to do so. The only difference
between the two is the Device Tree to be built. And we can perfectly
build two Device Trees in a single defconfig.

So could you apply the attached patch on top of yours (which addresses
this problem), and squash it with your commit ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-configs-merge-ARM-Juno-configs.patch
Type: text/x-patch
Size: 3505 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160204/c655172c/attachment-0001.bin>
