From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2009 23:30:37 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com>
	<20090819214237.534c433f@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
Message-ID: <20090819233037.1d8e5a5d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 19 Aug 2009 16:19:35 -0400,
"H Hartley Sweeten" <hartleys@visionengravers.com> a ?crit :

> The kernel and rootfs are both created with Buildroot.
> 
> For the kernel config I have:
> 
> CONFIG_AEABI=y
> CONFIG_OABI_COMPAT=y
> 
> For buildroot's config I have:
> 
> # BR2_ARM_OABI is not set
> BR2_ARM_EABI=y

That's correct. When I fall into similar issue, I usually end up
writing a very simple init program that does:

int main(void)
{
	write(1, "Hello\n", 6);
	while(1);
}

Compile it statically and put it in /sbin/init. Getting this first
basic program to work is a first step.

> Is there a similar configuration that needs to be set in Busybox?

Not that I'm aware of.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
