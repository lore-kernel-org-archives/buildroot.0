From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 21 Dec 2020 07:21:49 +0000
Subject: [Buildroot] [PATCH] package/gcc: arc: Fix adc/sbc patterns
 handling in GCC 10
In-Reply-To: <20201203192306.9648-1-kremneva@synopsys.com>
References: <20201203192306.9648-1-kremneva@synopsys.com>
Message-ID: <BN8PR12MB33308EC2F15599231AF7D916A1C00@BN8PR12MB3330.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

> From: Veronika Kremneva <kremneva@synopsys.com>
> Sent: Thursday, December 3, 2020 10:23 PM
> To: buildroot at busybox.net <buildroot@busybox.net>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>; Evgeniy Didin <didin@synopsys.com>; Veronika Kremneva <kremneva@synopsys.com>
> Subject: [PATCH] package/gcc: arc: Fix adc/sbc patterns handling in GCC 10 
> ?
> There is a problem while building various packages with GCC 10.x for ARC:
> 
> ----------------------------->8---------------------------
> make[2]: *** [magick/libGraphicsMagick_la-analyze.lo] Error 1
> make[2]: *** Waiting for unfinished jobs....
> /tmp/ccFqDn0F.s: Assembler messages:
> /tmp/ccFqDn0F.s:1586: Error: operand is not duplicate of the previous one for instruction 'adc'
> ----------------------------->8---------------------------
> 
> This failure happens on regular basis and can also be observed in:
> http://autobuild.buildroot.net/results/c9d13a3659e3a45864f9622b29122e666f763c6e/
> http://autobuild.buildroot.net/results/84edcdb0f5759fa587a5638e1bab18379ee1f3b2/
> http://autobuild.buildroot.net/results/6f6acbb1a8708ad840a9361ee72b8d14699b44d9/
> 
> More details you can find on filed issue:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/310
> Fix:
> https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/09944fba5bfb8e5543ce043c70d08222cf2f97ff
> 
> The following patch applies the fix that will be submitted to GCC 10.x upstream soon.
> 
> Signed-off-by: Veronika Kremneva <kremneva@synopsys.com>

Thanks a lot for fixing that SNAFU in ARC toolchain, now applied via
https://git.buildroot.org/buildroot/commit/?id=692829d967c30768859c9e043c15f45edda109ac.

Unfortunately, that's a problem which happens with any GCC 10.x-based toolchain,
that said we need the same fix applied to vanilla GCC 10.2.

So we may either apply a part of this commit or copy your patch in
"10.2" folder is it should apply cleanly.

-Alexey
