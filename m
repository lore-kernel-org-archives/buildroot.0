From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 17:04:58 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mono: bump to version 4.0.1
In-Reply-To: <1430402595-5355-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1430402595-5355-1-git-send-email-angelo.compagnucci@gmail.com>
 <1430402595-5355-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150502170458.33cf0b9c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 30 Apr 2015 16:03:15 +0200, Angelo Compagnucci wrote:

> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index 1db5df4..a16f098 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -14,27 +14,5 @@ config BR2_PACKAGE_MONO
>  
>  	  http://download.mono-project.com/sources/mono/
>  
> -if BR2_PACKAGE_MONO
> -
> -config BR2_PACKAGE_MONO_20
> -	bool "2.0/3.5 .Net Runtime"
> -	help
> -	  This option enables the installation of the 2.0/3.5 version
> -	  of the Mono .Net runtime to the target
> -
> -config BR2_PACKAGE_MONO_40
> -	bool "4.0 .Net Runtime"
> -	help
> -	  This option enables the installation of the 4.0 version
> -	  of the Mono .Net runtime to the target
> -
> -config BR2_PACKAGE_MONO_45
> -	bool "4.5 .Net Runtime"
> -	help
> -	  This option enables the installation of the 4.5 version
> -	  of the Mono .Net runtime to the target
> -
> -endif

When you remove options, you need to add Config.in.legacy handling for
them.

Also, you forgot to remove the line:

  select BR2_PACKAGE_MONO_45 if !BR2_PACKAGE_MONO_20 && !BR2_PACKAGE_MONO_40

which didn't make sense anymore.

Committed with these issues fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
