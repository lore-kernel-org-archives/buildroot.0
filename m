From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 12:31:48 +0100
Subject: [Buildroot] [PATCH v2] cmake: don't use any header available in
 $(HOST_DIR)/usr/include
In-Reply-To: <20150305070255.GY15668@tarshish>
References: <1425516333-3234-1-git-send-email-fabio.porcedda@gmail.com>
 <20150305070255.GY15668@tarshish>
Message-ID: <20150305123148.3702fccc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 5 Mar 2015 09:02:55 +0200, Baruch Siach wrote:

> On Thu, Mar 05, 2015 at 01:45:33AM +0100, Fabio Porcedda wrote:
> > +# Get rid of -I* options to prevent that a header avaiable in
> > +# $(HOST_DIR)/usr/include is used instead of a cmake one, e.g. lzma*
> > +# headers of the xz package
> > +HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed s/-I[^\ ]*//)
> 
> How about (untested):
> 
> 	HOST_CMAKE_CFLAGS = $(filter-out -I%,$(HOST_CFLAGS))

It unfortunately works only if the form:

	-I/foo/bar

is used. If you use:

	-I /foo/bar

which is valid for gcc, then filter-out will filter the -I but
not /foo/bar.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
