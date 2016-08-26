From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 21:42:08 +0200
Subject: [Buildroot] Remaining kmsxx build issue
In-Reply-To: <fd5d1345-f377-59e8-7270-39759b8ddfac@mind.be>
References: <20160819063024.55AF4101904@stock.ovh.net>
 <20160820000709.0ceef3cd@free-electrons.com>
 <20160819222925.GD6096@free.fr>
 <20160824185128.68a2fdef@free-electrons.com>
 <20160824224033.2276f19b@free-electrons.com>
 <fd5d1345-f377-59e8-7270-39759b8ddfac@mind.be>
Message-ID: <20160826214208.36fe8c70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 21:30:09 +0200, Arnout Vandecappelle wrote:

>  I also can't reproduce on my laptop, unless when I remove /usr/bin/gcc-ar :-)
> 
>  This piece of code is obviously broken. Unfortunately, I'm not sure how to fix
> it. Replace gcc-ar with ${CMAKE_C_COMPILER}-ar ? But that doesn't work if
> BR2_CCACHE=y... Symlink gcc-ar -> cross-gcc-ar in host/usr/bin? But that could
> create a discrepancy between the host gcc's LTO tools and the cross-tools.
> 
>  Oh, hang on, some genius moved the ccache support to the toolchain wrapper, so
> ${CMAKE_C_COMPILER}-ar might actually work... Let me try that...

Shouldn't instead this CMakeLists.txt allow to override the gcc-ar and
gcc-ranlib path using variables, like CMake normally does for the C and
C++ compilers with CMAKE_C_COMPILER and CMAKE_CXX_COMPILER ?

Samuel ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
