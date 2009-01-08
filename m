From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 8 Jan 2009 19:17:16 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable
	general patches
In-Reply-To: <878wplsw9q.fsf@macbook.be.48ers.dk>
References: <200811140854.58814.markus.heidelberg@web.de>
	<200901081510.39837.markus.heidelberg@web.de>
	<878wplsw9q.fsf@macbook.be.48ers.dk>
Message-ID: <200901081917.16406.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 08.01.2009:
> >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> 
>  Markus> The patches in target/u-boot/$(U_BOOT_VERSION)/ can conflict with custom
>  Markus> board specific patches, so this option is necessary.
> 
> I would rather get rid of any patches that are not strictly needed. We
> should only have patches for criticial bugfixes or build issues.

It's not that only big/many/feature patches can lead to conflicts, it's
rather possible that patches containing fixes conflict with custom
patches, at least with my current workflow. I don't base U-Boot
development on the state in Buildroot, but on U-Boot's git tree and then
create a patch against the release and put it into Buildroot.

It's the same as with the Linux kernel: you wouldn't like patches lying
around in Buildroot, which you can't disable and always get applied.

> The number of configuration options we have in target/u-boot nowadays
> is getty silly.

That's right, but this option is not one to be passed to U-Boot like all
this board specific stuff currently in Config.in.

Markus
