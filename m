From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 22:50:53 +0100
Subject: [Buildroot] [git commit master 1/1] Use sys-root rather than
 sysroot for the sysroot/staging_dir
In-Reply-To: <201101252239.36666.yann.morin.1998@anciens.enib.fr>
References: <20110125150944.2C7438D244@busybox.osuosl.org>
	<201101252239.36666.yann.morin.1998@anciens.enib.fr>
Message-ID: <20110125225053.49f7660b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Jan 2011 22:39:36 +0100
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> As Thomas said on IRC, I would suggest to revert this. Is there anything
> in BR that depends on the sysroot being named 'sysroot' or 'sys-root' at all,
> or was that just an eye-candy change? (genuine question)

Just for the record, my preference for "sysroot" instead of "sys-root"
is because all sysroot-related options in gcc use the "sysroot"
spelling and not "sys-root" :

 -print-sysroot
 -print-sysroot-headers-suffix
 --sysroot

And all gcc documentation refers to it as the "sysroot" :

`-print-sysroot'
     Print the target sysroot directory that will be used during
     compilation.  This is the target sysroot specified either at
     configure time or using the `--sysroot' option, possibly with an
     extra suffix that depends on compilation options.  If no target
     sysroot is specified, the option prints nothing.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
