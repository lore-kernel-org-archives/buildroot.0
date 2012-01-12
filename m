From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Jan 2012 10:50:39 +0100
Subject: [Buildroot] Error installing  udev  : frugalware ??
In-Reply-To: <8E8EC4AEBD4345D2BF6FE26E33A7874A@JohanW7> (Sagaert Johan's
 message of "Thu, 12 Jan 2012 10:43:38 +0100")
References: <DBC7AF7422C5458EB0B788B267A834FC@JohanW7>
 <87ipkh8hp8.fsf@macbook.be.48ers.dk>
 <8E8EC4AEBD4345D2BF6FE26E33A7874A@JohanW7>
Message-ID: <87aa5t8d1s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> So I had topdir/package/......
 Sagaert>                        |udev  (173) 
 Sagaert> 				|udevold (114)
 Sagaert> 				|.....

 Sagaert> So it seems the buildroot scripts are scanning the package directory and seems to act on it even if it is not included in the
 Sagaert> package/Config.in.

Yes, *.mk files are included using a wildcard:

include package/*/*.mk

 Sagaert> Strange, because I did not see anything suspected in the build output.

 Sagaert> So I started grep to find out where the frugalware text came from...

 Sagaert> Why is the package directory scanned ?

Because it's the simplest possible implementation. For the Config.in
files we want a specific order in menuconfig (and mconf doesn't support
wildcards), but make does.

-- 
Bye, Peter Korsgaard
