From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Sep 2010 09:46:11 +0200
Subject: [Buildroot] initramfs disabling
In-Reply-To: <AANLkTim3kn-otz-=x4DsPWEWgvDk=uqLE-X415W7BK6O@mail.gmail.com>
References: <AANLkTim3kn-otz-=x4DsPWEWgvDk=uqLE-X415W7BK6O@mail.gmail.com>
Message-ID: <20100908094611.4b3bf5ea@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 8 Sep 2010 11:05:58 +0400
Sergey Naumov <sknaumov@gmail.com> wrote:

> I want to ask why disabling the option about initrd integration into
> the kernel image leads to disabling of initrd support in the kernel.
> The description of this option tells nothing about disabling initramfs
> support. What I should do if I want separate hand-made initramfs
> image? Unfortunately, it leads to editing internal makefiles of
> buildroot. Can you introduce "FORCE" option in buildroot that forbid
> buildroot to edit kernel and uclibc configuration?

It's true that there no reason why we should forcefully disable the
initramfs in the kernel configuration when initramfs has not been
selected as the root filesystem: we should keep the kernel
configuration as it is, leaving the possibility for the user to
manually manage his initramfs.

Does the following fix works for you :

 http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=for-2010.11/dont-force-no-initramfs&id=350e6d2ca811cb5fedc007f92aa6c17fbbca82d0

 ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
