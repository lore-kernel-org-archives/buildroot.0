From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jan 2011 13:46:08 +0100
Subject: [Buildroot] [PATCH 06/10] libcuefile: new package
In-Reply-To: <1295369680-24816-7-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 18 Jan 2011 13:54:36 -0300")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pqrrbv5b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/multimedia/Config.in                |    1 +
 Gustavo>  package/multimedia/libcuefile/Config.in     |    6 ++++
 Gustavo>  package/multimedia/libcuefile/libcuefile.mk |   41 +++++++++++++++++++++++++++
 Gustavo>  3 files changed, 48 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 package/multimedia/libcuefile/Config.in
 Gustavo>  create mode 100644 package/multimedia/libcuefile/libcuefile.mk

 Gustavo> +++ b/package/multimedia/libcuefile/libcuefile.mk
 Gustavo> @@ -0,0 +1,41 @@
 Gustavo> +################################################################################
 Gustavo> +#
 Gustavo> +# libcuefile
 Gustavo> +#
 Gustavo> +################################################################################
 Gustavo> +
 Gustavo> +LIBCUEFILE_VERSION = r453
 Gustavo> +LIBCUEFILE_SITE = http://files.musepack.net/source
 Gustavo> +LIBCUEFILE_SOURCE = libcuefile_$(LIBCUEFILE_VERSION).tar.gz
 Gustavo> +LIBCUEFILE_DEPENDENCIES = host-cmake
 Gustavo> +LIBCUEFILE_INSTALL_STAGING = YES
 Gustavo> +
 Gustavo> +# CMake doesn't support having the --sysroot option directly in the
 Gustavo> +# compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
 Gustavo> +LIBCUEFILE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
 Gustavo> +LIBCUEFILE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)

Cmake also seems to have problems with ccache:

CMake Error: your C compiler: "/home/peko/source/buildroot/output2/host/usr/bin/ccache /home/peko/source/buildroot/output2/host/usr/bin/powerpc-unknown-linux-uclibc-gcc" was not found.   Please set CMAKE_C_COMPILER to a valid compiler path or name.
-- Configuring incomplete, errors occurred!
make[1]: ***
[/home/peko/source/buildroot/output2/build/libcuefile-r453/.stamp_configured]
Error 1

I don't know anything about cmake. Do you have any idea how to fix this?
Disable ccache for this build for now?

-- 
Bye, Peter Korsgaard
