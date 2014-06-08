From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 13:48:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-07
In-Reply-To: <20140608095111.GA3526@free.fr>
References: <20140608063008.43578101511@stock.ovh.net>
 <20140608095111.GA3526@free.fr>
Message-ID: <20140608134829.13b89f96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 8 Jun 2014 11:51:11 +0200, Yann E. MORIN wrote:

> So, it is only happy with a glibc >= 2.4. Unfortunately, uClibc only
> impersonates a glibc-2.2, in include/features.h:
> 
>       395 #define __GLIBC__   2
>       396 #define __GLIBC_MINOR__ 2
> 
> I suggest we just disable libbsd (and its reverse dependencies) on
> uClibc. Thoughts?

Seems ok to me. libbsd does not have any reverse dependencies for which
it is a mandatory dependency. The only reverse dependency seems to be
libedit, but libbsd is an optional dependency for it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
