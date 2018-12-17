From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 17 Dec 2018 21:44:16 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] package: dropbear: make PATH configurable
In-Reply-To: <20181216152603.GD2384@scaer>
References: <20180309224149.20225-1-mmayer@broadcom.com>
 <20181216152603.GD2384@scaer>
Message-ID: <533843879.18165671.1545090256285.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "Markus Mayer" <mmayer@broadcom.com>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Domingo, 16 de dezembro de 2018 13:26:03
> Subject: Re: [Buildroot] [PATCH v2] package: dropbear: make PATH configurable

> Markus, All,
> 
> On 2018-03-09 14:41 -0800, Markus Mayer spake thusly:
>> Make the default PATH dropbear is using configurable.
> 
> We've discussed this with Thomas, and as Carlos noticed, we woudl need a
> similar solution for openssh.
> 
> But pushing the thing even further, we think a generic solution is even
> better:
> 
>  - in the "System configuration" sub-menu, add a new option that
>    basically is "Default PATH" and defaults to /bin:/sbin:/usr/bin:/usr/sbin

Notice that /bin and /sbin are redundant with their /usr counterparts for
BR2_ROOTFS_MERGED_USR=y.

>  - use that to set PATH in /etc/profile (from the skeleton-init-common
>    package)

In one of my current projects there is a /etc/profile.d/path.sh file in a
rootfs overlay containing

   #!/bin/sh
   PATH="$(test -L /bin || echo /bin:)$(test -L /sbin || echo /sbin:)/usr/bin:/usr/sbin"

-- 
Carlos Santos (Casantos) - DATACOM, P&D
