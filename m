From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 16:13:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/host-gdb: fix autobuild failure
In-Reply-To: <1441721106-27234-1-git-send-email-brendanheading@gmail.com>
References: <1441721106-27234-1-git-send-email-brendanheading@gmail.com>
Message-ID: <55EEED12.6000909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 16:05, Brendan Heading wrote:
> Fixes :
> 
> http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
> 
> .. and many others.
> 
> host-gdb is broken on all architectures at the moment, as it seems to
> require makeinfo during "make install" even if configure
> failed to detect it. Instead of trying to hack it, let's simply make gdb
> dependent on host-texinfo.

 Any idea why this is not needed for target gdb?

 Regards,
 Arnout

> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
>  package/gdb/gdb.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 338de20..efe195a 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -40,7 +40,7 @@ endif
>  # For the host variant, we really want to build with XML support,
>  # which is needed to read XML descriptions of target architectures. We
>  # also need ncurses.
> -HOST_GDB_DEPENDENCIES = host-expat host-ncurses
> +HOST_GDB_DEPENDENCIES = host-expat host-ncurses host-texinfo
>  
>  # Apply the Xtensa specific patches
>  XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
