From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 May 2010 16:26:49 +0200
Subject: [Buildroot] libglib2 solved
In-Reply-To: <CE4DE14F770C449092622CC4E29235E7@apexjs> (Sagaert Johan's
	message of "Fri, 21 May 2010 16:14:08 +0200")
References: <CE4DE14F770C449092622CC4E29235E7@apexjs>
Message-ID: <877hmxuy8m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> After some searching i found UCLIBC_HAS_LIBRESOLV_STUB should be turned on in
 Sagaert> order to get libresolv.

Yes:

git grep RESOLV_STUB toolchain/uClibc/uClibc-0.9.31.config 
toolchain/uClibc/uClibc-0.9.31.config:UCLIBC_HAS_LIBRESOLV_STUB=y

So if you're using the default config you should have this already.

 Sagaert> libglib2 is happy now about res_query , but now complains
 Sagaert> about gettext.  I guess i need to do a distclean and rebuild
 Sagaert> from scratch ( i think this is a must after changing the
 Sagaert> toolchain settings )

Yes, definately.
 
 Sagaert> There is hope...

;)

-- 
Bye, Peter Korsgaard
