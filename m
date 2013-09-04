From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 04 Sep 2013 18:21:09 +0200
Subject: [Buildroot] [PATCH] perf: Add host-bison, host-flex dependencies
In-Reply-To: <1378298187-5058-1-git-send-email-mjonker@synopsys.com>
References: <1378298187-5058-1-git-send-email-mjonker@synopsys.com>
Message-ID: <52275DF5.6030101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/13 14:36, Mischa Jonker wrote:
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> ---
>   package/perf/perf.mk |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/perf/perf.mk b/package/perf/perf.mk
> index 7787c78..004541e 100644
> --- a/package/perf/perf.mk
> +++ b/package/perf/perf.mk
> @@ -8,7 +8,7 @@
>   PERF_SOURCE =
>   PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>
> -PERF_DEPENDENCIES = linux
> +PERF_DEPENDENCIES = linux host-flex host-bison
>
>   PERF_MAKE_FLAGS = \
>   	$(LINUX_MAKE_FLAGS) \
> @@ -40,7 +40,7 @@ define PERF_BUILD_CMDS
>   			exit 1 ; \
>   		fi \
>   	fi
> -	$(MAKE) -C $(LINUX_DIR)/tools/perf \
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \

  TARGET_MAKE_ENV seems more appropriate...

  Regards,
  Arnout

>   		$(PERF_MAKE_FLAGS) O=$(@D)
>   endef
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
