From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 21:47:50 +0100
Subject: [Buildroot] [PATCH 1/2 next] Revert "reproducible: fix
 DATE/TIME macros in toolchain-wrapper"
In-Reply-To: <0db12adda90ffa9bf7a3925cf1563aea4591c5ef.1487709136.git.yann.morin.1998@free.fr>
References: <cover.1487709136.git.yann.morin.1998@free.fr>
 <0db12adda90ffa9bf7a3925cf1563aea4591c5ef.1487709136.git.yann.morin.1998@free.fr>
Message-ID: <20170221214750.4c057f08@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 21:32:35 +0100, Yann E. MORIN wrote:
> This reverts commit 76838f63412a30a358210e457dda4b79f7730624.
> 
> The commit referenced above explicitly states that the function was
> copied as-is from the gcc source code at the time. And indeed that is
> exactly how the function appeared in gcc in commit
> e3e8c48c4a494d9da741c1c8ea6c4c0b7c4ff934.
> 
> However, our toolchain wrapper is "GPLv2 only", while the file this function
> was copied from is "GPLv3 or later".  As such we can't include that function
> and still comply to both licenses.
> 
> Furthermore, the code is far from optimum.
> 
> Since this feature is not release-critical, revert it until we re-implement
> it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

This has already been applied in master:

  https://git.buildroot.org/buildroot/commit/?id=1c8c0d91a431fda2c052072af87e0de35bd3b953

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
