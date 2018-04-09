From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Apr 2018 17:50:05 +0200
Subject: [Buildroot] [PATCH] php: fix emalloc/efree/estrdup/...
 undefined references
In-Reply-To: <20180405210622.27836-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 5 Apr 2018 23:06:22 +0200")
References: <20180405210622.27836-1-thomas.petazzoni@bootlin.com>
Message-ID: <87h8ok8jma.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > zend_alloc.h defines some macros such as:

 > Where _estrdup is the actual function implemented by the PHP core. If

Lines starting with # are automatically dropped by git ;)

 > +++ b/package/php/0009-ext-xml-expat_compat.h-add-missing-php.h-include.patch
 > @@ -0,0 +1,71 @@
 > +From fb1f0e17eed729204a6d5caf590715d6257dceb3 Mon Sep 17 00:00:00 2001
 > +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > +Date: Thu, 5 Apr 2018 22:50:00 +0200
 > +Subject: [PATCH] ext/xml/expat_compat.h: add missing php.h include
 > +
 > +When expat support is disabled and libxml support is enabled, the
 > +following part of the code in expat_compat.h gets used:
 > +

Here as well ;)

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
