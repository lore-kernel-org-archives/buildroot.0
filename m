From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 01:24:31 +0200
Subject: [Buildroot] [PATCH 2/4] board/minnowboard: Rework to generate
 SD card image
In-Reply-To: <1460438965-28065-3-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460438965-28065-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <570D83AF.5030108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/16 07:29, Ezequiel Garcia wrote:
> Let's rework the board and config files to use genimage
> to generate the SD card image directly.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

  Instead of this patch, wouldn't it be nicer to unify the minnowboard and 
minnowboard-max directories? Or at least, make the genimage.cfg, post-image.sh 
and readme.txt a symlink to the -max equivalent (grub.cfg and linux.config are 
different).

  Regards,
  Arnout

> ---
>   board/minnowboard/genimage.cfg  | 34 ++++++++++++++++++++++++++++++++++
>   board/minnowboard/post-image.sh | 13 +++++++++++++
>   board/minnowboard/readme.txt    | 39 ++++++++++++---------------------------
>   configs/minnowboard_defconfig   |  8 ++++++++
>   4 files changed, 67 insertions(+), 27 deletions(-)
>   create mode 100644 board/minnowboard/genimage.cfg
>   create mode 100755 board/minnowboard/post-image.sh
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
