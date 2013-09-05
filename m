From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 5 Sep 2013 10:03:42 +0200
Subject: [Buildroot] [PATCHv2] perf: Add host-bison,
	host-flex dependencies
In-Reply-To: <1378321330-16521-1-git-send-email-mjonker@synopsys.com>
References: <1378321330-16521-1-git-send-email-mjonker@synopsys.com>
Message-ID: <CAAXf6LVwpwv-VTGark7VgRE9WeK00PtBp4ws2va=JLE8=g-1YA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 4, 2013 at 9:02 PM, Mischa Jonker
<Mischa.Jonker@synopsys.com> wrote:
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> ---
>  package/perf/perf.mk |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/perf/perf.mk b/package/perf/perf.mk
> index 7787c78..120353f 100644
> --- a/package/perf/perf.mk
> +++ b/package/perf/perf.mk
> @@ -8,7 +8,7 @@
>  PERF_SOURCE =
>  PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>
> -PERF_DEPENDENCIES = linux
> +PERF_DEPENDENCIES = linux host-flex host-bison
>
>  PERF_MAKE_FLAGS = \
>         $(LINUX_MAKE_FLAGS) \
> @@ -40,14 +40,14 @@ define PERF_BUILD_CMDS
>                         exit 1 ; \
>                 fi \
>         fi
> -       $(MAKE) -C $(LINUX_DIR)/tools/perf \
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
>                 $(PERF_MAKE_FLAGS) O=$(@D)
>  endef
>
>  # After installation, we remove the Perl and Python scripts from the
>  # target.
>  define PERF_INSTALL_TARGET_CMDS
> -       $(MAKE) -C $(LINUX_DIR)/tools/perf \
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
>                 $(PERF_MAKE_FLAGS) O=$(@D) install
>         $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
>  endef
> --

Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
