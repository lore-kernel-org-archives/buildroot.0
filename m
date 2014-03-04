From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 10:44:15 +0100
Subject: [Buildroot] [git commit] linux: only depend on host-lzop if
 needed
In-Reply-To: <CAHkwnC_fm6gb6L3AkWB-oQoNdpkogrkj7dPfRqKVS3f+z6hCMA@mail.gmail.com>
References: <20140303212321.09FDC9B9F2@busybox.osuosl.org>
 <87mwh679ls.fsf@dell.be.48ers.dk> <20140304091400.4213b502@skate>
 <CAHkwnC_fm6gb6L3AkWB-oQoNdpkogrkj7dPfRqKVS3f+z6hCMA@mail.gmail.com>
Message-ID: <20140304104415.23508b79@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Tue, 4 Mar 2014 10:40:09 +0100, Fabio Porcedda wrote:

> There are two linux defconfigs files that uses LZO as default:
> $ git grep KERNEL_LZO | grep /configs
> arch/arm/configs/imx_v6_v7_defconfig:CONFIG_KERNEL_LZO=y
> arch/sh/configs/sdk7786_defconfig:CONFIG_KERNEL_LZO=y
> 
> If such defconfigs are used the host-lzo dependency is not added, does it?

It is: that's the whole point of Yann's patch. It greps in the provided
configuration file, and if it finds that the LZO compression is
selected, it adds host-lzop to the dependencies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
