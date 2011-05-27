From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2011 09:42:29 +0200
Subject: [Buildroot] How to generete initramfs inside kernel img.
In-Reply-To: <4DDECB33.6070402@opensoftware-br.com>
References: <4DDECB33.6070402@opensoftware-br.com>
Message-ID: <20110527094229.51283209@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Paulo,

On Thu, 26 May 2011 18:50:43 -0300
Paulo Carvalho Silva <psilva@opensoftware-br.com> wrote:

> I am using buildroot-2011-02, without a problem, the tools is the
> best one, because I tryied a several others.
> 
> I want to generate initramfs inside the kernel image, but I searched
> how to do that, and the unique information found, is the setup of
> initramfs into the kernel's config file, but buildroot always
> generate it in a separate file.
> 
> I got a kernel image with initramfs inside it, but using another 
> method,I downloaded kernel sources, patched it, configured it and 
> compiled it, but I want to use buildroot for all steps, bootstrap, 
> u-boot and kernel.

If you compile your kernel with Buildroot, then there is an option in
"Target filesystem formats", called "initramfs", that will
automatically bundle your initramfs filesystem inside the kernel image,
by adjusting the kernel configuration and re-running the kernel
compilation.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
