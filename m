From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jun 2010 09:36:35 +0200
Subject: [Buildroot] buildroot and sh4
In-Reply-To: <618052.82706.qm@web23107.mail.ird.yahoo.com>
References: <618052.82706.qm@web23107.mail.ird.yahoo.com>
Message-ID: <20100604093635.3c27d0d1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Philippe,

Thanks for this documentation and your efforts to build a working
demonstration of Buildroot on sh4 with Qemu!

On Thu, 3 Jun 2010 22:08:17 +0000 (GMT)
Philippe Reynes <tremyfr@yahoo.fr> wrote:

> ??? GCC compiler Version => 4.4.x
> ??? Additionnal gcc options => --with-multilib-list=m4,m4-nofpu

Does this actually work ?

To produce a multilib toolchain, you need to build the C library as
many times as you have items in this "with-multilib-list". However, as
far as I understand Buildroot's code to generate toolchains, it only
builds uClibc once. Did you actually check that this multilib thing was
working ?

> I hope this little doc will be usefull, and I'll be pleased to get feedback,

I think it'd be great if we added a target/device/qemu directory, with
target/device/qemu/sh4-rd2 as a sub-directory, containing your kernel
configuration + a small README file saying how to run Qemu. Then, your
Buildroot config file could be added to the configs/ directory. This
ways, others could easily run this.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
