From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 May 2012 18:14:23 +0200
Subject: [Buildroot] Building For Host as Target
In-Reply-To: <CADwac6DA5MDVkfZDmAO-s2+rPsebpefJ-paTWLzkk0hC_qAOZg@mail.gmail.com>
References: <CADwac6DA5MDVkfZDmAO-s2+rPsebpefJ-paTWLzkk0hC_qAOZg@mail.gmail.com>
Message-ID: <20120503181423.35715875@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 3 May 2012 18:14:49 +0300,
Assaf Inbal <shmuelzon@gmail.com> a ?crit :

> I'm working on a project based on buildroot and I want to have the
> ability to compile my packages for both my MIPS target using an
> external toolchain (which works great) but I also want to be able to
> compile for my host. To be precise, I want to use the local gcc and
> libraries so I will be able to run my packages locally as well.
> I've tried setting an external toolchain path as "/usr" but as a part
> of preparing the target file system everything from my /lib,/etc and
> others are copied to the output directory, which is, well, bad.
> 
> I've also toyed with creating a fake toolchain that was basically
> links to the host's binaries but that also didn't go very well.
> 
> Does anyone have an idea on how I might be able to achieve this?

If it's only for a reduced set of packages, you can implement the host
variant of those packages. They will be built with the native compiler
of your build machine, and will be installed in output/host.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
