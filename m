From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 12:45:43 +0200
Subject: [Buildroot] [PATCH] core/pkg-generic: host variants inherits
 target's override-srcdir
In-Reply-To: <20150719104206.GA4020@free.fr>
References: <1436097417-1809-1-git-send-email-yann.morin.1998@free.fr>
 <559B02FB.8010803@mind.be> <20150719104206.GA4020@free.fr>
Message-ID: <20150719124543.5e0c2c5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 19 Jul 2015 12:42:06 +0200, Yann E. MORIN wrote:

> Then create a local.mk:
> 
> 1) with:
> 
>     $ cat local.mk
>     MPC_OVERRIDE_SRCDIR = /path/to/somewhere
> 
>     $ make printvars |grep -E '^[^[:space:]]+_OVERRIDE_SRCDIR' |grep MPC
>     HOST_MPC_OVERRIDE_SRCDIR=/path/to/somewhere ($(MPC_OVERRIDE_SRCDIR))
>     MPC_OVERRIDE_SRCDIR=/path/to/somewhere (/path/to/somewhere)
> 
>     ==> OK
> 
> 2) with:
> 
>     $ cat local.mk
>     HOST_MPC_OVERRIDE_SRCDIR = /path/to/somewhere
> 
>     $ make printvars |grep -E '^[^[:space:]]+_OVERRIDE_SRCDIR' |grep MPC
>     HOST_MPC_OVERRIDE_SRCDIR=/path/to/somewhere (/path/to/somewhere)
> 
>     ==> OK
> 
> 3) with:
> 
>     $ cat local.mk
>     MPC_OVERRIDE_SRCDIR = 
>     HOST_MPC_OVERRIDE_SRCDIR = /path/to/somewhere
> 
>     $ make printvars |grep -E '^[^[:space:]]+_OVERRIDE_SRCDIR' |grep MPC
>     HOST_MPC_OVERRIDE_SRCDIR=/path/to/somewhere (/path/to/somewhere)
>     MPC_OVERRIDE_SRCDIR= ()
> 
>     ==> OK
> 
> 4) with:
> 
>     $ cat local.mk
>     MPC_OVERRIDE_SRCDIR = /path/to/somewhere
>     HOST_MPC_OVERRIDE_SRCDIR = 
> 
>     $ make printvars |grep -E '^[^[:space:]]+_OVERRIDE_SRCDIR' |grep MPC
>     HOST_MPC_OVERRIDE_SRCDIR=/path/to/somewhere ($(MPC_OVERRIDE_SRCDIR))
>     MPC_OVERRIDE_SRCDIR=/path/to/somewhere (/path/to/somewhere)
> 
>     ==> KO

We need test cases in the test infrastructure! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
