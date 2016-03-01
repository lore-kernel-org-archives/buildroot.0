From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 29 Feb 2016 23:09:01 -0300
Subject: [Buildroot] [PATCH 1/1] packages/linux-pam: bump version to 1.1.8
	-> 1.2.1
In-Reply-To: <1440356578-2205-1-git-send-email-brendanheading@gmail.com>
References: <1440356578-2205-1-git-send-email-brendanheading@gmail.com>
Message-ID: <1456798141-25486-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Move to the latest release of linux-pam. This allows us to remove
> a number of patches and consolidate the existing ones :
> 
> - 0001-configure.patch
> - 0007-rhosts.patch
> 
> these two patches deal with the ruserok function, which is not
> usable with uclibc. Consolidated into
> 0002-Conditionally-compile-per-ruserok-availability.patch.
> 
> - 0003-group.patch
> - 0005-succeed.patch
> - 0006-time.patch
> 
> these three patches deal with the innetgr function, which is not
> usable with uclibc. Consolidated into
> 0003-Conditionally-compile-per-innetgr-availability.patch.
> 
> - 0004-mkdir.patch
> 
> Fixed in upstream, no longer required.
> 
> - 0002-doc-makefile-am.patch
> 
> renamed to 0001-doc-makefile-am.patch.
> 
> - 0008-fix-CVE-2014-2583.patch
> - 0009-fix-CVE-2013-7041.patch
> 
> These patches are already included in the new release and so
> can be safely deleted.

Tested-by: Carlos Santos <casantos@datacom.ind.br>

Used the following configuration:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/x86_64-ctng_locales-linux-gnu.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="x86_64-ctng_locales-linux-gnu"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_LIBFFI=y
BR2_PACKAGE_LINUX_PAM=y
BR2_PACKAGE_LIBPAM_RADIUS_AUTH=y
BR2_PACKAGE_LIBPAM_TACPLUS=y

Built linux-pam-1.2.1, libpam-tacplus-1.3.9 and libpam-radius-auth-1.4.0.

Did not perform a run-time test, since it would require a network setup with
TACACS+ and RADIUS servers.
