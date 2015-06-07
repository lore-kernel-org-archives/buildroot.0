From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 15:14:05 +0200
Subject: [Buildroot] [PATCH v5 12/13] package/vlc: add opencv support
In-Reply-To: <1433672799-21387-13-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-13-git-send-email-s.martin49@gmail.com>
Message-ID: <20150607131405.GM3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-07 12:26 +0200, Samuel Martin spake thusly:
> This change adds 2 patches (backported from upstream) to vlc fixing the
> build against opencv2 APIs.
> This allows to select the minimal set of opencv modules when opencv
> support is enabled.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v4->v5:
> - new patch
> ---
>  ...opencv_wrapper-use-opencv2-style-includes.patch | 34 ++++++++++++++++++++++
>  ...cv_example-add-missing-include-statements.patch | 27 +++++++++++++++++
>  package/vlc/Config.in                              |  2 ++
>  package/vlc/vlc.mk                                 |  8 ++++-
>  4 files changed, 70 insertions(+), 1 deletion(-)
>  create mode 100644 package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
>  create mode 100644 package/vlc/0009-opencv_example-add-missing-include-statements.patch
> 
> diff --git a/package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch b/package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
> new file mode 100644
> index 0000000..c8a3e02
> --- /dev/null
> +++ b/package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
> @@ -0,0 +1,34 @@
> +From cc236e4652255902f2c2cee3b18f83367f35a8c7 Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Sun, 24 May 2015 14:30:09 +0200
> +Subject: [PATCH 8/9] opencv_wrapper: use opencv2-style includes
> +
> +If old opencv1-style legacy include directory is available, this change
> +becomes purely cosmetic (maybe will compile a bit faster).
> +It becomes an FTBFS fix when opencv1-style include directory is missing
> +(i.e. from opencv-3.0).
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>

Since this patch is a backport from upstream, it would be nice to
provide the link to the corresponding commit:
    https://git.videolan.org/?p=vlc.git;a=commit;h=cc236e4652255902f2c2cee3b18f83367f35a8c7

[--SNIP--]
> diff --git a/package/vlc/0009-opencv_example-add-missing-include-statements.patch b/package/vlc/0009-opencv_example-add-missing-include-statements.patch
> new file mode 100644
> index 0000000..1754066
> --- /dev/null
> +++ b/package/vlc/0009-opencv_example-add-missing-include-statements.patch
> @@ -0,0 +1,27 @@
> +From b82416d7000a993b33e903095a590fe32212a85e Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Sun, 24 May 2015 14:30:10 +0200
> +Subject: [PATCH 9/9] opencv_example: add missing #include statements
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>

Ditto;
    https://git.videolan.org/?p=vlc.git;a=commit;h=b82416d7000a993b33e903095a590fe32212a85e

Otherwise, looks good:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
