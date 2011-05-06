From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Fri, 6 May 2011 15:49:40 +0200
Subject: [Buildroot] [PATCH] dropbear: fix static link for version 0.53.1
In-Reply-To: <1304253462-29820-1-git-send-email-plagnioj@jcrosoft.com>
References: <1304253462-29820-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <20110506134940.GM11267@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14:37 Sun 01 May     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> ---
Ping 

Best Regards,
J.
>  .../dropbear-0.53.1-static_build_fix.patch         |   26 ++++++++++++++++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 package/dropbear/dropbear-0.53.1-static_build_fix.patch
> 
> diff --git a/package/dropbear/dropbear-0.53.1-static_build_fix.patch b/package/dropbear/dropbear-0.53.1-static_build_fix.patch
> new file mode 100644
> index 0000000..0e0a91a
> --- /dev/null
> +++ b/package/dropbear/dropbear-0.53.1-static_build_fix.patch
> @@ -0,0 +1,26 @@
> +dropbear: fix static build
> +
> +the -lcrypt is missing during the link
> +
> +svr-authpasswd.o: In function `svr_auth_password':
> +svr-authpasswd.c:(.text+0xfc): undefined reference to `crypt'
> +collect2: ld returned 1 exit status
> +
> +Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> +---
> + Makefile.in |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: b/Makefile.in
> +===================================================================
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -77,7 +77,7 @@ STRIP=@STRIP@
> + INSTALL=@INSTALL@
> + CPPFLAGS=@CPPFLAGS@
> + CFLAGS+=-I. -I$(srcdir) $(CPPFLAGS) @CFLAGS@
> +-LIBS+=@LIBS@
> ++LIBS+=@CRYPTLIB@ @LIBS@
> + LDFLAGS=@LDFLAGS@
> + 
> + EXEEXT=@EXEEXT@
> -- 
> 1.7.4.1
