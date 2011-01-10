From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jan 2011 18:51:27 +0100
Subject: [Buildroot] [PATCH 1/4] Add CMAKETARGETS infrastructure for
 CMake packages
In-Reply-To: <1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20110110185127.65bdb2e2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Dec 2010 20:29:12 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> +		-DCMAKE_SYSTEM_NAME:STRING="Linux" \
> +		-DCMAKE_C_COMPILER:FILEPATH="$$(CMAKE_TARGET_CC)" \
> +		-DCMAKE_CXX_COMPILER:FILEPATH="$$(CMAKE_TARGET_CXX)" \
> +		-DCMAKE_C_FLAGS:STRING="$$(CMAKE_TARGET_CFLAGS)" \
> +		-DCMAKE_CXX_FLAGS:STRING="$$(CMAKE_TARGET_CXXFLAGS)" \
> +		-DCMAKE_EXE_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
> +		-DCMAKE_MODULE_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
> +		-DCMAKE_SHARED_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
> +		-DCMAKE_FIND_ROOT_PATH:PATH="$$(STAGING_DIR)" \
> +		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM:STRING="NEVER" \
> +		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY:STRING="ONLY" \
> +		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE:STRING="ONLY" \
> +		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \

We lack CMAKE_PROGRAM_PATH and CMAKE_INSTALL_SO_NO_EXE in this list. As
pointed out by others, it'd be great if the infrastructure could use
the generated CMake toolchain file.

Could you update your patch set and resend ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
