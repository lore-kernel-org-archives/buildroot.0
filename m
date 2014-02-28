From: Jeremy Kerr <jk@ozlabs.org>
Date: Fri, 28 Feb 2014 15:11:24 +0800
Subject: [Buildroot] [RFC,
 PATCH 5/8] package/kexec-lite: Add a package for the kexec-lite
 tools
In-Reply-To: <52EF2B19.5010503@ozlabs.org>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.919140.855251422258.5.gpush@pablo>
 <20140130204641.02b5d319@skate> <52EF2B19.5010503@ozlabs.org>
Message-ID: <5310369C.2050605@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>>> +	select BR2_PACKAGE_LIBELF
>>> +	select BR2_PACKAGE_DTC
>>> +	select BR2_PACKAGE_DTC_PROGRAMS
>>
>> I have no idea how kexec-lite works, but I'm a bit surprised by the
>> dependency on dtc. Does it builds the Device Tree source at runtime on
>> the target?
> 
> Yes; if no device-tree blob is provided on the command-line, it will
> invoke dtc to generate one from the current system (ie, from
> /proc/device-tree).

OK, I'm slightly incorrect here - kexec-lite requires the dtc libraries
at build-time (we need to manipulate the device tree to update the
reserved memory map), and may also call dtc at runtime too.

So, I'd propose a:

	select BR2_PACKAGE_DTC
	# run-time dependency only
	select BR2_PACKAGE_DTC_PROGRAMS

- is that sensible?

Cheers,


Jeremy
