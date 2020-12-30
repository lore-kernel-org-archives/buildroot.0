From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 23:54:41 +0100
Subject: [Buildroot] [PATCH] package/gcc: arc: Fix adc/sbc patterns
 handling in GCC 10
In-Reply-To: <20201203192306.9648-1-kremneva@synopsys.com>
References: <20201203192306.9648-1-kremneva@synopsys.com>
Message-ID: <20201230235441.782096c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Veronika,

On Thu,  3 Dec 2020 22:23:06 +0300
Veronika Kremneva <Veronika.Kremneva@synopsys.com> wrote:

> There is a problem while building various packages with GCC 10.x for ARC:
> 
> ----------------------------->8---------------------------  
> make[2]: *** [magick/libGraphicsMagick_la-analyze.lo] Error 1
> make[2]: *** Waiting for unfinished jobs....
> /tmp/ccFqDn0F.s: Assembler messages:
> /tmp/ccFqDn0F.s:1586: Error: operand is not duplicate of the previous one for instruction 'adc'
> ----------------------------->8---------------------------  

So this patch was no longer applying as-is, because it is already
present for the ARC-specific gcc version. So I dropped this part of
your patch, and applied the part adding the patch to the vanilla gcc
10.2 version.

It's now at
https://git.buildroot.org/buildroot/commit/?id=a61529b6c372e03cda428c695b17ce4b986daac8

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
