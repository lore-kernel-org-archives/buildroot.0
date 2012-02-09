From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2012 16:54:57 +0100
Subject: [Buildroot] segfault when running a simple c program on env
 build with buildroot
In-Reply-To: <4F33E363.5040107@scalemp.com>
References: <4F33DCBE.7080606@scalemp.com> <20120209161150.36d6c6d6@skate>
 <4F33E363.5040107@scalemp.com>
Message-ID: <20120209165457.2a99305b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 09 Feb 2012 17:16:51 +0200,
Eial Czerwacki <eial@scalemp.com> a ?crit :

> > What is your hardware platform?
> >
> > Thomas
> 
> any generic Intel/AMD cpu

Sorry this does not exist. Your configuration states i686. If your
processor is only i486 or i586 compatible, then those segfaults are
expected since the generated code might use instructions that do not
exist on your processor.

> I've compiled iasl, dmidecode and biosdecode with same image, you say
> that I cannot do that?
> I need the bin linked to uclibc and my desktop doesn't support uclibc

Buildroot generates for you an uClibc cross-compilation toolchain in
output/host/usr/bin that you can use to cross-compile applications for
the target platform.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
