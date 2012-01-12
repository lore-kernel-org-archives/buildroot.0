From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jan 2012 10:52:31 +0100
Subject: [Buildroot] Error installing  udev  : frugalware ??
In-Reply-To: <8E8EC4AEBD4345D2BF6FE26E33A7874A@JohanW7>
References: <DBC7AF7422C5458EB0B788B267A834FC@JohanW7>
 <87ipkh8hp8.fsf@macbook.be.48ers.dk>
 <8E8EC4AEBD4345D2BF6FE26E33A7874A@JohanW7>
Message-ID: <20120112105231.4f9e62f4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 12 Jan 2012 10:43:38 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> Why is the package directory scanned ?

Because the main Makefile does:

include package/*/*.mk

The inclusion of the Config.in file has nothing to do with the
inclusion of the .mk files. Config.in files must be explicitly included
by package/Config.in, while all .mk file in subdirectories of package/
are automatically included.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
