From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 16:46:15 +0100
Subject: [Buildroot] Need iconv(): fatal error: iconv.h: No such file or
 directory
In-Reply-To: <a137651a680a46959923e90be1485e87@exch13-mail05.win.slac.stanford.edu>
References: <3f160793d89243dd860bee8dd5e7acc4@exch13-mail05.win.slac.stanford.edu>
 <20150106092836.134b13fb@free-electrons.com>
 <a137651a680a46959923e90be1485e87@exch13-mail05.win.slac.stanford.edu>
Message-ID: <20150106164615.72ed36f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Williams Jr., Ernest L.,

On Tue, 6 Jan 2015 15:39:47 +0000, Williams Jr., Ernest L. wrote:

> In this case my package/application is external to buildroot.
> 
> I have set the following  in my  ".config"   using  make xconfig:
> BR2_TOOLCHAIN_BUILDROOT_LOCALE
> 
> Like so,
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> 
> After typing make, I expect to see  "iconv.h"  in ${STAGING_DIR}/usr/include
> But it is not, there.  :(
> 
> Must, I rebuild everything from scratch ?

Yes.

See http://buildroot.org/downloads/manual/manual.html#full-rebuild:

"""
When the toolchain configuration is changed, a complete rebuild
generally is needed. Changing the toolchain configuration often
involves changing the compiler version, the type of C library or its
configuration, or some other fundamental configuration item, and these
changes have an impact on the entire system.
"""

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
