From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Mar 2016 22:17:17 +0100
Subject: [Buildroot] [PATCH v2] linux-firmware: Update bnx2x firwmare
 version
In-Reply-To: <1456805852-11045-1-git-send-email-joel@jms.id.au>
References: <874mcs9qkc.fsf@linux.vnet.ibm.com>
 <1456805852-11045-1-git-send-email-joel@jms.id.au>
Message-ID: <56D606DD.5010209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/01/16 05:17, Joel Stanley wrote:
> Linux kernel 4.2 moved the driver to a newer firmware version. As that
> is our default kernel, move the firmeware to a compatable version.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: Just use the new firmware to avoid adding extra cruft to our config system

 No, this is certainly not good, it fixes 4.2+ and simultaneously breaks 4.1-.

 What is wrong with Thomas's proposal to remove the unneeded versions in a
post-build script? If your size is so important that 640K matters, you would
probably anyway want to keep only one of the six binaries instead of three
different chip revisions.

 Regards,
 Arnout

> 
>  package/linux-firmware/linux-firmware.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 083a381ea00a..9363099b68fd 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -253,9 +253,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
>  LINUX_FIRMWARE_FILES += \
> -	bnx2x/bnx2x-e1-7.10.51.0.fw \
> -	bnx2x/bnx2x-e1h-7.10.51.0.fw \
> -	bnx2x/bnx2x-e2-7.10.51.0.fw
> +	bnx2x/bnx2x-e1-7.12.30.0.fw \
> +	bnx2x/bnx2x-e1h-7.12.30.0.fw \
> +	bnx2x/bnx2x-e2-7.12.30.0.fw
>  # No license file; the license is in the file WHENCE
>  # which is installed unconditionally
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
