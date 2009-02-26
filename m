From: steve at c2root.be <steve@c2root.be>
Date: Thu, 26 Feb 2009 13:42:13 +0100
Subject: [Buildroot] Qtopia4 build issue
In-Reply-To: <20090226122205.390e848a@surf>
References: <20090226122205.390e848a@surf>
Message-ID: <20090226134213.t2iobd0cn40840o8@webmail.digibel.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I have the same issue with the general release and allan confirmed he  
saw it too

regards
Citeren Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:

> Hi,
>
> With latest SVN, Qtopia4 doesn't build on i386. The problem is that
> 'qmake' is being built with the target compiler instead of the host
> compiler, while qmake is supposed to be executed on the host.
>
> Buildroot's qtopia4.mk Makefile patches the Qmake configuration file to
> set the correct path to the compiler.
>
> But Qt's ./configure script looks inside the Qmake configuration to
> know which compiler to use to compile Qmake itself, unless the CC and
> CXX variables are overriden.
>
> So I'm not sure what the correct fix for this issue is (maybe setting
> CC and CXX ?), but there's clearly an issue here.
>
> Anyone having the same problem ?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
