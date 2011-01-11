From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jan 2011 11:27:35 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <20110111112228.263c00cb@surf>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<20110107181536.53713c9a@surf> <20110110185013.331f5af1@surf>
	<AANLkTimq86Kw6oCyacEhwE+YpcQa4H8etr49hCAyNz4y@mail.gmail.com>
	<20110111112228.263c00cb@surf>
Message-ID: <20110111112735.22f56e09@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Jan 2011 11:22:28 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> +       set(CMAKE_C_FLAGS \"$(CMAKE_TARGET_CFLAGS)\" CACHE STRING \"\" FORCE)\n\
> +       set(CMAKE_CXX_FLAGS \"$(CMAKE_TARGET_CXXFLAGS)\" CACHE STRING \"\" FORCE)\n\
> +       set(CMAKE_EXE_LINKER_FLAGS \"$(CMAKE_TARGET_LDFLAGS)\" CACHE STRING \"\" FORCE)\n\


Argh, it should probably be :


> +       set(CMAKE_C_FLAGS \"${CMAKE_C_FLAGS} $(CMAKE_TARGET_CFLAGS)\" CACHE STRING \"\" FORCE)\n\
> +       set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} $(CMAKE_TARGET_CXXFLAGS)\" CACHE STRING \"\" FORCE)\n\
> +       set(CMAKE_EXE_LINKER_FLAGS \"${CMAKE_EXE_LINKER_FLAGS} $(CMAKE_TARGET_LDFLAGS)\" CACHE STRING \"\" FORCE)\n\

To keep the possibly existing values of CMAKE_C_FLAGS, CMAKE_CXX_FLAGS
and CMAKE_EXE_LINKER_FLAGS.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
