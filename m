From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 15:39:38 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix double-conversion compile
 for aarch64_be
In-Reply-To: <20180813183949.16698-1-ps.report@gmx.net>
References: <20180813183949.16698-1-ps.report@gmx.net>
Message-ID: <20180814153938.1aa8d6b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Aug 2018 20:39:49 +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
>   #error Target architecture was not detected as supported by Double-Conversion.
> 
> [1] http://autobuild.buildroot.net/results/1fe2be0f26e5b92db57a5cfb5646dd253b731a5c
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - not upstreamable patch (or only for the 5.11 branch), on qtbase dev branch
>     double-conversion is already updated to v3.0.0 [2] using
>         defined(__AARCH64EL__) || defined(__aarch64__)
>     instead of
>         defined(__AARCH64EL__) || defined(__AARCH64EB__)
>     used here.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
