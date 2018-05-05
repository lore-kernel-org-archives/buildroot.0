From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat, 5 May 2018 10:47:42 -0300 (BRT)
Subject: [Buildroot] [PATCH] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <20180505100100.GA2481@scaer>
References: <20180503121958.9462-1-casantos@datacom.ind.br>
 <20180505100100.GA2481@scaer>
Message-ID: <898911315.1288101.1525528062390.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Saturday, May 5, 2018 7:01:00 AM
> Subject: Re: [Buildroot] [PATCH] Makefile: check rootfs overlays with BR2_ROOTFS_MERGED_USR enabled

> Carlos, All,
> 
> On 2018-05-03 09:19 -0300, Carlos Santos spake thusly:
>> Since commit 0db34529f48 we use rsync with the --keep-dirlinks option to
>> prevent overlays from accidentally overwriding /{usr,bin,sbin,lib} links
>> when BR2_ROOTFS_MERGED_USR option is enabled. Unfortunately this also
>> prevents replacing a symlink by a directory on purpose (e.g. /var/log,
>> to persist system logs).
> 
> In that case, I suggest your use a post-build script instead.

That was my first approach.

> In facct, I think that any modifications that change the layout of the
> filesystem should be done as a post-build script rather than an overlay.
> 
> So, I am pretty much reluctant to see this patch go in.

This change does not prevent the user from using a post-build but I'd
prefer to let Buildroot check the correctness of user changes as much
as possible instead of just prohibiting them.

Overlays are simpler to create and less error prone than scripts. They
are also self-documented, since a "find" or "tree" command shows the
resulting structure.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
