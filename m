From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:32:41 +0100
Subject: [Buildroot] [PATCH] yad: fix libgtk3 dependency
In-Reply-To: <1454504515-4365-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454504515-4365-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160207233241.7e5eb5b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  3 Feb 2016 10:01:55 -0300, Gustavo Zacarias wrote:
> Make it depend explicitly on BR2_PACKAGE_LIBGTK3_X11 (the X11 backend
> option) to avoid the checker from complaining.
> Also add a comment about yad requiring the X11 backend otherwise it's
> ambiguous if a user has libgtk3 enabled with broadway/wayland and the
> comment shows up. Fixes:
> http://autobuild.buildroot.net/results/84d/84d97bbcc0ea4f8eaa50dd25bf9ee8fdee4b937f/
> 
> Also cleanup some tiny whitespace in the package mk file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, but see one question below.

> ---
>  package/yad/Config.in | 6 +++---
>  package/yad/yad.mk    | 1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/yad/Config.in b/package/yad/Config.in
> index e4b63a2..50b97c5 100644
> --- a/package/yad/Config.in
> +++ b/package/yad/Config.in
> @@ -1,13 +1,13 @@
>  config BR2_PACKAGE_YAD
>  	bool "yad"
>  	depends on BR2_PACKAGE_XORG7
> -	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
> +	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3_X11

Is the BR2_PACKAGE_XORG7 dependency still needed, then?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
