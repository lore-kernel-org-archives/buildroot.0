From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 23:13:28 +0200
Subject: [Buildroot] [PATCH 3/5 v2] toolchain: check the SSP option is
 known
In-Reply-To: <6137_1552392583_5C87A187_6137_470_1_3090e77d-fd75-49ec-8643-3a89ee5ea133@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
References: <cover.1552392456.git.yann.morin@orange.com>
 <6137_1552392583_5C87A187_6137_470_1_3090e77d-fd75-49ec-8643-3a89ee5ea133@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <15f0cc73-a0e4-35fe-03bc-0e18b62decb3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 13:09, yann.morin at orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Some toolchain vendors may have backported those options to older gcc
> versions, and we have no way to know, so we have to check that the
> user's selection is acceptable.
> 
> Extend the macro that currently checks for SSP in the toolchain, with
> a new test that the actual SSP option is recognised and accepted.
> 
> Note that the SSP option is either totaly empty, or an already-quoted
> string, so we can safely and easily assign it to a shell variable to
> test and use it.
> 
> Note that we do not introduce BR2_TOOLCHAIN_HAS_SSP_STRONG, because:
> 
>   - our internal toolchain infra only supports gcc >= 4.9, so it has
>     SSP strong;
> 
>   - of the external pre-built toolchains, only the codesourcery-arm
>     one has a gcc-4.8 which lacks SSP strong, all the others have a
>     gcc >= 4.9;
> 
>   - we'd still have to do the actual check for custom external
>     toolchains anyway.
> 
> So, we're not adding BR2_TOOLCHAIN_HAS_SSP_STRONG just for a single
> case.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

 You replied to all concerns, so I've applied as-is.

 Regards,
 Arnout
