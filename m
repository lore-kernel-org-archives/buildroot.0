From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Apr 2013 13:12:09 +0200
Subject: [Buildroot] [PATCH] Install DTB as part of images install
	command
In-Reply-To: <069B5A25F9844945B625ADE7258AC94C06204FCC@4rf-nz-orion.local.4rf.com>
References: <069B5A25F9844945B625ADE7258AC94C06204FCC@4rf-nz-orion.local.4rf.com>
Message-ID: <515D6009.5010306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/03/13 00:01, Reuben Dowle wrote:
> From: Reuben Dowle <reuben.dowle@4rf.com>
>
> When installing DTB to the images directory, do this as part of the image
> install commands rather than the target install commands.
>
> Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com.az>

  Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(untested)

> ---
>   linux/linux.mk |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 8a73767..f0d793b 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -261,11 +261,11 @@ endef
>
>   define LINUX_INSTALL_IMAGES_CMDS
>          cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> +       $(LINUX_INSTALL_DTB)

  I prefer the indentation to be with a tab, but since the original has 
spaces it's OK.


  Regards,
  Arnout

>   endef
>
>   define LINUX_INSTALL_TARGET_CMDS
>          $(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
> -       $(LINUX_INSTALL_DTB)
>          # Install modules and remove symbolic links pointing to build
>          # directories, not relevant on the target
>          @if grep -q "CONFIG_MODULES=y" $(@D)/.config; then      \
> --
> 1.7.10.4
>
> The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
