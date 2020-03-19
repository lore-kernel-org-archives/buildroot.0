From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2020 23:01:17 +0100
Subject: [Buildroot] [PATCH] boot/barebox-ayx: store downloads in same
 dir as bare barebox
In-Reply-To: <20200319214900.2992-1-yann.morin.1998@free.fr>
References: <20200319214900.2992-1-yann.morin.1998@free.fr>
Message-ID: <20200319220117.GJ10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All, me,

Me: please be careful to the typo in the commit title... :-[

Regards,
Yann E. MORIN.

On 2020-03-19 22:49 +0100, Yann E. MORIN spake thusly:
> barebox and barebox-aux are really the same package, from the same URL
> and the same version. They deserve being stored in the same directory.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  boot/barebox/barebox.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index f11f9950d1..3d7492598f 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -31,6 +31,8 @@ $(1)_SOURCE = barebox-$$($(1)_VERSION).tar.bz2
>  $(1)_SITE = https://www.barebox.org/download
>  endif
>  
> +$(1)_DL_SUBDIR = barebox
> +
>  $(1)_DEPENDENCIES = host-lzop
>  $(1)_LICENSE = GPL-2.0 with exceptions
>  ifeq ($(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
