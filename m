From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 16 Mar 2009 11:47:56 +0100
Subject: [Buildroot] svn commit: [25641] trunk/buildroot/target/linux
In-Reply-To: <20090313043143.8D1F07643C@busybox.osuosl.org>
References: <20090313043143.8D1F07643C@busybox.osuosl.org>
Message-ID: <1237200476.5838.461.camel@grond>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-03-13 klockan 04:31 +0000 skrev correa at uclibc.org:
> Author: correa
> Date: 2009-03-13 04:31:43 +0000 (Fri, 13 Mar 2009)
> New Revision: 25641
> 
> Log:
> Fix build (dependency) with custom patch option
> 
> Modified:
>    trunk/buildroot/target/linux/Makefile.in.advanced
> 
> 
> Changeset:
> Modified: trunk/buildroot/target/linux/Makefile.in.advanced
> ===================================================================
> --- trunk/buildroot/target/linux/Makefile.in.advanced	2009-03-12 23:04:19 UTC (rev 25640)
> +++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-03-13 04:31:43 UTC (rev 25641)
> @@ -71,7 +71,7 @@
>  LINUX26_BSP_PATCH:=$(strip $(subst ",,$(BR2_LINUX_BSP_PATCH)))
>  #"))
>  
> -LINUX_HEADERS_DEPENDS:=  $(LINUX26_BSP_PATCH)
> +LINUX_HEADERS_DEPENDS:=  $(DL_DIR)/$(LINUX26_BSP_PATCH)
>  
This patch breaks the build.
If $(LINUX26_BSP_PATCH) is empty, then you depend
on the download directory, which is touched
every time you download a new file, forcing the
rebuild of Linux.
If there is a patch applied, this gets applied once more
and the build fails.

Pls fix.

BR
Ulf Samuelsson

>  ifneq ($(LINUX26_PATCH_SOURCE),)
>  LINUX_HEADERS_DEPENDS+=$(DL_DIR)/$(LINUX26_PATCH_SOURCE)
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
