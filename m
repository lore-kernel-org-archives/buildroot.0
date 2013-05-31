From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 May 2013 20:26:22 +0200
Subject: [Buildroot] [PATCH] ecryptfs-utils: new package
In-Reply-To: <CAOPBCFU3+h-zu7RK6rvhC=ja9jFHWerOLzkRkpK1bQrsDysHkA@mail.gmail.com>
References: <CAOPBCFV6vC4KRgvLdWFpsB43HisCd-pb5ji0hzqY07qEHo2Evw@mail.gmail.com>
 <20130531181117.493b7f80@skate>
 <CAOPBCFU3+h-zu7RK6rvhC=ja9jFHWerOLzkRkpK1bQrsDysHkA@mail.gmail.com>
Message-ID: <20130531202622.6576897d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcin Bis,

On Fri, 31 May 2013 18:31:20 +0200, Marcin Bis wrote:

> > Apparently, ecryptfs-utils can be built without libnss, and use gcrypt
> > instead. Maybe it would be worth supporting this possibility. But it's
> > not mandatory to get your patch accepted.
> 
> I have got a problem trying to build it with gcrypt instead of nss.
> 
> The dependencies seems to be hard-coded:
> http://bazaar.launchpad.net/~ecryptfs/ecryptfs/trunk/view/head:/src/libecryptfs/main.c#L24
> nss.h and pk11func.h are provided only by libnss.
> (and libecryptfs is essential for mount.ecryptfs to work)
> 
> Foud this one too: https://bugs.launchpad.net/ecryptfs/+bug/1072643

Is this case, no problem, just submit something like you did, which
depends on NSS only. If someone cares enough to make it work with
gcrypt, this someone will fix it.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
