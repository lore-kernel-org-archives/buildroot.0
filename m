From: Ganesh <ganesh45in@gmail.com>
Date: Thu, 30 Apr 2020 07:46:30 -0500 (CDT)
Subject: [Buildroot] When building the net-next kernel,
 buildroot is asking for all the kernel config options one by one to
 enable
In-Reply-To: <20200429144819.74adf0b0@windsurf.home>
References: <1588163575379-0.post@n4.nabble.com>
 <20200429144819.74adf0b0@windsurf.home>
Message-ID: <1588250790324-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>This simply means that your kernel configuration file is not
>"up-to-date" with the kernel version you're using. Due to this, some
>options exist in the kernel for which the values are not specified in
>the kernel configuration file you are providing. So the kernel has to
>ask you whether you want to enable or disable those options.

Thanks Thomas for a quick response. I have few more queries regarding this.

I tried the following today.

1.Without using the buildroot, Inside the kernel root folder tried to build
my config by doing the following:

make ARCH=arm my_kernel_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

This time, the kernel doesn't prompt for my responses and it directly
builds.

With buildroot, it copies the entire kernel into output/build/linux-custom
directory and tries to build from there. There it misses some config so its
prompting my responses.

So, my question is am using the same kernel defconfig in both the methods, I
am able to build within kernel but not from within buildroot. 
What's the difference that is making buildroot to not recognise the options
to be enabled and it is prompting me configure the kernel?

I think am missing something very basic here. I tried with some other kernel
config which are default inside the kernel too still the same issue.

Also am using Windows subsystem for Linux for the build and the kernel is
git cloned to my local directory.(added local.mk to specify the custom path
too).

Thanks,
Ganesh.



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
