From: Assaf Inbal <shmuelzon@gmail.com>
Date: Thu, 3 May 2012 23:14:30 +0300
Subject: [Buildroot] Building For Host as Target
In-Reply-To: <20120503181423.35715875@skate>
References: <CADwac6DA5MDVkfZDmAO-s2+rPsebpefJ-paTWLzkk0hC_qAOZg@mail.gmail.com>
 <20120503181423.35715875@skate>
Message-ID: <1654518205551106600@unknownmsgid>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

While host variants will run, it means that I still need to compile for
some target platform. The output in the host directory will also include
many other things not needed. Unless someone will come up with a better
idea, I'm considering creating a new toolchain type (along side with
buildroot and "external"). If I'll be pleased with the result I'll post a
patch.

Thanks



On 3 ???? 2012, at 19:14, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

Le Thu, 3 May 2012 18:14:49 +0300,
Assaf Inbal <shmuelzon@gmail.com> a ?crit :

I'm working on a project based on buildroot and I want to have the

ability to compile my packages for both my MIPS target using an

external toolchain (which works great) but I also want to be able to

compile for my host. To be precise, I want to use the local gcc and

libraries so I will be able to run my packages locally as well.

I've tried setting an external toolchain path as "/usr" but as a part

of preparing the target file system everything from my /lib,/etc and

others are copied to the output directory, which is, well, bad.


I've also toyed with creating a fake toolchain that was basically

links to the host's binaries but that also didn't go very well.


Does anyone have an idea on how I might be able to achieve this?


If it's only for a reduced set of packages, you can implement the host
variant of those packages. They will be built with the native compiler
of your build machine, and will be installed in output/host.

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120503/3a8f9e08/attachment.html>
