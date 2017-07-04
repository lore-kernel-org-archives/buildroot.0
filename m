From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Jul 2017 17:04:50 +0200
Subject: [Buildroot] [PATCH v3 06/14] package/Makefile.in: remove
 $(HOST_DIR)/usr part from HOST_LDFLAGS
In-Reply-To: <20170704140404.4098-7-arnout@mind.be>
References: <20170704140404.4098-1-arnout@mind.be>
 <20170704140404.4098-7-arnout@mind.be>
Message-ID: <fd235668-902e-de0a-3217-90cc13ca3f4d@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 04/07/2017 ? 16:03, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Now $(HOST_DIR)/lib and $(HOST_DIR)/usr/lib are the same directory, it
> doesn't make sense to pass both to LDFLAGS.
> 
> Also use $(HOST_DIR)/lib instead of $(HOST_DIR)/usr/lib for the RPATH.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 6b88ac4feb..25f1997fe6 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -220,7 +220,7 @@ HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
>  HOST_CFLAGS   ?= -O2
>  HOST_CFLAGS   += $(HOST_CPPFLAGS)
>  HOST_CXXFLAGS += $(HOST_CFLAGS)
> -HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
> +HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
>  
>  # host-intltool should be executed with the system perl, so we save
>  # the path to the system perl, before a host-perl built by Buildroot
> 
