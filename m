From: Andreas Naumann <dev@andin.de>
Date: Wed, 09 Apr 2014 15:28:53 +0200
Subject: [Buildroot] [PATCH 2/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <cfbdbd2e5437db8f56cf1db9944cc072897fbe1a.1388768519.git.yann.morin.1998@free.fr>
References: <cover.1388768519.git.yann.morin.1998@free.fr>
 <cfbdbd2e5437db8f56cf1db9944cc072897fbe1a.1388768519.git.yann.morin.1998@free.fr>
Message-ID: <53454B15.7060409@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Contrary to the existing fs/ schemes, which each generate only a single
> filesystem image for the root filesystem, this new scheme allows the
> user to generate more complex images.


if found this an interesting idea, but apparently it has not found its 
way into master yet. What is the current state?

>
> The basis behind this is a .ini-like description of the layout of the
> final target storage:
>    - the list of device(s)
>    - per-device, the list of partition(s)
>    - per-partition, the content
>
> It is possible to create MBR- or GPT-based partitoining schemes. Adding
> new ones should be relatively easy (but would need adequate host tools).
>
> For now, the only content possible for partitions is a filesystem. It
> should be pretty easy to add new types (eg. un-formated, or raw blob).
>
> Also, only two filesystems are supported: ext{2,3,4} and vfat. Adding
> more will be relatively easy, provided we have the necessary host
> packages to deal with those filesystems.

However, I'not sure if it actually is what I am looking for. Which is 
dividing the target content into multiple partitions, which are then 
mounted into the rootfs (like /data, /etc/somespecialconfig, /var/log).?

Are there other ways to do that?

cheers,
Andi
