From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Dec 2013 13:35:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-03
In-Reply-To: <529F0ACD.1080803@imgtec.com>
References: <20131204073002.8453B101504@stock.ovh.net>
 <529F0ACD.1080803@imgtec.com>
Message-ID: <20131204133500.2f99e067@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 4 Dec 2013 10:58:21 +0000, Vicente Olivert Riera wrote:

> >      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/35406e2aa9210f436c750b889a79c65fd8f5ded1/
> 
> This is a problem with certain arches (IA64, MIPS and SPARC) in uClibc. 
> The file "uClibc/libc/sysdeps/linux/${ARCH}/bits/siginfo.h" has a struct 
> called sigevent. That struct has "__pid_t _tid;" in some arches, but not 
> on IA64, MIPS and SPARC, that's why it fails. glibc, for instance, has 
> that member on all arches.

What can we do to fix this? Is there a fix upstream in uClibc? Should
we report the problem to them?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
