From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 21:48:26 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/cukinia: fix dependency
In-Reply-To: <20201008171309.368294-1-fontaine.fabrice@gmail.com>
References: <20201008171309.368294-1-fontaine.fabrice@gmail.com>
Message-ID: <20201008214826.35bcbfbe@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  8 Oct 2020 19:13:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gawk can't be selected when busybox is not available as gawk needs
> wchar:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_GAWK
>   Depends on [n]: BR2_USE_WCHAR [=n] && BR2_USE_MMU [=y] && BR2_PACKAGE_BUSYBOX_SHOW_OTHERS [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_CUKINIA [=y] && !BR2_PACKAGE_BUSYBOX [=n]
> 
> So replace this "select" by a "depends on", as already done by
> BR2_PACKAGE_APPARMOR_UTILS_EXTRA
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/66dacfe7b0783c7df29052fff20f3e79ecbcf054
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Add a comment

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
