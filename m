From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2011 15:26:24 +0100
Subject: [Buildroot] buildroot Digest, Vol 65, Issue 80
In-Reply-To: <CAOiFVFuvd4Y-=C+ySmqXvZj-r94r=42FR-XtMYfActeqqgjeAQ@mail.gmail.com>
References: <mailman.11448.1321997339.2942.buildroot@busybox.net>
 <CAOiFVFuvd4Y-=C+ySmqXvZj-r94r=42FR-XtMYfActeqqgjeAQ@mail.gmail.com>
Message-ID: <20111123152624.5b5cb050@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 23 Nov 2011 14:18:59 +0000,
Adriano Campos <adrianoribeirocampos@gmail.com> a ?crit :

> Thanks for reply.
> I made the manual changes in  version 2011.08 of buildroot and work fine.
> Now I start the linux with qemu and it is ok. But when I try use the
> usr/xenomai/bin/xenomai-test it get the following error. Do you know this
> error? How I know if Adeos and Xenomai are installed correctly? My
> aplication is for ARM and I have few aplications.
> Best Regards,
> Adriano Campos
> 
> +# ./xeno-test
> +Started child 73: /bin/sh /usr/xenomai/bin/xeno-test-run-wrapper
> ./xeno-test
> +/usr/xenomai/bin/xeno-test-run-wrapper: ./xeno-test: line 43: can't create
> /proc/xenomai/latency: nonexistent +directory
> + echo 0
> + :
> + /usr/xenomai/bin/arith
> +Xenomai: native skin or CONFIG_XENO_OPT_PERVASIVE disabled.
> +(modprobe xeno_native?)

Looks like your kernel configuration is wrong and does not have Xenomai
enabled, or some other Xenomai options needed to
have /proc/xenomai/latency available.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
