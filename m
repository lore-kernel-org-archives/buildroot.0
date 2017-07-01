From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 1 Jul 2017 16:11:05 +0200
Subject: [Buildroot] [RFC PATCH v5 08/11] core: install relocation
 script and location at the end of the build
In-Reply-To: <1498811828-6893-9-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-9-git-send-email-wg@grandegger.com>
Message-ID: <CAHXCMMKowyzQ091YNu9ewOTcgTXkTohXEfQUBNp=3z+GT1TBjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Wolfgang,

On Fri, Jun 30, 2017 at 10:37 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
> The script "relocate-sdk.sh" is installed into the top directory of
> the SDK (HOST_DIR) and the SDK location path is stored in the file
> "HOST_DIR/usr/share/buildroot/sdk-location"-
>
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index f5ea6a8..a5dfdfd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -553,6 +553,9 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>
>  .PHONY: world
>  world: target-post-image
> +       @$(call MESSAGE,"Rendering the SDK relocatable")
> +       install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR) && \

I don't think "&& \" is really needed here

> +       echo $(HOST_DIR) > $(HOST_DIR)/usr/share/buildroot/sdk-location

I'm not sure these few commands belong to the world target, maybe a
host-finalize target could be added...

>
>  # Populating the staging with the base directories is handled by the skeleton package
>  $(STAGING_DIR):
> --
> 2.7.4
>

Regards,

-- 
Samuel
