From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 20:38:27 +0100
Subject: [Buildroot] [PATCH 3/9] grub: replace string option for
 filesystem selection by booleans
In-Reply-To: <1388242600-2580-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131228193827.GH3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-28 15:56 +0100, Thomas Petazzoni spake thusly:
> In 1cece2813bf635ae29e9a8287322439b9c5992f7 (grub: add option to
> configure the list of supported filesystems), we introduced the
> BR2_TARGET_GRUB_FS_SUPPORT option which allows to provide a
> space-separated list of filesystems that Grub should support.
> 
> However, it turns out that this not very practical, because the
> iso9660 filesystem logic in Buildroot should force the ISO9660 support
> to be enabled in Grub, which is not easy to do with a string option.
> 
> Therefore, this patch changes this option from a string option to a
> list of boolean option, one per filesystem supported.
> 
> A few useful details:
> 
>  - Since Grub legacy is dead, the list of filesystem, and therefore
>    the number of options, will not grow.
> 
>  - We have only added options for filesystems that are likely to be
>    used in an embedded Linux context. Filesystems such as VSTAfs,
>    Minix, UFS2 or FFS2 are not supported.
> 
>  - There is no need to add some Config.in.legacy support for the
>    previous option, since it was added after Buildroot 2013.11, and
>    was therefore never part of an official Buildroot release.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
