From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Oct 2011 07:33:12 -0300
Subject: [Buildroot] [PATCH 2/4] ocf: new package
In-Reply-To: <20111021085347.6e48f74c@skate>
References: <1319132933-13938-1-git-send-email-gustavo@zacarias.com.ar>
 <1319132933-13938-2-git-send-email-gustavo@zacarias.com.ar>
 <20111021085347.6e48f74c@skate>
Message-ID: <e2cbdc0fad426d5b9cab3fe2c085d35e@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21.10.2011 03:53, Thomas Petazzoni wrote:

> Le Thu, 20 Oct 2011 14:48:51 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>> +config BR2_PACKAGE_OCF
>> +	bool "ocf"
>> +	help
>> +	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
>> +	  Framework (OCF). This port aims to bring full asynchronous HW/SW
>> +	  crypto acceleration to the Linux kernel and applications
>> +	  running under Linux.
>> +
>> +	  http://ocf-linux.sourceforge.net/
>
> Maybe mention here that there is a kernel-side part that must be
> enabled for this to work, and that it can be enabled with
> BR2_LINUX_KERNEL_EXT_OCF ?

Fair enough, though it won't break anything if it's enabled and you 
lack OCF support on the kernel side.
Similar to what would happen if you don't load the appropiate modules 
or lack hardware support.

> So basically, it's just a header that needs to be installed?
>
> Thomas

Yes.
For the moment we've got OpenSSL and maybe Openswan that uses OCF.
Of course anything that links to OpenSSL uses OCF when it's properly 
enabled on supporting hardware.

Regards.
