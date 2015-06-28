From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 22:24:02 +0200
Subject: [Buildroot] [V4 1/2] A20-OLinuXino-Lime: new board (mainline)
In-Reply-To: <559050F1.1030101@lucaceresoli.net>
References: <1435313217-12871-1-git-send-email-francois.perrad@gadz.org>
 <1435313217-12871-2-git-send-email-francois.perrad@gadz.org>
 <558D7D84.1000605@lucaceresoli.net>
 <CAB0FRstYj+N0T20YcFmUv+U5_HB1S1HuGtmoh-=jrzxu2HNCjQ@mail.gmail.com>
 <559050F1.1030101@lucaceresoli.net>
Message-ID: <20150628222402.4d3ded80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sun, 28 Jun 2015 21:54:25 +0200, Luca Ceresoli wrote:


> In fact, we have several Cortex-A defconfigs that enable NEON (5 out of
> 26) and EABIHF (9 out of 26):
> 
> $ git grep -l  cortex_a -- configs/ |wc
>       26      26     878
> $ git grep -l  cortex_a -- configs/ | xargs grep -l EABIHF|wc
>        9       9     308
> $ git grep -l  cortex_a -- configs/ | xargs grep -l NEON|wc
>        5       5     158
> $
> 
> But as I said, my understanding might be wrong.
> 
> Any authoritative opinions on this?

We don't have any strong position on this I believe. From my point of
view, enabling EABIhf definitely makes sense when it is possible. And
enabling NEON support also makes sense. However, using NEON as the FPU
is a bad idea (i.e BR2_ARM_FPU_NEON=y is a bad idea).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
