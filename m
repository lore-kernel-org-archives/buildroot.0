From: Jeremy Kerr <jk@ozlabs.org>
Date: Mon, 03 Feb 2014 13:37:29 +0800
Subject: [Buildroot] [RFC,
 PATCH 5/8] package/kexec-lite: Add a package for the kexec-lite
 tools
In-Reply-To: <20140130204641.02b5d319@skate>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.919140.855251422258.5.gpush@pablo>
 <20140130204641.02b5d319@skate>
Message-ID: <52EF2B19.5010503@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>> +	select BR2_PACKAGE_LIBELF
>> +	select BR2_PACKAGE_DTC
>> +	select BR2_PACKAGE_DTC_PROGRAMS
> 
> I have no idea how kexec-lite works, but I'm a bit surprised by the
> dependency on dtc. Does it builds the Device Tree source at runtime on
> the target?

Yes; if no device-tree blob is provided on the command-line, it will
invoke dtc to generate one from the current system (ie, from
/proc/device-tree).

Cheers,


Jeremy
