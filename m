From: Emmanuel BOUAZIZ <ebouaziz@neotion.com>
Date: Wed, 30 Jan 2013 15:48:05 +0100
Subject: [Buildroot] [git commit] busybox: add 1.19.4 / 1.20.2 fixes
In-Reply-To: <20120904110844.1439997180@busybox.osuosl.org>
References: <20120904110844.1439997180@busybox.osuosl.org>
Message-ID: <510932A5.4080303@neotion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/04/2012 01:08 PM, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=9ec1c5d9d31b4f377c91a0451efd3ba67416d6f8
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  .../busybox-1.19.4/busybox-1.19.4-udhcp.patch      |  164 ++++++++++++++++++++
>  .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   25 +++
>  2 files changed, 189 insertions(+), 0 deletions(-)
> 
> diff --git a/package/busybox/busybox-1.19.4/busybox-1.19.4-udhcp.patch b/package/busybox/busybox-1.19.4/busybox-1.19.4-udhcp.patch
> new file mode 100644
> index 0000000..94d5f34
> --- /dev/null
> +++ b/package/busybox/busybox-1.19.4/busybox-1.19.4-udhcp.patch

> [...]

> + //TODO: must be combined with 'sname' and 'file' handling:
> +-	{ OPTION_STRING                           , 0x42 }, /* DHCP_TFTP_SERVER_NAME */
> ++	{ OPTION_STRING_HOST                      , 0x42 }, /* DHCP_TFTP_SERVER_NAME */
> + 	{ OPTION_STRING                           , 0x43 }, /* DHCP_BOOT_FILE     */

> [...]
> 

Hi,

I don't know what this patch is for, but it breaks the TFTP_SERVER_NAME option for me. The $tftp variable now contains
"bad" instead or the TFTP server name (I use it in udhcpc.script). When I remove the patch, it works fine again.

regards,

-- 
Emmanuel
