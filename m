From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Dec 2012 21:38:39 +0100
Subject: [Buildroot] [PATCH 12/19] package/libseccomp: new package
In-Reply-To: <caac6f2b10b2b3a3d473e552c106e9e748243cf9.1355676845.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 16 Dec 2012 17:56:19 +0100")
References: <cover.1355676845.git.yann.morin.1998@free.fr>
 <cover.1355676845.git.yann.morin.1998@free.fr>
 <caac6f2b10b2b3a3d473e552c106e9e748243cf9.1355676845.git.yann.morin.1998@free.fr>
Message-ID: <871uepd968.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> ---
 Yann>  package/Config.in                                  |    1 +
 Yann>  package/libseccomp/Config.in                       |   13 +++++++++++
 Yann>  ...ibseccomp-use-system-headers-from-sysroot.patch |   17 +++++++++++++++
 Yann>  package/libseccomp/libseccomp.mk                   |   22 ++++++++++++++++++++
 Yann>  4 files changed, 53 insertions(+), 0 deletions(-)
 Yann>  create mode 100644 package/libseccomp/Config.in
 Yann>  create mode 100644 package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch
 Yann>  create mode 100644 package/libseccomp/libseccomp.mk

 Yann> diff --git a/package/Config.in b/package/Config.in
 Yann> index eff2887..2f67d10 100644
 Yann> --- a/package/Config.in
 Yann> +++ b/package/Config.in
 Yann> @@ -523,6 +523,7 @@ source "package/libical/Config.in"
 Yann>  source "package/libnspr/Config.in"
 Yann>  source "package/libsigc/Config.in"
 Yann>  source "package/libtpl/Config.in"
 Yann> +source "package/libseccomp/Config.in"
 Yann>  source "package/liburcu/Config.in"
 Yann>  source "package/linux-pam/Config.in"
 Yann>  source "package/lttng-libust/Config.in"
 Yann> diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
 Yann> new file mode 100644
 Yann> index 0000000..183cf4e
 Yann> --- /dev/null
 Yann> +++ b/package/libseccomp/Config.in
 Yann> @@ -0,0 +1,13 @@
 Yann> +config BR2_PACKAGE_LIBSECCOMP
 Yann> +	bool "libseccomp"
 Yann> +	help
 Yann> +	  High level interface to the Linux Kernel's seccomp filter 
 Yann> +	  
 Yann> +	  The libseccomp library provides and easy to use, platform independent,

s/and/an/. I know this is just cut'n'pasted from the sf.net website, but
I've fixed it anyway and committed, thanks.

-- 
Bye, Peter Korsgaard
