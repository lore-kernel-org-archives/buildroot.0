From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 23:25:40 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: select libgcrypt
In-Reply-To: <20170705194653.19890-2-aperez@igalia.com>
References: <20170705194653.19890-1-aperez@igalia.com>
 <20170705194653.19890-2-aperez@igalia.com>
Message-ID: <20170706232540.4c9a2425@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 22:46:53 +0300, Adrian Perez de Castro wrote:
> Libgrcrypt is a direct dependency of WebKitGTK+, and as such it
> should be selected.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/Config.in    | 1 +
>  package/webkitgtk/webkitgtk.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

When you select a package, you must replicate its dependencies. So in
this case, when you add "select BR2_PACKAGE_LIBGCRYPT", you must add
"depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS".

Of course, the set of architectures supported by WebKitGTK+ is probably
already smaller than the set of architectures supported by
libgpg-error, but for consistency reasons, replicating the dependency
is recommended.

I've applied your patch after addressing this issue. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
