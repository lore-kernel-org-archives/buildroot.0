From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Thu, 08 Mar 2007 23:36:22 +0200
Subject: [Buildroot] [RFC/PATCH 1/3] fix buildroot sed handling on Mac
 OS X
In-Reply-To: <20070308163500.GC1389@aon.at>
References: <45E1717E.1030305@cs.helsinki.fi> <20070308163500.GC1389@aon.at>
Message-ID: <45F081D6.3050803@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer kirjoitti:
> On Sun, Feb 25, 2007 at 01:22:38PM +0200, Heikki Lindholm wrote:
> 
>>Improve the checking of sed by adding some common GNU sed installation
>>names (gsed/gnused), checking for a basic OS X sed feature in command
>>line option handling, checking the actual result of the sed run against
>>the expected result, and placing common code for the check under
>>toolchain/dependencies/.
>>
>>-- Heikki Lindholm
>>
> 
> 
>>diff -Nru buildroot/package/sed/sedcheck.sh buildroot-devel/package/sed/sedcheck.sh
>>--- buildroot/package/sed/sedcheck.sh	2007-02-22 10:50:29.000000000 +0200
>>+++ buildroot-devel/package/sed/sedcheck.sh	2007-02-23 17:39:04.000000000 +0200
>>@@ -2,24 +2,10 @@
>>
>># Make sure the host sed supports '-i' (in-place).
>># If it doesn't, we'll build and use our own.
>>+SED=$(toolchain/dependencies/check-host-sed.sh)
>>
>>-if test -x /usr/bin/sed ; then
>>-	SED="/usr/bin/sed"
>>-else
>>-	if test -x /bin/sed ; then
>>-		SED="/bin/sed"
>>-	else
>>-		SED="sed"
>>-	fi
>>-fi
>>-
>>-echo "HELLO" > .sedtest
>>-$SED -i -e "s/HELLO/GOODBYE/" .sedtest >/dev/null 2>&1
> 
> 
> Why don't you mv check-host-sed.sh here instead and use it in
> dependencies.sh? I'd prefer it this way..

Well. I tossed a coin on the placement. I thought checking the host sed 
would belong better to something build-framework-ish than the sed 
package. I'll do a respin of this if you like.

-- Heikki Lindholm
