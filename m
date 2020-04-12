From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 16:11:55 +0200
Subject: [Buildroot] [PATCH v5 0/5] gitlab Qemu runtime testing
In-Reply-To: <20200217205030.8157-1-romain.naour@smile.fr>
References: <20200217205030.8157-1-romain.naour@smile.fr>
Message-ID: <20200412161155.51b6bc98@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Feb 2020 21:50:25 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Jugurtha BELKALEM (2):
>   support/scripts/boot-qemu-image.py: boot Qemu images with Qemu-system.
>   gitlab.yml.in*: enable Qemu gitlab testing
> 
> Romain Naour (3):
>   board/qemu: add defconfig file name as tag after the qemu command line
>   board/qemu: add post-image script for gitlab qemu testing
>   configs/qemu*: use the post-image script with "$(BR2_DEFCONFIG)" as
>     argument.

Overall, I am quite happy with the series. There are just two things
that I am not entirely sure about:

 (1) The logic that tests $CI_JOB_NAME in board/qemu/post-image.sh, to
     test if we are running under Gitlab CI or not. It feels a bit
     hackish to me. Should this magic be there, or instead tweaked by
     the Gitlab CI testing stuff directly ?

 (2) We now generate this start-qemu.sh script in $(BINARIES_DIR), but
     in fact only really use it for Gitlab CI testing. Should we make
     this start-qemu.sh script more prominently useful ? Or should we
     instead not have any start-qemu.sh script, and have the Gitlab CI
     testing logic directly find what the Qemu command line should be ?

That being said, this series has been around for a long time, so unless
I get some feedback on these questions, I'm going to apply it as-is, we
can always improve on top of that later on.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
