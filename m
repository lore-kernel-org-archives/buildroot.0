From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jan 2011 18:17:05 +0100
Subject: [Buildroot] [PATCH 1/4] Add CMAKETARGETS infrastructure for
 CMake packages
In-Reply-To: <1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20110107181705.20654fb0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bjorn,

On Sun, 12 Dec 2010 20:29:12 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> +# CMake doesn't support having the --sysroot option directly in the
> +# compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
> +CMAKE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
> +CMAKE_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
> +CMAKE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
> +CMAKE_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX)) $(TARGET_CXXFLAGS)

Those definitions should be *outside* the CMAKETARGETS_INNER macro,
because:

 1/ They might be useful even if no package makes use of the
    CMAKETARGETS infrastructure

 2/ They are not package specific, so they have no reason to be inside
    the macro.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
