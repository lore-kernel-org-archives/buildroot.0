From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Aug 2012 12:57:10 +0200
Subject: [Buildroot] [PATCH 02/36] package/sdl: add symlink to sdl-config
In-Reply-To: <1344815664-28138-2-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120813125710.13d0fc69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 13 Aug 2012 01:53:50 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> SDL installs a script-based sdl-config in the sysroot, but some
> packages (eg. QEMU) needs it to be either:
>   - prefixed with the cross-prefix
>   - in the PATH
> 
> So, as sdl-config is a script, and although it is installed in
> the sysroot, it can be run on the host.

Well, that's typically not how we handle this problem. In general, we
pass the complete location of the <foo>-config script to
the ./configure script of the package that needs it. I would prefer if
we could use this solution everywhere instead of having a different
solution in different places for the same problem. Do you know if it
would be possible with Qemu?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
