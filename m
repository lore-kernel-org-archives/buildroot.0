From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Nov 2019 08:49:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/gadgetfs-test: add an upstream
 URL to Config.in
In-Reply-To: <20191126214723.20877de8@windsurf> (Thomas Petazzoni's message of
 "Tue, 26 Nov 2019 21:47:23 +0100")
References: <20191126153505.31916-1-mark@dibsco.co.uk>
 <20191126165956.70a85ba9@windsurf> <20191126214723.20877de8@windsurf>
Message-ID: <875zj5sqqw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> >  	  Test program for gadgetfs from linux-usb.org
 >> >  
 >> > +	  https://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest/  
 >> 
 >> Same here, I don't think this adds much value.

 > To me, this package is another candidate for removal. This is some
 > really old unmaintained stuff, I'm pretty sure there are much better
 > things these days to test USB gadget.

 > Peter ?

I believe so as well. The kernel has some example code under
tools/usb. Gadgetfs is obsoleted by functionfs (2010), which works with
the composite framework. The user space API to setup a composite device
without a custom kernel driver using configfs is somewhat newer though
(3.11). We have the libusbgx package to handle that.

It may make sense to package https://github.com/kopasiak/gt, which is a
command line tool built on top of libusbgx.

-- 
Bye, Peter Korsgaard
