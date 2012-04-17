From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Apr 2012 14:01:29 +0200
Subject: [Buildroot] [PATCH] Add libapr-package
In-Reply-To: <20120417133932.4552d886@skate> (Thomas Petazzoni's message of
 "Tue, 17 Apr 2012 13:39:32 +0200")
References: <1334660370-19506-2-git-send-email-bachmann@tofwerk.com>
 <20120417133932.4552d886@skate>
Message-ID: <873982lg86.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> +	bool "libapr"
 >> +	help
 >> +	  The mission of the Apache Portable Runtime (APR) project is to create and maintain software libraries that provide a predictable and consistent interface to underlying platform-specific implementations

 Thomas> This text should be wrapped at ~80 columns.

And the upstream URL should be added below.

 >> new file mode 100644
 >> index 0000000..57da8ef
 >> --- /dev/null
 >> +++ b/package/libapr/libapr.mk
 >> @@ -0,0 +1,12 @@
 >> +#############################################################
 >> +#
 >> +# libapr
 >> +#
 >> +#############################################################
 >> +LIBAPR_VERSION = 1.4.6
 >> +LIBAPR_SOURCE = apr-$(LIBAPR_VERSION).tar.gz

 Thomas> Yegor's suggestion didn't work because by default we download
 Thomas> <package-name>-<package-version>.tar.gz. However here you decided to
 Thomas> name the Buildroot package "libapr", while the upstream package is
 Thomas> "apr". Maybe we should use the "apr" name like upstream?

Agreed.

 >> +LIBAPR_SITE = http://mirror.switch.ch/mirror/apache/dist/apr

I know the apr website directs you to a local mirror, but perhaps it
would make more sense to use archive.apache.org/dist/apr instead of this
.ch mirror?

-- 
Bye, Peter Korsgaard
