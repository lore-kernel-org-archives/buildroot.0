From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 00:04:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/gloox: fix build on musl
In-Reply-To: <20200605214016.248017-1-fontaine.fabrice@gmail.com>
References: <20200605214016.248017-1-fontaine.fabrice@gmail.com>
Message-ID: <20200605220414.GU13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-05 23:40 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/a61a91bb6e1156eff5fb756f9dccfc2bb6c0f277
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...src-connectiontcpserver-cpp-fix-musl.patch | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch
> 
> diff --git a/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch b/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch
> new file mode 100644
> index 0000000000..56a2d4982c
> --- /dev/null
> +++ b/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch
> @@ -0,0 +1,25 @@
> +src/connectiontcpserver.cpp: fix musl build
> +
> +Build on musl fails on:
> +
> +connectiontcpserver.cpp:131:13: error: 'strerror' was not declared in this scope
> +           + strerror( err ) + " (errno: " + util::int2string( err ) + ")";
> +             ^~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/a61a91bb6e1156eff5fb756f9dccfc2bb6c0f277
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://bugs.camaya.net/ticket/?id=291]
> +
> +diff -Nuar gloox-1.0.23-orig/src/connectiontcpserver.cpp gloox-1.0.23/src/connectiontcpserver.cpp
> +--- gloox-1.0.23-orig/src/connectiontcpserver.cpp	2020-06-05 23:22:59.624018949 +0200
> ++++ gloox-1.0.23/src/connectiontcpserver.cpp	2020-06-05 23:26:20.708027221 +0200
> +@@ -36,6 +36,7 @@
> + # include <resolv.h>
> + # include <netdb.h>
> + # include <arpa/inet.h>
> ++# include <string.h>
> + # include <sys/socket.h>
> + # include <sys/un.h>
> + # include <sys/select.h>
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
