From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 14 Jun 2015 19:24:09 +0300
Subject: [Buildroot] [PATCH 2/6] uclibc: add libgcc_s_resume fix
In-Reply-To: <1434292411-5003-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1434292411-5003-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614162409.GC8165@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jun 14, 2015 at 04:33:27PM +0200, Thomas Petazzoni wrote:
> diff --git a/package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch b/package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch
> new file mode 100644
> index 0000000..8a165f3
> --- /dev/null
> +++ b/package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch
> @@ -0,0 +1,53 @@
> +From 7ed8bacef45a2537646e7235092bd2e5408cd0b5 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Sun, 14 Jun 2015 15:14:22 +0200
> +Subject: [PATCH] Fix libgcc_s_resume issue
> +
> +When built with gcc 5.1, uClibc-ng fails to build with the following
> +issue:

This patch is for uClibc.

> +
> +   librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
> +   rt-unwind-resume.c:(.text+0x3c): undefined reference to

Is that the full error message? I have that strange feeling that something is 
missing. Same goes for the uClibc-ng patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
