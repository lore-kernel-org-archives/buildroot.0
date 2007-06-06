From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 6 Jun 2007 20:40:23 +0200
Subject: [Buildroot] problems building x86_64 target
In-Reply-To: <20070606173826.GA4543@aon.at>
References: <3AF470EE-B97B-40FC-B806-12627EC946D0@lanl.gov>
	<20070606173826.GA4543@aon.at>
Message-ID: <20070606184023.GA7593@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 06, 2007 at 07:38:26PM +0200, Bernhard Fischer wrote:
>On Tue, Jun 05, 2007 at 10:16:26AM -0700, kevint wrote:

>>Target Architecture: x86_64
>>Target Architecture Variant: opteron
>>uClibc C library version (uClibc 0.9.29)
>>(toolchain/uClibc/uClibc-0.9.29.config) uClibc configuration file to  
>>use?
>>GCC Compiler version (gcc 3.4.6)

ok. svn up, select gcc-4.2.0, binutils-2.17.50.0.9,
kernel-headers-2.6.20
then rm -rf build_* toolchain_* && make

I'll note that the "opteron" support was something i accidentally added
from a WIP for better CPU selection, which is not yet in trunk. Adjust
your custom cflags accordingly for now (as you should always do, fwiw),
via the corresponding menu option.
