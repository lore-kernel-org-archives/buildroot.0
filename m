From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Oct 2014 23:33:07 +0200
Subject: [Buildroot] [PATCH 1/1 v3] ubus: new package
In-Reply-To: <1413280007-16819-1-git-send-email-swexru@gmail.com>
References: <1413280007-16819-1-git-send-email-swexru@gmail.com>
Message-ID: <543D9693.5070609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/14 11:46, Alexey Mednyy wrote:
> Signed-off-by: Alexey Mednyy <swexru@gmail.com>
> ---
>  package/Config.in                              |  1 +
>  package/ubus/Config.in                         | 14 +++++++++++++
>  package/ubus/ubus-01-json-definition-fix.patch | 27 +++++++++++++++++++++++++
>  package/ubus/ubus.mk                           | 28 ++++++++++++++++++++++++++
>  4 files changed, 70 insertions(+)
>  create mode 100644 package/ubus/Config.in
>  create mode 100644 package/ubus/ubus-01-json-definition-fix.patch
>  create mode 100644 package/ubus/ubus.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 19bb9bf..16d4901 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -896,6 +896,7 @@ menu "Other"
>  	source "package/startup-notification/Config.in"
>  	source "package/tz/Config.in"
>  	source "package/tzdata/Config.in"
> +	source "package/ubus/Config.in"
>  endmenu
>  
>  menu "Security"
> diff --git a/package/ubus/Config.in b/package/ubus/Config.in
> new file mode 100644
> index 0000000..b0f5de9
> --- /dev/null
> +++ b/package/ubus/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_UBUS
> +	bool "ubus"
> +	select BR2_PACKAGE_LIBUBOX
> +	select BR2_PACKAGE_JSON_C
> +	depends on !BR2_PREFER_STATIC_LIB
> +	help
> +	  OpenWrt micro bus architecture, project
> +	  provide communication between various 
> +	  daemons and applications.
> +
> +	  http://wiki.openwrt.org/doc/techref/ubus
> +
> +comment "ubus needs toolchain w/ dynamic library"
> +	depends on BR2_PREFER_STATIC_LIB
> diff --git a/package/ubus/ubus-01-json-definition-fix.patch b/package/ubus/ubus-01-json-definition-fix.patch
> new file mode 100644
> index 0000000..50f9096
> --- /dev/null
> +++ b/package/ubus/ubus-01-json-definition-fix.patch
> @@ -0,0 +1,27 @@

 In addition to Samuel's comments, a path should have a description and a
Signed-off-by line, just like if it was an actual commit (see [1]). We would
anyway like you to upstream this patch to OpenWRT, so you'll need that commit
message and SoB there anyway.

> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index cb2f420..86c4c4d 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
[snip]


 Regards,
 Arnout

[1]
http://nightly.buildroot.org/manual.html#_format_and_licensing_of_the_package_patches

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
