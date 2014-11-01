From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:03:20 +0100
Subject: [Buildroot] [PATCH] dstat: propagate python dependencies
In-Reply-To: <1414769654-20569-1-git-send-email-jezz@sysmic.org>
References: <1414769654-20569-1-git-send-email-jezz@sysmic.org>
Message-ID: <20141101150320.7dd9e8db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri, 31 Oct 2014 16:34:14 +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/dstat/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/dstat/Config.in b/package/dstat/Config.in
> index 62a392a..52fbb49 100644
> --- a/package/dstat/Config.in
> +++ b/package/dstat/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_DSTAT
>  	bool "dstat"
>  	depends on BR2_USE_WCHAR # python
>  	depends on BR2_USE_MMU # python
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # python
>  	select BR2_PACKAGE_PYTHON
>  	help
>  	  Dstat, written in Python, is a versatile replacement for vmstat,
> @@ -22,4 +23,4 @@ config BR2_PACKAGE_DSTAT
>  
>  comment "dstat needs a toolchain w/ wchar"

You forgot to update the comment here regarding the new thread
dependency.

Committed with this fixed, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
