From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Mar 2015 16:37:54 +0100
Subject: [Buildroot] [PATCH 2/2] configs: add Freescale SABRE Auto board
 support
In-Reply-To: <1426873317-22471-2-git-send-email-vincent.stehle@freescale.com>
References: <1426873317-22471-1-git-send-email-vincent.stehle@freescale.com>
 <1426873317-22471-2-git-send-email-vincent.stehle@freescale.com>
Message-ID: <550D9052.2000204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/03/15 18:41, Vincent Stehl? wrote:
> SABRE Board for Automotive Infotainment (SABRE Auto, a.k.a. SABRE-AI) is
> Freescale's evaluation board based on the i.MX 6 ARM Cortex-A9 applications
> processor.
> 
> Those defconfigs are an adaptation of freescale_imx6{q,dl}sabresd_defconfig for
> SABRE Auto, and are thus based on Freescale "official" git repo on
> git.freescale.com and SW release 3.10.17_1.0.0_ga.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Gilles Talis <gilles.talis@gmail.com>
> Cc: Peter Korsgaard <jacmet@sunsite.dk>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Gary Bisson <bisson.gary@gmail.com>

[snip]
> @@ -58,6 +71,30 @@ Quick Start Guide for guidance):
>    at 115200 bps, 8n1;
>  - power on the board.
>  
> +To boot your newly created system on a SABRE Auto Board (refer to the SABRE for
> +Automotive Infotainment Quick Start Guide for guidance):

 I would introduce subheadings here for the two boards, so

Boot the SABRE board
====================

SABRE SD
--------
...

SABRE Auto
----------
...


> +- insert the SD card in the CPU card SD card socket J14;
> +- Set the S1, S2 and S3 DIP switches and J3 jumper to boot from SD on CPU card.
> +  Reference configuration:
> +
> +    S1
> +     1  2   3   4  5   6   7   8   9  10
> +    off ON off off ON off off off off off
> +
> +    S2
> +     1   2  3   4
> +    off off ON off
> +
> +    S3
> +     1   2  3  4
> +    off off ON ON
> +
> +    J3: 1-2
> +
> +- connect an RS-232 UART cable to CPU card debug port J18 and connect using a

 Shouldn't that be Debug UART DB9? I'm just looking at the quick start guide here...


> +  terminal emulator at 115200 bps, 8n1;
> +- power on the board.
> +
>  Enjoy!
>  
>  References

 I don't suppose you've created similar pages for the auto?


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
