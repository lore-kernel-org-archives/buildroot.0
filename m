From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Jul 2014 09:37:27 +0200
Subject: [Buildroot] [PATCH] grub2: fix a few minor issues in help text
In-Reply-To: <10481671.PAqJ3h0H0Y@sagittea>
References: <1404236356-4595-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <10481671.PAqJ3h0H0Y@sagittea>
Message-ID: <20140702093727.10dd1e9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

(Side-note: could you try to avoid sending your e-mails twice to the
mailing list: you're posting to both buildroot at busybox.net and
buildroot at uclibc.org. Thanks!)

On Wed, 02 Jul 2014 08:09:25 +0200, J?r?me Pouiller wrote:

> Just a remark for people who dislike to call sudo in their build 
> scripts:
> 
> genimage can be used to create disk image. Installing grub using 
> genimage is the tricky part. It can be done using :
> 
>         partition boot {
>                 in-partition-table = "no"
>                 image = "path_to_boot.img"
>                 offset = 0
>                 size = 512
>         }
>         partition grub {
>                  in-partition-table = "no"
>                  image = "path_to_grub.img"
>                  offset = 512
>         }
> 
> The result is not byte to byte identical to result using 
> grub-bios-setup (why?) but it seems it does not matter.

Really nice! Could you write a patch that extends the Config.in help
text of grub2 to include this information? I'm wondering how the
writing of the boot.img at offset 0 doesn't overwrite the partition
table.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
