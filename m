From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Jan 2013 15:01:01 +0100
Subject: [Buildroot] [PATCH 4/6] toolchain/gcc: sprinkle with some calls
 to MESSAGE
In-Reply-To: <5f7b311395a44a98654df57f145bffc9ce90a6c9.1358379198.git.yann.morin.1998@free.fr>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
 <5f7b311395a44a98654df57f145bffc9ce90a6c9.1358379198.git.yann.morin.1998@free.fr>
Message-ID: <50FBF89D.9010705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/17/13 00:41, Yann E. MORIN wrote:
> Thus, the failing step can be easily extracted by autobuilders,
> to ease with post-mortem analysis.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   toolchain/gcc/gcc-uclibc-4.x.mk |   15 +++++++++++++++
>   1 files changed, 15 insertions(+), 0 deletions(-)
>
[snip]
>   $(STAMP_DIR)/gcc_libs_target_installed: $(GCC_BUILD_DIR3)/.installed
> +	$(Q)$(call MESSAGE,"Installing gcc final libraries to staging")

  Target and staging, actually.


  Regards,
  Arnout

>   ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
>   	# These go in /lib, so...
>   	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
