From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 4 Jul 2016 11:05:48 +0200
Subject: [Buildroot] [PATCH 1/1] wireless_tools: Ensure ifrename is
 built and installed
In-Reply-To: <BE7DD8D2CBE7B241971A69A3E62C11B7011890FE@partis.dyndns.org>
References: <BE7DD8D2CBE7B241971A69A3E62C11B7011890FE@partis.dyndns.org>
Message-ID: <CAGduivxk6q9P3PJNzo=w_MUQ2SFFRk9WB_hw1KKGCoy0avz72A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary, all

Thanks a lot for your patch. Below are some comments.
Your patch will be marked as "Changes Requested" in our patchwork,
feel free to resend the patch with the modification.

On Thu, Jun 9, 2016 at 4:54 PM, Gary Partis <gary@partis.co.uk> wrote:
> Signed-off-by: Gary Partis <gary@partis.co.uk>
> ---
>  package/wireless_tools/wireless_tools.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/wireless_tools/wireless_tools.mk
> b/package/wireless_tools/wireless_tools.mk
> index 5fb8f12..12e1c1f 100644
> --- a/package/wireless_tools/wireless_tools.mk
> +++ b/package/wireless_tools/wireless_tools.mk
> @@ -12,8 +12,8 @@ WIRELESS_TOOLS_LICENSE = GPLv2
>  WIRELESS_TOOLS_LICENSE_FILES = COPYING
>  WIRELESS_TOOLS_INSTALL_STAGING = YES
>
> -WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
> -WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
> +WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall all
> +WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall install
If I understand your commit log correctly, you only want the
'ifrename' binary but in your changes, you build and install every
binary.
There is a target in the wireless_tools's Makefile to build only
ifrename, there's no target to install it specifically, but you can
install it by using the $(INSTALL) command in the
WIRELESS_TOOLS_INSTALL_TARGET_CMDS.
>
>
>  ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
> --
> 1.7.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
