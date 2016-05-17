From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 May 2016 06:14:50 +0300
Subject: [Buildroot] [PATCH] package/jack2: fix build WRT backtrace
 support
In-Reply-To: <1463432615-14092-1-git-send-email-s.martin49@gmail.com>
References: <1463432615-14092-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20160517031450.GB2178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Mon, May 16, 2016 at 11:03:35PM +0200, Samuel Martin wrote:
> This change adds a patch checking for the presence of execinfo.h header
> and enabling the backtrace support depending on the check result.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/415/415e2100dc59d35e58646c07f7cdccabecdda966/
>   http://autobuild.buildroot.org/results/43c/43ca1b103434ae582fdf93cb5912b311960f303b/
>   http://autobuild.buildroot.org/results/391/391e71a988250ea66ec4dbee6f60fdce9eaf2766/
>   ...
> 
> Adapted from the PR:
>   https://github.com/jackaudio/jack2/pull/206
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  ...ace-support-depends-on-execinfo.h-existen.patch | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/jack2/0002-make-backtrace-support-depends-on-execinfo.h-existen.patch
> 
> diff --git a/package/jack2/0002-make-backtrace-support-depends-on-execinfo.h-existen.patch b/package/jack2/0002-make-backtrace-support-depends-on-execinfo.h-existen.patch
> new file mode 100644
> index 0000000..2b95dc2
> --- /dev/null
> +++ b/package/jack2/0002-make-backtrace-support-depends-on-execinfo.h-existen.patch
> @@ -0,0 +1,57 @@
> +From 4cf9986b00f928d465866e427d310bd3e70a972f Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Mon, 16 May 2016 22:26:05 +0200
> +Subject: [PATCH] make backtrace support depends on execinfo.h existence
> +

Your sign-off is missing here.

baruch

> +---
> + dbus/sigsegv.c | 8 +++++++-
> + wscript        | 1 +
> + 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
