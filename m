From: Mike Zick <minimod@morethan.org>
Date: Wed, 26 Feb 2014 01:48:47 -0600
Subject: [Buildroot] compiling kernel
In-Reply-To: <1393369707.747.YahooMailNeo@web120205.mail.ne1.yahoo.com>
References: <1393369707.747.YahooMailNeo@web120205.mail.ne1.yahoo.com>
Message-ID: <20140226014847.23839269@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Feb 2014 15:08:27 -0800 (PST)
Basavaraj Hiremath <hraj50@yahoo.com> wrote:

> Hi,
> Recently started using build root system, I have following questions,
> could you clarify?
> 
> 1. how can I compile kernel and root file system separately, so that
> application user can use the kernel binary to create the root file
> system(no need to have kernel code)?
>

The kernel (and any code linked to it) is GPLv2 -
The source code must be available to whoever has the the binary.

The kernel can be separately compiled from the root file system,
but breaking the terms of the GPLv2 license is not one of the reasons.

If your system image uses proprietary code, the BR_EXTERNAL tree is
provided for that purpose.

> 2. Even after using the pre-built target tool chain, build root
> compiles some of the host tools for the first time and later uses
> these host tools. Can I have pre-built host tools required for the
> build root similar to target tool chain? In multi user system on the
> Linux machine, only one user need to compile the target tool chain
> and host tools and rest of the user just create root file system
> using these target tool chain and host tools.
>

Yes.

Your best starting place would be to review the buildroot manual.
Available both on-line and packaged with buildroot.

Mike 
> 
> Thanks in advance,
> Raj
