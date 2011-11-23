From: Adriano Campos <adrianoribeirocampos@gmail.com>
Date: Wed, 23 Nov 2011 14:18:59 +0000
Subject: [Buildroot] buildroot Digest, Vol 65, Issue 80
In-Reply-To: <mailman.11448.1321997339.2942.buildroot@busybox.net>
References: <mailman.11448.1321997339.2942.buildroot@busybox.net>
Message-ID: <CAOiFVFuvd4Y-=C+ySmqXvZj-r94r=42FR-XtMYfActeqqgjeAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
>
> ------------------------------
>
> Message: 5
> Date: Tue, 22 Nov 2011 21:15:31 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] include the Xenomai in kernel linux
> Message-ID: <20111122211531.59014007@skate>
> Content-Type: text/plain; charset=UTF-8
>
> Le Tue, 22 Nov 2011 18:56:53 +0000,
> Adriano Campos <adrianoribeirocampos@gmail.com> a ?crit :
>
> > I'm trying to include the Xenomai in kernel linux with buildroot but
> > I have not been successful.
> > I apply the adeos patch and then compile the kernel with buildroot
> > but the image is always equal and ADEOS / Xenomai not appear. Where
> > should I paste the folder Xenomai?
>
> We have support for Xenomai in Buildroot, so you don't have to patch
> your kernel manually. See Kernel -> Linux Kernel Extensions ->
> Adeos/Xenomai. Of course, you must select a kernel version that is
> supported by Xenomai for your particular architecture.
>
> Note that this is not available in 2011.08, only in the current
> 2011.11-rcX versions or the Git version of Buildroot. It will be part
> of the upcoming 2011.11 release.
>
> Don't hesitate to let us know if you have problems using this.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
>
Hello,
Thanks for reply.
I made the manual changes in  version 2011.08 of buildroot and work fine.
Now I start the linux with qemu and it is ok. But when I try use the
usr/xenomai/bin/xenomai-test it get the following error. Do you know this
error? How I know if Adeos and Xenomai are installed correctly? My
aplication is for ARM and I have few aplications.
Best Regards,
Adriano Campos

+# ./xeno-test
+Started child 73: /bin/sh /usr/xenomai/bin/xeno-test-run-wrapper
./xeno-test
+/usr/xenomai/bin/xeno-test-run-wrapper: ./xeno-test: line 43: can't create
/proc/xenomai/latency: nonexistent +directory
+ echo 0
+ :
+ /usr/xenomai/bin/arith
+Xenomai: native skin or CONFIG_XENO_OPT_PERVASIVE disabled.
+(modprobe xeno_native?)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111123/05e41079/attachment-0001.html>
