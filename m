From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 21:24:23 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
In-Reply-To: <trinity-2a19cf41-f081-4123-a978-ca29ae5d3ed0-1426534803053@3capp-gmx-bs11>
References: <trinity-2a19cf41-f081-4123-a978-ca29ae5d3ed0-1426534803053@3capp-gmx-bs11>
Message-ID: <20150316212423.63208b8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Mon, 16 Mar 2015 20:40:03 +0100, Peter Seiderer wrote:

> Did take a look at postgresql-9.4.1/configure.in, the decision is made on
> a variable called $host_os, but used for (what I would call) $target_os:
> 
> - for the bfin test case:
> checking build system type... x86_64-unknown-linux-gnu
> checking host system type... bfin-buildroot-uclinux-uclibc
> 
> - for a buildroot toolchain:
> checking build system type... x86_64-unknown-linux-gnu
> checking host system type... arm-buildroot-linux-uclibcgnueabi

Yes, the "linux" OS is recognized, but not "uclinux", I saw that. But
it means that passing --with-template=linux unconditionally is fine.

> > If that's OK for you, I can adjust this when applying.
> 
> Yes, thats fine with me...

Ok, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
