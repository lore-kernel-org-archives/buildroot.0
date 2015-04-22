From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 22 Apr 2015 22:39:28 +0200
Subject: [Buildroot] Reminder about your pending Buildroot patches
In-Reply-To: <20150421125646.3729288A@mail.free-electrons.com>
References: <20150421125646.3729288A@mail.free-electrons.com>
Message-ID: <55380700.1060203@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 21/04/2015 14:56, Thomas Petazzoni a ?crit :
> 
>  - package/openvmtools: enable openvmtools kernel modules
>    http://patchwork.ozlabs.org/patch/441785/

This patch needs to be updated since the last openvmtools bump.

With the previous version, I was able to build all kernel module with 3.2.64
kernel but the build was broken 3.4+ kernel and with 3.2.64+ kernel due to a
backported patch.
As Karoly said, most of those drivers has been merged upstream (3.18~3.19), I'm
not sure we want to add a lot of patches to be able to build with stable kernel
release 3.4.y, 3.10.y, 3.12.y, 3.14.y.

Nevertheless, we can add this option with a big warning and say that the kernel
modules has been build and tested with a limited number of kernel version, at
least 3.2.64.

> 
>  - package/gdb: disable shared build for host-gdb
>    http://patchwork.ozlabs.org/patch/449686/
> 

See also, http://patchwork.ozlabs.org/patch/460494/ but I'm not very convinced.

Best regards,
Romain
