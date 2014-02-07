From: Johannes Morgenroth <morgenroth@ibr.cs.tu-bs.de>
Date: Fri, 07 Feb 2014 09:21:31 +0100
Subject: [Buildroot] SIGSEGV in __pthread_initialize_minimal_internal ()
In-Reply-To: <52F3F866.5000701@mind.be>
References: <52F3B2BC.3000904@ibr.cs.tu-bs.de> <52F3F866.5000701@mind.be>
Message-ID: <52F4978B.8040707@ibr.cs.tu-bs.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

thank you for the response.

Am 06.02.2014 22:02, schrieb Arnout Vandecappelle:
>  You're trying to use the cross-compiled binary directly on your host.
> This may work by accident, but may not work as well. In this particular
> case, I suspect it may be an issue with kernel headers: the cross-build
> is using 3.13.x while your host is probably running an earlier kernel.
>
>  Try running it under a system qemu so you have the corresponding kernel,
> or build the toolchain with kernel headers corresponding to your host.
>
>  Regards,
>  Arnout

The binary is compiled using and for x86. Thus, starting on the same
system should work and actually it had worked with older releases (at
least with 2012.02). I could not test the kernel issue you mentioned
because the system runs a 3.8 and buildroot only support older or newer
one. I tried both 3.2 and 3.13, none of them had worked. However, I do
not understand why a statically linked binary should depend on the
system kernel it runs on. Also this was never an issue with release 2012.02.

Kind regards,
Johannes Morgenroth

-- 
Johannes Morgenroth     Institut fuer Betriebssysteme und Rechnerverbund
Tel.: +49-531-391-3249                           Muehlenpfordtstrasse 23
Fax.: +49-531-391-5936      TU Braunschweig         D-38106 Braunschweig
