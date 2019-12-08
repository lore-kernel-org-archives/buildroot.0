From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 14:47:45 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/alsa-utils: remove --disable-alsatest
In-Reply-To: <20191207091743.183814-1-fontaine.fabrice@gmail.com>
References: <20191207091743.183814-1-fontaine.fabrice@gmail.com>
Message-ID: <20191208144745.20a6ed97@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Dec 2019 10:17:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> atopology is needed to build alsa-utils since version 1.2.1 and
> https://github.com/alsa-project/alsa-utils/commit/c8fdd38c74de2e8b7b2b5a4576787d5e9b4ae807
> 
> However, atopology is not correctly detected if --disable-alsatest is
> passed so drop --disable-alsatest that is not needed since commit
> 2c03ec15307b567fd2250fe2a7981a89d19b87a9 (from 2002), which removed
> AC_TRY_RUN
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d0fb760669b02b813115af04adcf24530d35f4e1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Remove --disable-alsatest instead of adding --enable-alsa-topology

Applied to master, thanks.

However, while reviewing this I noticed that alsa-utils.mk contains:

# Regenerate aclocal.m4 to pick the patched
# version of alsa.m4 from alsa-lib
ALSA_UTILS_AUTORECONF = YES
ALSA_UTILS_GETTEXTIZE = YES

But, since commit e8cb594bc8ce07e22e247972a417d53fd56e10fb, we are no
longer patching alsa.m4 from alsa-lib, and a new version of alsa-utils
is used since commit 337bdb2b44c9696551a11f396dde86d3fa869426, which
perhaps has a bundled  configure script that was re-regenerated with
the new alsa.m4. Could you try if autoreconfiguring alsa-utils is still
necessary ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
