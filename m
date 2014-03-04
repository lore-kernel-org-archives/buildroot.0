From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 4 Mar 2014 10:40:09 +0100
Subject: [Buildroot] [git commit] linux: only depend on host-lzop if
	needed
In-Reply-To: <20140304091400.4213b502@skate>
References: <20140303212321.09FDC9B9F2@busybox.osuosl.org>
 <87mwh679ls.fsf@dell.be.48ers.dk> <20140304091400.4213b502@skate>
Message-ID: <CAHkwnC_fm6gb6L3AkWB-oQoNdpkogrkj7dPfRqKVS3f+z6hCMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 4, 2014 at 9:14 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Peter Korsgaard,
>
> On Tue, 04 Mar 2014 07:37:19 +0100, Peter Korsgaard wrote:
>
>> Doesn't this get executed very early, E.G. before the linux sources are
>> extracted?
>
> Indeed, but the configuration file is already available at this point.
> It may be either a full .config, or a minimal defconfig, but in both
> cases it doesn't matter. See below.
>
>> Does it work with configurations using a defconfig in the kernel sources like sheevaplug_defconfig?
>
> It does, as explained in the commit log: since LZO is not the default
> compression, if it is chosen by the user in its kernel configuration,
> it will also appear in minimal defconfigs.

There are two linux defconfigs files that uses LZO as default:
$ git grep KERNEL_LZO | grep /configs
arch/arm/configs/imx_v6_v7_defconfig:CONFIG_KERNEL_LZO=y
arch/sh/configs/sdk7786_defconfig:CONFIG_KERNEL_LZO=y

If such defconfigs are used the host-lzo dependency is not added, does it?

Regards
-- 
Fabio Porcedda
