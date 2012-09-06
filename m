From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Sep 2012 15:15:42 +0200
Subject: [Buildroot] Autobuild and linux-pam failing to compile
In-Reply-To: <CADiAo4KUj5s7UO8yZf5OcbY3VsaekJWNpjxSmpd8r_qf1MMJKQ@mail.gmail.com>
References: <CADiAo4KUj5s7UO8yZf5OcbY3VsaekJWNpjxSmpd8r_qf1MMJKQ@mail.gmail.com>
Message-ID: <20120906151542.31796360@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 6 Sep 2012 08:59:16 -0400,
Dmitry Golubovsky <golubovsky@gmail.com> a ?crit :

> I looked into several other autobuild failures on linux-pam (arches
> other than x686): it looks like all of them use external toolchains,
> and all fail on ndbm linking.
> 
> When using an external toolchain, is it possible to force a specific
> feature from within buildroot config?
> 
> Also, whoever configured those toolchains, can you let me know whether
> they include ndbm at all?

All the external toolchains that are used on the Free Electrons build
server are publicly available, so you can download them.

For example, let's take the
http://autobuild.buildroot.net/results/9dfa1389151ef369c7d0aea63c84f85eca45d402/
build that you were mentioning in your previous e-mail as a build that
fails in linux-pam on x86-64.

Look at the defconfig:
http://autobuild.buildroot.net/results/9dfa1389151ef369c7d0aea63c84f85eca45d402/defconfig.
You see that the toolchain used is
http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full.tar.bz2.
You can even take this defconfig and reproduce the build problem on
your machine.

All the configuration that are built on the Free Electrons build server
can be reproduced anywhere: they do not depend to anything that isn't
publicly available.

See also
http://lists.busybox.net/pipermail/buildroot/2012-August/057876.html

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
