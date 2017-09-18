From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Mon, 18 Sep 2017 13:42:08 -0700
Subject: [Buildroot] [RFC] package/qt5: add license file hashes for all
 submodules
In-Reply-To: <1500314538-19377-1-git-send-email-joshua.henderson@microchip.com>
References: <1500314538-19377-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <3bbc2d59-809d-8874-1742-2e10820171d7@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 07/17/2017 11:02 AM, Joshua Henderson wrote:
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Seiderer <ps.report@gmx.net>
> 
> ---
> 
> This depends on pending [2/2,v2] core/legal-info: use hash file from version
> sub-dir [1] and pending series [v2,1/2] package/qt5: bump latest version to
> 5.9.1 [2].
> 
> Normally this would be a simple patch, but qt5 is an exception due to license
> file differences between different versions of Qt. This results in at least two
> conditions:
> 
> 1. License files with the same name sometimes have different hashes between
>    different versions of Qt.
> 2. License file names sometimes vary between different versions of Qt.
> 
> Condition 1 is solved by creating a version specific hash file for 5.6.2 and
> leaving only license hashes applicable to BR2_PACKAGE_QT5_VERSION_LATEST (5.9.1)
> in the "main" .hash file.
> 
> Condition 2 is solved by adding all license file hashes, irrelevent of Qt
> version, to the "main" package hash file.  This means that most main .hash
> files contain a superset of all license hashes between the two Qt versions
> simply because there is no logical conflict.
> 
> In summary, condition 1 always results in different hash files. Condition 2 does
> not. Should they both?
> 
> [1] https://patchwork.ozlabs.org/patch/789097/
> [2] https://patchwork.ozlabs.org/patch/787881/

Now that the dependent patches are applied to support this, this patch is ready to
move forward. Is what's outlined above as expected or should some other logic be
used for where to put the license hashes, specifically for Qt?  The method used
here favors trying to be like most other packages and only diverges when there is
a conflict.

Josh
