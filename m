From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 07 Feb 2013 08:07:17 +0100
Subject: [Buildroot] [PATCH 3/8] package/Makefile.in: update/fix
 HOST_PATH variable
In-Reply-To: <d29120e810fb080ac4304d6e51b01ec2efda168f.1356907750.git.s.martin49@gmail.com>
References: <cover.1356907750.git.s.martin49@gmail.com>
 <d29120e810fb080ac4304d6e51b01ec2efda168f.1356907750.git.s.martin49@gmail.com>
Message-ID: <511352A5.9010803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/12/12 23:54, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  This series should still go in for 2013.02, I think.

  Regards,
  Arnout

> ---
>   package/Makefile.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index cc8f320..dd04e25 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -165,7 +165,7 @@ HOST_CFLAGS   ?= -O2
>   HOST_CFLAGS   += $(HOST_CPPFLAGS)
>   HOST_CXXFLAGS += $(HOST_CFLAGS)
>   HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
> -HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
> +HOST_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
>
>   # hostcc version as an integer - E.G. 4.3.2 => 432
>   HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
