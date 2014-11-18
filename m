From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 23:16:22 +0100
Subject: [Buildroot] [PATCH 0/7] Better handling of freescale
 self-extractible binaries
In-Reply-To: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
References: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
Message-ID: <20141118221622.GR4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-11-07 17:03 +0100, J?r?me Pouiller spake thusly:
> This serie introduce an helper fonction for freescale self-extractible
> binaries. 

Thanks, that makes for a pretty nice cleanup! :-)

> Obviously, last 3 patches of this serie apply on top of my previous 
> series: "Add Xorg support for imx6" and "Add support for iMX5 GPU"

I haven't reviewed the last three patches in this series.

I think patches 1-4 can be applied now (barring the few comments I
made), and then you can directly use that from your other series.

Of course, my comments are not definitive, others may prefer the way you
did, so my reviewed-by tags are still valid.

Regards,
Yann E. MORIN.

> J?r?me Pouiller (7):
>   freescale-imx: Add helper to extract self-extractible binaries
>   firmware-imx: Use self-extractible helper
>   imx-vpu: Use self-extractible helper
>   libfsl*: Use self-extractible helper
>   gpu-viv-bin-mx6q: Use self-extractible helper
>   libz160: Use self-extractible helper
>   gpu-amd-bin-mx51: Use self-extractible helper
> 
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 16 ++++---------
>  package/freescale-imx/freescale-imx.mk             | 21 +++++++++++++++++
>  .../gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk           | 27 ++++++++--------------
>  .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           | 22 ++++--------------
>  package/freescale-imx/imx-vpu/imx-vpu.mk           | 22 +++++-------------
>  package/freescale-imx/libz160/libz160.mk           | 19 ++++-----------
>  package/libfslcodec/libfslcodec.mk                 | 23 ++++--------------
>  package/libfslparser/libfslparser.mk               | 23 ++++--------------
>  package/libfslvpuwrap/libfslvpuwrap.mk             | 24 ++++---------------
>  9 files changed, 62 insertions(+), 135 deletions(-)
> 
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
