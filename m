From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Jun 2019 11:08:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] utils/genrandconfing: randomly
 enable BR2_REPRODUCIBLE 10% of the times
In-Reply-To: <20190607085558.1580-1-itsatharva@gmail.com>
References: <20190607085558.1580-1-itsatharva@gmail.com>
Message-ID: <a60b1709-e0c9-e1ce-33df-d7df4472ef52@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/06/2019 10:55, Atharva Lele wrote:
> Initial patch to start reproducibility testing.
> 
> Also enable tar filesystem to compare images since diffoscope works well
> with tar.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

 You forgot to add my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(note that patchwork will automatically pick it up, so when someone applies the
patch, it will have my Reviewed-by tag now.)

> 
> ---
> Changes v1 -> v2:
>   - Remove unnecessary lines that were default anyway (suggested by Arnout)
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

 This second Sob is not needed. But there's no harm in it, it will be stripped
off automatically when applying.

 Regards,
 Arnout

> ---
>  utils/genrandconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 5f3fe23260..aa5e151b7f 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -366,6 +366,12 @@ def gen_config(args):
>      if randint(0, 4) == 0:
>          configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
>  
> +    # Randomly enable BR2_REPRODUCIBLE 10% of times
> +    # also enable tar filesystem images for testing
> +    if randint(0, 10) == 0:
> +        configlines.append("BR2_REPRODUCIBLE=y\n")
> +        configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
> +
>      # Write out the configuration file
>      if not os.path.exists(args.outputdir):
>          os.makedirs(args.outputdir)
> 
