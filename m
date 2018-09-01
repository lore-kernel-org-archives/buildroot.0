From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 09:55:17 +0200
Subject: [Buildroot] [PATCH 1/1] linux/linux.mk: Use '-isystem' instead
 of '-I' in HOST_CFLAGS
In-Reply-To: <20180830095748.30297-1-david.degrave@mind.be>
References: <20180830095748.30297-1-david.degrave@mind.be>
Message-ID: <20180901095517.6ad46a12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 11:57:48 +0200, David De Grave (Essensium/Mind)
wrote:
> Since the last update of the DTC package, linux build breaks at some point
> with the following error:
> 
>     In file included from {output}/host/include/libfdt.h:54:0,
>                      from scripts/dtc/libfdt/fdt.c:54:
>     {output}/host/include/libfdt_env.h:82:24: error: redefinition of \
>     ?fdt16_to_cpu?
>      static inline uint16_t fdt16_to_cpu(fdt16_t x)
>                             ^~~~~~~~~~~~
>     In file included from scripts/dtc/libfdt/fdt.c:51:0:
>     scripts/dtc/libfdt/libfdt_env.h:81:24: note: previous definition of \
>     ?fdt16_to_cpu? was here
> 
> This is because the HOST_CFLAGS is added before Linux's makefile add it's
> own local ones (-Iscripts/dtc/libfdt), resulting in a mix of local and host
> headers beeing used.
> 
> So, to fix this the '-I' is substituted by '-isystem' to let it search for
> the headers in the right location first.
> 
> Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I suspect this one is superseded by your new patch series
http://patchwork.ozlabs.org/project/buildroot/list/?series=63524, so
I've marked this patch as Changes Requested.

Note that
http://patchwork.ozlabs.org/project/buildroot/list/?series=63524
doesn't contain PATCH 2/3 due to a patchwork issue when associating
patches to series, but PATCH 2/3 has been recorded by patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
