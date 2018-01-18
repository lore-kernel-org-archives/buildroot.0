From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 22:12:12 +0100
Subject: [Buildroot] [PATCH] swupdate: add upstream patch to fix musl
 build issue
In-Reply-To: <20180118125121.28953-1-joerg.krause@embedded.rocks>
References: <20180118125121.28953-1-joerg.krause@embedded.rocks>
Message-ID: <20180118221212.19e9303d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jan 2018 13:51:21 +0100, J?rg Krause wrote:
> Add upstream patch to fix build issue with the musl C library, as musl
> does not provide the GNU extension `strndupa()` breaking the build with
> an undefined reference:
> 
> ```
> ipc/lib.a(network_ipc.o): In function `ipc_postupdate':
> network_ipc.c:(.text.ipc_postupdate+0x39): undefined reference to `strndupa'
> ```
> 
> The upstream patch provides a compatibility header file adding a definition
> of `strndupa` if it is not already defined.
> 
> Backported from:
> https://github.com/sbabic/swupdate/commit/9867a9d6a21e6b0b9bcba57c3e2398fe671cea17
> 
> Fixes:
> http://autobuild.buildroot.net/results/f674219225d0b67d0bc78fd10b47a865250746f4/
> http://autobuild.buildroot.net/results/d2b0cfcfec583d203af1b26152f14ded3ebd3eee/
> http://autobuild.buildroot.net/results/1d0cbd1eb9b1b70bd9f4d1c4fae431baee9d105c/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...1-compat.h-introduce-compatibility-header.patch | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 package/swupdate/0001-compat.h-introduce-compatibility-header.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
