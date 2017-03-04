From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 23:47:05 +0100
Subject: [Buildroot] [PATCH 1/2] wayland: bump to version 1.13.0
In-Reply-To: <20170302152630.28568-1-gustavo@zacarias.com.ar>
References: <20170302152630.28568-1-gustavo@zacarias.com.ar>
Message-ID: <20170304234705.2d0ee879@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Mar 2017 12:26:29 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wayland/wayland.hash | 4 ++--
>  package/wayland/wayland.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

This causes some build failures:

  http://autobuild.buildroot.net/results/291/291e0f1ea18004190ae5acd9bec147cacc3e4bda/build-end.log

The problem is that it tries to build one test written in C++, while
wayland doesn't depend on C++ support. I guess the build of tests
should be disabled.

Could you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
