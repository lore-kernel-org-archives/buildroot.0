From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 8 Jul 2018 18:12:08 -0300
Subject: [Buildroot] [PATCH 2/3] imx/post-image: Allow flashing
 u-boot-dtb.imx in the SD card
In-Reply-To: <c40b2f73-d91b-1693-a938-8b6de39b84f1@mind.be>
References: <1530818671-20390-1-git-send-email-festevam@gmail.com>
 <1530818671-20390-2-git-send-email-festevam@gmail.com>
 <75a18624-33ef-7d5d-3542-2e3b7b75e5f6@mind.be>
 <CAOMZO5BDTyZfo0s7ppN3CORQ-9ru1PtUaPTcK-RpgytGxO2ShA@mail.gmail.com>
 <c40b2f73-d91b-1693-a938-8b6de39b84f1@mind.be>
Message-ID: <CAOMZO5CVFjnxqHarcdhaAb6ADKV3T2E_LASoAOzouya1sM4dtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sun, Jul 8, 2018 at 5:51 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  This way, you're overwriting the file that was created just above. You need to
> do both in a single command:
>
>         sed -e "s/%FILES%/${FILES}/" \
>                 -e "s/%UBOOTBIN%/${UBOOTBIN}/" \
>                 board/freescale/common/imx/$(genimage_type) > ${GENIMAGE_CFG}

Thanks a lot for your suggestions! It is working fine now.

Really appreciated!

Will submit a v2.
