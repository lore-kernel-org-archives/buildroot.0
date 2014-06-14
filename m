From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 23:04:07 +0200
Subject: [Buildroot] [PATCH 1/1] libtirpc : always include svc_auth_none
In-Reply-To: <1402779467-13505-1-git-send-email-sagaert.johan@skynet.be>
References: <1402779467-13505-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140614210407.GE3503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert, All,

On 2014-06-14 22:57 +0200, Sagaert Johan spake thusly:
> This function is needed in rpcbind >= 0.2.1
> without this patch the linking of rpcbind > 0.2.1 will fail.
> (based on http://www.spinics.net/lists/linux-nfs/msg27277.html )

Does that fix an autobuilder issue? If so, please add:

    Fixes:
        http://autobuild.b.n/results/XXX/SHA1

> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  ...btirpc-0011-always-include-svc_auth_none.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/libtirpc/libtirpc-0011-always-include-svc_auth_none.patch
> 
> diff --git a/package/libtirpc/libtirpc-0011-always-include-svc_auth_none.patch b/package/libtirpc/libtirpc-0011-always-include-svc_auth_none.patch
> new file mode 100644
> index 0000000..66c660c
> --- /dev/null
> +++ b/package/libtirpc/libtirpc-0011-always-include-svc_auth_none.patch
> @@ -0,0 +1,39 @@
> +From 02c9f3898e4189bb0ec817d492b36da6de31abf8 Mon Sep 17 00:00:00 2001
> +From: Sagaert Johan <sagaert.johan@skynet.be>
> +Date: Sat, 14 Jun 2014 22:02:59 +0200
> +Subject: [PATCH 1/1] always include svc_auth_none
> +
> +(needed by rpcbind >=0.2.1 )
> +
> +Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

Since you use the patch as-is, you should keep the authorship of the
patch, and just add your own SoB line.

Regards,
Yann E. MORIN.

> +---
> + src/Makefile.am | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index bd276cf..a6313b7 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -48,16 +48,15 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
> +         getrpcport.c mt_misc.c pmap_clnt.c pmap_getmaps.c pmap_getport.c \
> +         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c \
> +         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
> +-        rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_generic.c \
> +-        svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c
> ++        rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
> ++        svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c
> + 
> + ## XDR
> + libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
> + 
> + ## Secure-RPC
> + if GSS
> +-    libtirpc_la_SOURCES += auth_gss.c authgss_prot.c svc_auth_gss.c \
> +-		svc_auth_none.c
> ++    libtirpc_la_SOURCES += auth_gss.c authgss_prot.c svc_auth_gss.c
> +     libtirpc_la_LDFLAGS += $(GSSGLUE_LIBS)
> +     libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSGLUE_CFLAGS)
> + endif
> +-- 
> +2.0.0
> +
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
