From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 00:38:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/samba4: drop unneeded second
 patch
In-Reply-To: <20190609151516.19626-1-fontaine.fabrice@gmail.com>
References: <20190609151516.19626-1-fontaine.fabrice@gmail.com>
Message-ID: <aaf82b88-3ce0-9384-da1b-8af5d3980d8f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/06/2019 17:15, Fabrice Fontaine wrote:
> This patch is not needed since version 4.9.0 and
> https://github.com/samba-team/samba/commit/859698d29b547217356851094ed8188236e717b6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...ion-of-Samba-4.7.4-with-disabled-ADS.patch | 41 -------------------
>  ...on-64bit-platforms-by-including-std.patch} |  0
>  ...build-of-manpages-and-documentation.patch} |  0
>  ...o.c-include-stdint.h-before-cmoka.h.patch} |  0
>  4 files changed, 41 deletions(-)
>  delete mode 100644 package/samba4/0002-Fix-compilation-of-Samba-4.7.4-with-disabled-ADS.patch
>  rename package/samba4/{0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch => 0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch} (100%)
>  rename package/samba4/{0004-Disable-build-of-manpages-and-documentation.patch => 0003-Disable-build-of-manpages-and-documentation.patch} (100%)
>  rename package/samba4/{0005-test_regfio.c-include-stdint.h-before-cmoka.h.patch => 0004-test_regfio.c-include-stdint.h-before-cmoka.h.patch} (100%)
> 
> diff --git a/package/samba4/0002-Fix-compilation-of-Samba-4.7.4-with-disabled-ADS.patch b/package/samba4/0002-Fix-compilation-of-Samba-4.7.4-with-disabled-ADS.patch
> deleted file mode 100644
> index 45d3050a39..0000000000
> --- a/package/samba4/0002-Fix-compilation-of-Samba-4.7.4-with-disabled-ADS.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From da2f2cf8e7a1dfcb661b707e4649cec1e8a0e79c Mon Sep 17 00:00:00 2001
> -From: Bernd Kuhls <bernd.kuhls@t-online.de>
> -Date: Thu, 9 Aug 2018 10:03:06 +0200
> -Subject: [PATCH] Fix compilation of Samba 4.7.4 with disabled ADS
> -
> -Downloaded from upstream mailinglist
> -https://lists.samba.org/archive/samba-technical/2017-December/124629.html
> -
> -Patch originates from FreeBSD:
> -https://svnweb.freebsd.org/ports/head/net/samba47/files/patch-source3__libads__kerberos_keytab.c?revision=457119&view=markup
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - source3/libads/kerberos_keytab.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/source3/libads/kerberos_keytab.c b/source3/libads/kerberos_keytab.c
> -index 37ac7ba985e..71250962090 100644
> ---- a/source3/libads/kerberos_keytab.c
> -+++ b/source3/libads/kerberos_keytab.c
> -@@ -32,8 +32,6 @@
> - 
> - #ifdef HAVE_KRB5
> - 
> --#ifdef HAVE_ADS
> --
> - /* This MAX_NAME_LEN is a constant defined in krb5.h */
> - #ifndef MAX_KEYTAB_NAME_LEN
> - #define MAX_KEYTAB_NAME_LEN 1100
> -@@ -85,6 +83,8 @@ out:
> - 	return ret;
> - }
> - 
> -+#ifdef HAVE_ADS
> -+
> - /**********************************************************************
> -  Adds a single service principal, i.e. 'host' to the system keytab
> - ***********************************************************************/
> --- 
> -2.14.4
> -
> diff --git a/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch b/package/samba4/0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
> similarity index 100%
> rename from package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
> rename to package/samba4/0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
> diff --git a/package/samba4/0004-Disable-build-of-manpages-and-documentation.patch b/package/samba4/0003-Disable-build-of-manpages-and-documentation.patch
> similarity index 100%
> rename from package/samba4/0004-Disable-build-of-manpages-and-documentation.patch
> rename to package/samba4/0003-Disable-build-of-manpages-and-documentation.patch
> diff --git a/package/samba4/0005-test_regfio.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0004-test_regfio.c-include-stdint.h-before-cmoka.h.patch
> similarity index 100%
> rename from package/samba4/0005-test_regfio.c-include-stdint.h-before-cmoka.h.patch
> rename to package/samba4/0004-test_regfio.c-include-stdint.h-before-cmoka.h.patch
> 
