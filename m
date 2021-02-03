From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 23:02:22 +0100
Subject: [Buildroot] [PATCH 0/3] grpc-related fixes
In-Reply-To: <20210203124325.18843-1-patrickdepinguin@gmail.com>
References: <20210203124325.18843-1-patrickdepinguin@gmail.com>
Message-ID: <20210203220222.GM2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-02-03 13:43 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Commit fedf3318e3fd3c9ba57389ed2b36472f1a772b9e removed an obsolete patch on
> grpc, but this had the side effect that building collectd after grpc no longer
> succeeded, because grpc_cpp_plugin from the target was executed.
> 
> During investigation of this issue, a number of related problems were found.
> This series addresses these problems.

Series applied to master, thanks.

> Thomas De Schampheleire (3):
>   package/collectd: stop passing '--with-libgrpc++'
>   package/grpc: fix cross-compilation with
>     gRPC_BUILD_GRPC_CPP_PLUGIN=OFF
>   package/grpc: disable unnecessary build plugins

I'll further reply to this last patch, though, because I have some
questions and suggestions.

Regards,
Yann E. MORIN.

>  package/collectd/collectd.mk                  |  3 --
>  ...ix-cross-compilation-with-gRPC_BUILD.patch | 43 +++++++++++++++++++
>  package/grpc/grpc.mk                          |  9 +++-
>  3 files changed, 51 insertions(+), 4 deletions(-)
>  create mode 100644 package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch
> 
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
