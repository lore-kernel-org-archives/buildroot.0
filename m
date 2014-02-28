From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Feb 2014 08:37:44 +0100
Subject: [Buildroot] [RFC,
 PATCH 5/8] package/kexec-lite: Add a package for the kexec-lite
 tools
In-Reply-To: <5310369C.2050605@ozlabs.org>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.919140.855251422258.5.gpush@pablo>
 <20140130204641.02b5d319@skate> <52EF2B19.5010503@ozlabs.org>
 <5310369C.2050605@ozlabs.org>
Message-ID: <20140228083744.6ba14329@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

On Fri, 28 Feb 2014 15:11:24 +0800, Jeremy Kerr wrote:

> OK, I'm slightly incorrect here - kexec-lite requires the dtc libraries
> at build-time (we need to manipulate the device tree to update the
> reserved memory map), and may also call dtc at runtime too.
> 
> So, I'd propose a:
> 
> 	select BR2_PACKAGE_DTC
> 	# run-time dependency only
> 	select BR2_PACKAGE_DTC_PROGRAMS
> 
> - is that sensible?

In theory, yes. In practice, since you need BR2_PACKAGE_DTC at build
time, it means that you will have "dtc" in the <pkg>_DEPENDENCIES
variable of your package, which means that the dtc package (both the
library and programs) will be built before your package. So practically
speaking, BR2_PACKAGE_DTC_PROGRAMS will not really be treated as a
run-time dependency only, because it's not provided by a separate
package than dtc.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
