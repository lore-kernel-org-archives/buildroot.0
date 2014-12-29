From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 13:26:28 +0100
Subject: [Buildroot] [PATCH 1/3] oprofile: fix nanosleep() issue on
 non-threaded toolchains
In-Reply-To: <1419851113-11865-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419851113-11865-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419851113-11865-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141229132628.43f1ce96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Dec 2014 12:05:11 +0100, Thomas Petazzoni wrote:

> diff --git a/package/oprofile/0001-Include-time.h-for-nanosleep.patch b/package/oprofile/0001-Include-time.h-for-nanosleep.patch
> new file mode 100644
> index 0000000..d4a9ca2
> --- /dev/null
> +++ b/package/oprofile/0001-Include-time.h-for-nanosleep.patch
> @@ -0,0 +1,44 @@
> +From c5b93c33a81d7c52dc6089387e415f2d653f758f Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Mon, 29 Dec 2014 11:43:51 +0100
> +Subject: [PATCH] Include <time.h> for nanosleep()
> +
> +The nanosleep() function prototype is in <time.h>, so this header file
> +should be included whenever nanosleep() is used. Not including it
> +causes some issues when building OProfile against a non-thread capable
> +version of the uClibc C library, probably because in such situation,
> +<time.h> does not get included by another header.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch sent upstream at https://sourceforge.net/p/oprofile/bugs/277/.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
