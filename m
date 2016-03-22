From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:58:45 +0100
Subject: [Buildroot] [PATCH v2 6/7] altera: improve fdisk instructions
In-Reply-To: <1445340745-1000-7-git-send-email-viktorin@rehivetech.com>
References: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
 <1445340745-1000-7-git-send-email-viktorin@rehivetech.com>
Message-ID: <20160322235845.7b3b4c11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Oct 2015 13:32:24 +0200, Jan Viktorin wrote:
> The 't' command expects the number of the target partition
> when there are at least 2 of them. Also note about the arbitrary
> value 9000000.
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  board/altera/readme.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/board/altera/readme.txt b/board/altera/readme.txt
> index 62c3670..a30e5a9 100644
> --- a/board/altera/readme.txt
> +++ b/board/altera/readme.txt
> @@ -111,10 +111,11 @@ let's assume it is /dev/sdc :
>    $ sudo fdisk /dev/sdc
>  
>  Delete all previous partitions with 'd' then create the new partition table,
> -using these options, pressing enter after each one:
> +using these options, pressing enter after each one (the value 9000000 depends
> +on the size of your SD card):
>  
> -  * n p 1 9000000 +20480K t 1 b
> -  * n p 2 4096 +4496384K t 83
> +  * n p 1 9000000 +20480K t b
> +  * n p 2 4096 +4496384K t 2 83
>    * n p 3 2048 +1024K t 3 a2

Rather than tweaking this horrible thing, what about using sfdisk
instead, or even better, switch to genimage to generate the image ? The
latter would really be the ideal solution (but I would accept a patch
changing to sfdisk in the mean time, if you don't have the time to look
into genimage right now).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
