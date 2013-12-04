From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 04 Dec 2013 09:48:36 -0300
Subject: [Buildroot] [PATCH 1/2] qemu-system: new host package
In-Reply-To: <20131204133306.7e7e8e07@skate>
References: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>	<1386117649-7119-2-git-send-email-gustavo@zacarias.com.ar>	<20131204094419.6d4d4279@skate>	<529EFEBA.8040103@zacarias.com.ar>
 <20131204133306.7e7e8e07@skate>
Message-ID: <529F24A4.6030005@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/2013 09:33 AM, Thomas Petazzoni wrote:

> Yes, I agree, the user mode emulation should probably be removed. It
> simply cannot work properly, because we have no way of guaranteeing
> that the kernel headers used for the target toolchain are older than
> the kernel running on the system.
> 
> And even if we want to keep the user mode emulation, I think there
> should be one single package. Nothing prevents from having sub-options
> to enable either the user mode or system mode emulation, or both, or to
> have a version selection.

A single package prevents different versions of -user and -system (at
least in a nice way).
Sometimes the latest version of qemu doesn't play nice with some kernel
versions because of newer OpenBIOS/other BIOSes versions breaking with
newer kernels - it's a common scenario for non-x86/x86_64.
And there may be some particular need for -user to be a newer or
different version than system, though i can't come up with any idea of why.
At the moment i don't think -user is useful for anything in particular
because of the limitations you wrote.
Problem is building two different versions in a single package wouldn't
be all that great, for all intents and purposes they would be two
packages anyway.
Regards.
