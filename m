From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jul 2016 08:29:52 +0200
Subject: [Buildroot] [PATCH v11 2/2] docker-engine: new package
In-Reply-To: <068F07A4-A28B-4AA9-B57B-5524079EDFC9@gmail.com>
References: <1469394628-19412-1-git-send-email-christian@paral.in>
 <1469394628-19412-2-git-send-email-christian@paral.in>
 <20160727234055.2dad417f@free-electrons.com>
 <068F07A4-A28B-4AA9-B57B-5524079EDFC9@gmail.com>
Message-ID: <20160728082952.4a7872c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Jul 2016 18:57:32 -0700, Khem Raj wrote:

> you would need atleast go 1.5+ for dynamic libraries support. If thats not an issue
> then simply change the build cmds to something like
> 
> go build -linkshared ...

We have go 1.6.2, and it *does* link with dynamic libraries, see below:

> > $ arm-linux-gnueabihf-readelf -d output/target/usr/bin/dockerd | grep NEEDED
> > 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
> > 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
> > 0x00000001 (NEEDED)                     Shared library: [libdevmapper.so.1.02]
> > 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

However, it doesn't link some libraries as dynamic, and some others as
static, for some reason.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
