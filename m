From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 14:21:02 +0100
Subject: [Buildroot] [PATCH 2/2] package/wayland: don't build tests
In-Reply-To: <59483ee76c501ec78cfbb2250c3fbcf02f6f7a85.1488711390.git.yann.morin.1998@free.fr>
References: <cover.1488711390.git.yann.morin.1998@free.fr>
 <59483ee76c501ec78cfbb2250c3fbcf02f6f7a85.1488711390.git.yann.morin.1998@free.fr>
Message-ID: <20170305142102.0faed242@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Mar 2017 11:56:51 +0100, Yann E. MORIN wrote:
> wayland is entirely written in C, except for a single test that is
> written in C++.
> 
> Since we are not interested in running the tests on the target, add an
> option to configure to disable tests altogether.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/291/291e0f1ea18004190ae5acd9bec147cacc3e4bda/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I think this solves our (Buildroot) immediate problem, but is not the
completely correct fix for upstream. Indeed, if Wayland is trying to
build some C++ code, it should use AC_PROG_CXX and then only try to
build the C++ code if it found a C++ compiler.

But well, this --disable-tests thing is definitely good enough for us,
so I'll apply this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
