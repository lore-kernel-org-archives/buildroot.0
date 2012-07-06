From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Jul 2012 09:34:42 +0200
Subject: [Buildroot] [PATCH] syslinux: bump to 4.05
In-Reply-To: <4FF5F191.4050404@mind.be>
References: <CAJkQPOm7x8898X-bjDhN+LRN_EY8wR46WWj7hZmFOD0Q8YiASA@mail.gmail.com>
 <4FF5F191.4050404@mind.be>
Message-ID: <20120706093442.336eee45@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 05 Jul 2012 21:57:05 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   It looks like the syslinux build system is as broken as the one of
> grub; we currently don't actually cross-compile, but use the host
> compiler in the assumption that it's an x86 multilib compiler...
> 
>   I'll fix it (still using the host compiler for the time being) and
> resend your patch.

Yes, just like Grub, I think we should use the host compiler, otherwise
if the targeted system is x86-64, our cross-compiling toolchain will be
64 bits only, and we won't be able to build syslinux or grub.

At some point, Jean-Christophe Plagnol-Villard made a patch that
allowed some packages to depend on the host architecture (so that
things like SAM-BA wouldn't be shown). Maybe we need to use something
like this to hide syslinux/grub when the host architecture is not
x86/x86-64.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
