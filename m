From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Fri, 4 Jun 2010 22:12:51 +0000 (GMT)
Subject: [Buildroot] buildroot and sh4
In-Reply-To: <20100604093635.3c27d0d1@surf>
Message-ID: <942768.62333.qm@web23105.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I've checked my additionnal gcc options, and here the result :

If I don't add --with-multilib-list=m4,m4-nofpu, the kernel compilation fails with
the following error :

make[1]: entrant dans le r?pertoire ? /home/trem/mes_codes/buildroot/temp/buildroot/output/build/linux-2.6.33.4 ?
? CHK???? include/linux/version.h
? UPD???? include/linux/version.h
? CHK???? include/generated/utsrelease.h
? UPD???? include/generated/utsrelease.h
? Generating include/generated/machtypes.h
? CC????? kernel/bounds.s
cc1: error: command line option '-m4-nofpu' is not supported by this configuration
cc1: error: command line option '-m4-nofpu' is not supported by this configuration
make[2]: *** [kernel/bounds.s] Erreur 1
make[1]: *** [prepare0] Erreur 2
make[1]: quittant le r?pertoire ? /home/trem/mes_codes/buildroot/temp/buildroot/output/build/linux-2.6.33.4 ?
make: *** [/home/trem/mes_codes/buildroot/temp/buildroot/output/build/linux-2.6.33.4/.depend_done] Erreur 2


If I add --with-multilib-list=m4,m4-nofpu, the kernel compilation works fine.


As others, I think that adding a directory target/device/qemu, and give
a working configuration for building an image that run on qemu is a nice idea.
I add the sh architecture to my todo list.

Philippe


--- En date de?: Ven 4.6.10, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit?:

De: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Objet: Re: [Buildroot] buildroot and sh4
?: buildroot at busybox.net
Date: Vendredi 4 juin 2010, 9h36

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
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100604/9509e1c9/attachment.html>
