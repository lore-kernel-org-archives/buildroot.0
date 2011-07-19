From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jul 2011 20:29:14 +0200
Subject: [Buildroot] [PATCH] Makefile.package.in: Pass non-prefixed name
 as argument to GENTARGETS_INNER.
In-Reply-To: <1310982367-20976-1-git-send-email-quotientvremainder@gmail.com>
References: <1310982367-20976-1-git-send-email-quotientvremainder@gmail.com>
Message-ID: <20110719202914.375e8de0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 18 Jul 2011 10:46:07 +0100,
Quotient Remainder <quotientvremainder@gmail.com> a ?crit :

> Instead of effectively running s/^host-// on the package name, just
> pass the non-prefixed name to GENTARGETS_INNER.  This removes the
> need to ban packages with names starting with "host-".
> 
> Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>

I have taken this patch in my branch dedicated to package
infrastructure improvements, but did the following changes :

 * Updated the AUTOTARGETS and CMAKETARGETS infrastructures as well

 * Put the new argument in position 2 of GENTARGETS_INNER instead of
   the last argument. It requires a lot of renaming inside
   GENTARGETS_INNER, but it is a lot cleaner to have arg 1, lowercase
   package name with host-, arg 2, lowercase package name without
   host-, arg 3 uppercase package name with HOST_, arg 4, uppercase
   package name without HOST_

It will be part of an upcoming pull requests with various improvements
to the package infrastructure.

Thanks !

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
