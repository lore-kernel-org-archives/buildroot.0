From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:58:07 +0200
Subject: [Buildroot] [PATCH] package/wampcc: fix build failure on
 RISC-V/musl
In-Reply-To: <20190807142218.23202-1-thomas.petazzoni@bootlin.com>
References: <20190807142218.23202-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190811145807.22ac7d5c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  7 Aug 2019 16:22:18 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> wampcc includes some code from msgpack-c, which itself includes some
> code from Boost for the endianness detection. This code did not
> properly handle the case of the RISC-V architecture supported by
> non-glibc toolchains, causing the endianness to be unknown (and a
> build failure) when building wampcc for RISC-V with the musl C
> library.
> 
> This commit fixes that, by bringing a change that was upstreamed to
> Boost as of commit
> https://github.com/boostorg/predef/commit/4bc7cc02eda854e4c8ac73caecfee37717083a6b.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/01df5a6f38fb32563831d171d03dfb9ad89f5830/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../0001-Add-RISC-V-endian-detection.patch    | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/wampcc/0001-Add-RISC-V-endian-detection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
