From: Rico Bachmann <bachmann@tofwerk.com>
Date: Tue, 01 May 2012 10:41:36 +0200
Subject: [Buildroot] [git commit] libfcgi: fix build with C++ support
	and gcc >= 4.4
References: <20120430193954.02DA196C2A@busybox.osuosl.org>
Message-ID: <op.wdmfrmfg705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 30.04.2012, 21:38 Uhr, schrieb Peter Korsgaard  
<jacmet@sunsite.dk>:

> commit:  
> http://git.buildroot.net/buildroot/commit/?id=ae63ca8f4782b91fd9e41316bfb79a43f54f5cd2
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> As reported on the ml by Rico Bachmann.
>
> Signed-off-by: Peter Korsgaard  
> <jacmet@sunsite.dk>
> ---
>  package/libfcgi/libfcgi-eof.patch |   24 ++++++++++++++++++++++++
>  1 files changed, 24 insertions(+), 0 deletions(-)
>
> diff --git a/package/libfcgi/libfcgi-eof.patch  
> b/package/libfcgi/libfcgi-eof.patch
> new file mode 100644
> index 0000000..e731426
> --- /dev/null
> +++ b/package/libfcgi/libfcgi-eof.patch
> @@ -0,0 +1,24 @@
> +[PATCH] fix build with C++ support and gcc >= 4.4
> +
> +EOF is defined in stdio, so ensure it is included.
> +
> +Based on similar patch by Markus Rothe:
> +http://comments.gmane.org/gmane.comp.web.fastcgi.devel/3205
> +
> +Signed-off-by: Peter Korsgaard  
> <jacmet@sunsite.dk>
> +---
> + libfcgi/fcgio.cpp |    1 +
> + 1 file changed, 1 insertion(+)
> +
> +Index: fcgi-2.4.0/libfcgi/fcgio.cpp
> +===================================================================
> +--- fcgi-2.4.0.orig/libfcgi/fcgio.cpp
> ++++ fcgi-2.4.0/libfcgi/fcgio.cpp
> +@@ -22,6 +22,7 @@
> + #define DLLAPI  __declspec(dllexport)
> + #endif
> +
> ++#include <cstdio>
> + #include <limits.h>
> + #include "fcgio.h"

Thanks for adding the patch.
I've just want to do it right now.
