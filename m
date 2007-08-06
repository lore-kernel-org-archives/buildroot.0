From: Brad House <brad@mainstreetsoftworks.com>
Date: Mon, 06 Aug 2007 17:28:08 -0400
Subject: [Buildroot] [patch] libxml2 fixes
In-Reply-To: <03ab01c7d86f$43b6ee60$dcc4af0a@atmel.com>
References: <46B739FF.5020507@mainstreetsoftworks.com>
	<02f001c7d869$de70f960$dcc4af0a@atmel.com>
	<46B78B3B.1070002@mainstreetsoftworks.com>
	<03ab01c7d86f$43b6ee60$dcc4af0a@atmel.com>
Message-ID: <46B79268.1010908@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> When I tried to build libxml2 using a toolchain without wchar support
>>> it failed, when it is built with a toolchain supporting wchar, it completes the build.
>> When was this?
> 
> 2-3 weeks ago.
> 
>> and with what version of libxml2?
> 
> libxml2 version from buildroot.
> 
>> and on what architecture?
> 
> 
> generic-arm architecture.
> 
>> On x86 and arm, that is not the case from my experience.
>> Can you also provide some more information on the actual error message?
> 
> I killed that toolchain, so I do not have the error handy
> You can easily generate a new gcc-4.2.0/binutils-2.17 toolchain based on uClibc 0.29 without wchar
> for generic-arm.

Perhaps the rest of my patch resolved those issues as I am unable to recreate
your issue when using my patch.  I just verified that I do NOT have BR2_USE_WCHAR
enabled (Toolchain Options ---> Enable WCHAR support   is NOT checked).  I could not
get libxml2 to compile at all without apply patches, but it didn't give any
issues related to wchar that I could see, it was because it was trying to build
stuff like the python module ...

-Brad
