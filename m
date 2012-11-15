From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Nov 2012 16:12:18 +0100
Subject: [Buildroot] [PATCH] binutils: add version 2.23.1
In-Reply-To: <1352988528-20158-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 15 Nov 2012 11:08:48 -0300")
References: <1352988528-20158-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lie25299.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/binutils/Config.in.host                    |    5 +++
 Gustavo>  package/binutils/binutils-2.23.1/120-sh-conf.patch |   29 +++++++++++++++
 Gustavo>  .../300-001_ld_makefile_patch.patch                |   24 +++++++++++++
 Gustavo>  .../300-012_check_ldrunpath_length.patch           |   21 +++++++++++
 Gustavo>  package/binutils/binutils-2.23.1/500-sysroot.patch |   37 ++++++++++++++++++++
 Gustavo>  5 files changed, 116 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 package/binutils/binutils-2.23.1/120-sh-conf.patch
 Gustavo>  create mode 100644 package/binutils/binutils-2.23.1/300-001_ld_makefile_patch.patch
 Gustavo>  create mode 100644 package/binutils/binutils-2.23.1/300-012_check_ldrunpath_length.patch
 Gustavo>  create mode 100644 package/binutils/binutils-2.23.1/500-sysroot.patch

 Gustavo> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
 Gustavo> index 26c5f73..7a9eae8 100644
 Gustavo> --- a/package/binutils/Config.in.host
 Gustavo> +++ b/package/binutils/Config.in.host
 Gustavo> @@ -36,6 +36,10 @@ choice
 Gustavo>  		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 Gustavo>  		bool "binutils 2.23"
 
 Gustavo> +	config BR2_BINUTILS_VERSION_2_23_1
 Gustavo> +		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 Gustavo> +		bool "binutils 2.23.1"
 Gustavo> +

I know we have been doing it in the past because of various arch issues,
but does it make sense to keep both 2.23 and 2.23.1?

-- 
Bye, Peter Korsgaard
