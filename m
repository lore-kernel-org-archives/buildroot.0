From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 22:23:45 +0100
Subject: [Buildroot] [PATCH] libtirpc: fix compilation error
In-Reply-To: <trinity-145e0c2a-2583-47ec-b583-2128a636e7e6-1514557451788@3c-app-mailcom-bs06>
References: <20171229130333.13661-1-daggs@gmx.com>
 <20171229143805.7f083140@windsurf.lan>
 <trinity-145e0c2a-2583-47ec-b583-2128a636e7e6-1514557451788@3c-app-mailcom-bs06>
Message-ID: <20171229222345.7ecb9545@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 15:24:11 +0100, daggs wrote:

> config to reproduce:
> BR2_x86_i686=y
> BR2_PACKAGE_LIBTIRPC=y
> 
> no idea why the autobuilds didn't caught it.

I initially couldn't reproduce it, but after thinking more about the
problem, I understood what happened: you don't have RPC support
installed in your host system. The build of the rpcgen host program
fails to build because it can't find those headers, which on my system
(or the autobuilder instances) are provided system-wide.

So indeed, your patch is correct. Just the explanation was not
sufficient, so I've reworded the commit log accordingly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
