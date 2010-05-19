From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 May 2010 22:25:51 +0200
Subject: [Buildroot] Compiling host-mtd 1.3.1 error: ld: cannot find
	-lubi
In-Reply-To: <20100519150639.0062a6ae@snot.conwin.com> (Bill Borton's message
	of "Wed, 19 May 2010 15:06:39 -0500")
References: <20100519150639.0062a6ae@snot.conwin.com>
Message-ID: <87632jy6y8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bill" == Bill Borton <security@conwin.com> writes:

 Bill> make[1]: Leaving directory `/home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-19-10/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1'
 Bill> make: *** [/home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-19-10/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/.stamp_built] Error 2

 Bill> I have tried many different configuration combinations but haven't
 Bill> been able to get past this point.  Can someone please point me in
 Bill> the right direction?

That sounds like the parallel make issue recently reported - Does it
work for you if you change all instances of $(MAKE) in
package/mtd/mtd.mk to $(MAKE1) ?

-- 
Bye, Peter Korsgaard
