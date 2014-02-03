From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Feb 2014 08:04:32 +0100
Subject: [Buildroot] [RFC,
 PATCH 5/8] package/kexec-lite: Add a package for the kexec-lite
 tools
In-Reply-To: <52EF2B19.5010503@ozlabs.org>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.919140.855251422258.5.gpush@pablo>
 <20140130204641.02b5d319@skate> <52EF2B19.5010503@ozlabs.org>
Message-ID: <20140203080432.4bb76e53@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

On Mon, 03 Feb 2014 13:37:29 +0800, Jeremy Kerr wrote:

> >> +	select BR2_PACKAGE_LIBELF
> >> +	select BR2_PACKAGE_DTC
> >> +	select BR2_PACKAGE_DTC_PROGRAMS
> > 
> > I have no idea how kexec-lite works, but I'm a bit surprised by the
> > dependency on dtc. Does it builds the Device Tree source at runtime on
> > the target?
> 
> Yes; if no device-tree blob is provided on the command-line, it will
> invoke dtc to generate one from the current system (ie, from
> /proc/device-tree).

Ok, then in this kind of case, we like to do:

	# run-time dependency only
	select BR2_PACKAGE_DTC
	select BR2_PACKAGE_DTC_PROGRAMS

so that we remember why this dependency is expressed in the Config.in,
but not in the package .mk file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
