From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:48:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/libwebsockets: fix build with
 libev
In-Reply-To: <20191006125339.23402-2-fontaine.fabrice@gmail.com>
References: <20191006125339.23402-1-fontaine.fabrice@gmail.com>
 <20191006125339.23402-2-fontaine.fabrice@gmail.com>
Message-ID: <20191007224803.0642a3fd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 14:53:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b5a2188dce90f3ca9bf0cc7a043c1a946b8e288f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ix-build-with-libev-and-without-test.patch | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch
> 
> diff --git a/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch
> new file mode 100644
> index 0000000000..ff85571fc9
> --- /dev/null
> +++ b/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch
> @@ -0,0 +1,52 @@
> +From 72c761789550703f004962ae164c415928e5e35c Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 6 Oct 2019 14:45:15 +0200
> +Subject: [PATCH] CMakeLists.txt: fix build with libev and without testapps
> +
> +Move libev workaround outside the
> +if ((LWS_ROLE_H1 OR LWS_ROLE_H2) AND NOT LWS_WITHOUT_TESTAPPS) block
> +otherwise build fails on:
> +
> +/home/naourr/work/instance-1/output-1/build/libwebsockets-3.2.0/lib/event-libs/libev/libev.c: In function 'lws_ev_hrtimer_cb':
> +/home/naourr/work/instance-1/output-1/build/libwebsockets-3.2.0/lib/event-libs/libev/libev.c:34:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> +   ev_timer_set(&pt->ev.hrtimer, ((float)us) / 1000000.0, 0);
> +   ^~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/b5a2188dce90f3ca9bf0cc7a043c1a946b8e288f
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/warmcat/libwebsockets/pull/1707]

I changed that to the actual commit that was merged, since it has been
merged now. Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
