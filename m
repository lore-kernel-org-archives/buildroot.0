From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Dec 2013 20:51:56 +0100
Subject: [Buildroot] Newbie Question: How to use buildroot for a non
 linux arm os
In-Reply-To: <CECB8821.408%manish@freetechmind.com>
References: <CECB8821.408%manish@freetechmind.com>
Message-ID: <20131209205156.2dea3cde@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Manish Jaggi,

On Mon, 09 Dec 2013 14:45:53 +0530, Manish Jaggi wrote:

> I have a small OS which runs over CortexA7 processors. As of now the OS
> does not need a rootfs, it just needs a device tree. Currently I am using
> a nested make approach and would like to shelf it off and use a
> lightweight framework may be like buildroot.

Buildroot is mainly about building a set of Linux libraries and
applications. Does any of the usual Linux libraries or applications run
on your operating system? 

If not, then I believe Buildroot is not well suited for what you want
to do. You may want to re-use some of the Buildroot ideas (kconfig
based configuration interface, some Makefile bits), but generally
Buildroot will not be very useful for your use case.

> There is a link http://buildroot.uclibc.org/downloads/manual/manual.pdf
> but I am not able to find a step by step guide.

A step by step guide for what? Buildroot is about generating an
embedded Linux system. So if you want to use it for some completely
different, and apparently outside of Buildroot scope, it is quite
evident that there is no step by step guide to do something that isn't
meant to be done with Buildroot, no?

> What I need help from the list is to find a guide or steps to easily
> migrate the nested makefiles to buildroot.

What you're trying to do and "easy" in the same sentence doesn't really
match. What you're trying to do is complex, and you first need to
figure out whether it makes sense or not in the first place. You won't
find any "easy" guide to do what you want, simply because it isn't easy.

> Also is it possible to create an iso which contains the toolchain as well.

Buildroot does not support building a toolchain for the target, so
there is no chance to generate an ISO filesystem image that contains a
toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
