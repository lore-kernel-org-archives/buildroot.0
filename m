From: Fathi Boudra <fboudra@gmail.com>
Date: Wed, 17 Sep 2008 13:45:42 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <87zlm70zyc.fsf@macbook.be.48ers.dk>
References: <20080621194717.98BEF3C725@busybox.net>
	<1214130344.2605.8.camel@localhost>
	<87myldra6q.fsf@macbook.be.48ers.dk> <20080622201857.GC10734@mx.loc>
	<87tzflp4yw.fsf@macbook.be.48ers.dk>
	<6a2e33620809170412g35ce7528qc18bf714ed12fbd1@mail.gmail.com>
	<87zlm70zyc.fsf@macbook.be.48ers.dk>
Message-ID: <6a2e33620809170445g3c1c8e61t5c413c6a415db5c9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  Fathi> what about backport "add decimal float handling" commit from
>  Fathi> Bernhard's git repo. ?
>
> Please refresh my memory - What does that fix?


Fix gcc-4.3.x build failure on missing fenv.h.
To workaround the issue, we need --disable-decimal-float
so $(GCC_DECIMAL_FLOAT) was introduced.


> I don't recall ever getting an answer from Bernhard on that mail ..


He didn't replied to the thread.

He introduced a configure option to handle decimal float which is a bit
nicer from my POV.

+choice
+       prompt "GCC decimal floating types"
+       default BR2_GCC_DECNUMBER_no
+       help
+         As an extension, the GNU C Compiler supports decimal float types
+         as defined in the N1176 draft ISO/IEC WDTR24732.
+
+config BR2_GCC_DECNUMBER_no
+       bool "no"
+config BR2_GCC_DECNUMBER_yes
+       bool "yes"
+config BR2_GCC_DECNUMBER_bid
+       bool "bid"
+config BR2_GCC_DECNUMBER_dpd
+       bool "dpd"
+endchoice
+
+config BR2_GCC_DECNUMBER
+       string
+       default "no"  if BR2_GCC_DECNUMBER_no
+       default "yes" if BR2_GCC_DECNUMBER_yes
+       default "bid" if BR2_GCC_DECNUMBER_bid
+       default "dpd" if BR2_GCC_DECNUMBER_dpd

cheers,

Fathi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080917/6abffb35/attachment.htm 
