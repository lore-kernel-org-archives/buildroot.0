From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 08:59:03 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] brltty: use gcc instead of ld to link shared objects
In-Reply-To: <20181008210507.13811-1-fontaine.fabrice@gmail.com>
References: <20181008210507.13811-1-fontaine.fabrice@gmail.com>
Message-ID: <20181009085903.55979758@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Oct 2018 23:05:07 +0200, Fabrice Fontaine wrote:
> Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
> version 5.5.
> 
> Indeed, third patch was merged upstream but it was then reverted:
> https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416
> 
> Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
> was renamed into MKREL. So, patch again brltty, overwrite
> MKREL to use "gcc -shared -o" instead of "ld -r -o" if gcc is available
> (as suggested by Arnout: https://patchwork.ozlabs.org/patch/972614).
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/31f682838b3d3b2c7103b5c51f2aba0b89d4f630
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (following review of Arnout Vandecappelle):
>  - Add an upstreamable patch that checks if gcc is available before
>    using it

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
