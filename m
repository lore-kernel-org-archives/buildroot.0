From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Feb 2018 11:13:18 +0100
Subject: [Buildroot] [PATCH v2 5/5] package/gdb: remove 7.11
In-Reply-To: <20180205211015.26819-6-thomas.petazzoni@bootlin.com>
References: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
 <20180205211015.26819-6-thomas.petazzoni@bootlin.com>
Message-ID: <20180207101318.GE2464@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain, All,

On 2018-02-05 22:10 +0100, Thomas Petazzoni spake thusly:
> From: Romain Naour <romain.naour@gmail.com>
> 
> Now that 8.1 has been added and 8.0 is the default version, let's
> remove the old 7.11 release.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Config.in.legacy           | 7 +++++++
>  package/gdb/Config.in.host | 4 ----
>  package/gdb/gdb.hash       | 1 -
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 9cfe961d11..b5f9c2e145 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2018.02"
>  
> +config BR2_GDB_VERSION_7_11
> +	bool "gdb 7.11 has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The 7.11 version of gdb has been removed. Use a newer version
> +	  instead.
> +
>  config BR2_GDB_VERSION_7_10
>  	bool "gdb 7.10 has been removed"
>  	select BR2_LEGACY
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 8e872dbc6b..fe49263b1a 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -50,9 +50,6 @@ choice
>  	help
>  	  Select the version of gdb you wish to use.
>  
> -config BR2_GDB_VERSION_7_11
> -	bool "gdb 7.11.x"

Ditto, you forgot to remove it from BR2_PACKAGE_GDB_NEEDS_CXX11.

Regards,
Yann E. MORIN.

>  config BR2_GDB_VERSION_7_12
>  	bool "gdb 7.12.x"
>  
> @@ -74,7 +71,6 @@ endif
>  config BR2_GDB_VERSION
>  	string
>  	default "arc-2017.09-release-gdb" if BR2_arc
> -	default "7.11.1"   if BR2_GDB_VERSION_7_11
>  	default "7.12.1"   if BR2_GDB_VERSION_7_12
>  	default "8.0.1"    if BR2_GDB_VERSION_8_0 || !BR2_PACKAGE_HOST_GDB
>  	default "8.1"      if BR2_GDB_VERSION_8_1
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index cb76dca198..5571f98330 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -1,5 +1,4 @@
>  # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
> -sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
>  sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
>  sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
>  sha512  ffd82f415d7652d62dad1716c307836f594217a363429609beb7d70239e8bf06b73b393345b0e000796228e56681ed7656ac3c8be05e91d6d652ab0d5b1dc357	gdb-8.1.tar.xz
> -- 
> 2.14.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
