From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:05:06 +0200
Subject: [Buildroot] [PATCH 1/2] wandboard: genimage: Pass an offset for
 the rootfs
In-Reply-To: <1506002379-23490-1-git-send-email-fabio.estevam@nxp.com>
References: <1506002379-23490-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <3a6b5cbf-081a-ce92-ed01-43e66e29453f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-09-17 15:59, Fabio Estevam wrote:
> Pass an offset of 1MB for the start of the rootfs.
> 
> Otherwise we get rootfs corruption when the bootloader is manually
> written to the SD card.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

 Applied both to master, thanks.

 Regards,
 Arnout


> ---
>  board/wandboard/genimage.cfg | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/board/wandboard/genimage.cfg b/board/wandboard/genimage.cfg
> index b23a91b..ad4a6a5 100644
> --- a/board/wandboard/genimage.cfg
> +++ b/board/wandboard/genimage.cfg
> @@ -26,6 +26,7 @@ image sdcard.img {
>    partition rootfs {
>      partition-type = 0x83
>      image = "rootfs.ext4"
> +    offset = 1M
>      size = 512M
>    }
>  }
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
