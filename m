From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 19 Aug 2009 20:30:47 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090819233037.1d8e5a5d@surf>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
	<20090819233037.1d8e5a5d@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA4C0@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, August 19, 2009 2:31 PM, Thomas Petazzoni wrote:
>> The kernel and rootfs are both created with Buildroot.
>> 
>> For the kernel config I have:
>> 
>> CONFIG_AEABI=y
>> CONFIG_OABI_COMPAT=y
>> 
>> For buildroot's config I have:
>> 
>> # BR2_ARM_OABI is not set
>> BR2_ARM_EABI=y
>
> That's correct. When I fall into similar issue, I usually end up
> writing a very simple init program that does:
>
> int main(void)
> {
>	write(1, "Hello\n", 6);
>	while(1);
> }
>
> Compile it statically and put it in /sbin/init. Getting this first
> basic program to work is a first step.
>
>> Is there a similar configuration that needs to be set in Busybox?
>
> Not that I'm aware of.

Thomas,

Is it possible I need to pass the -march=armv4t flag to the compiler
in order to use the correct instruction set for my architecture?

If so, where do you set that in buildroot.  The kernel sets this
automatically.

Regards,
Hartley
