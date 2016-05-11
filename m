From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 23:23:46 +0200
Subject: [Buildroot] [PATCH 01/13 v7] support/scripts: add helper to
 hardlink-or-copy
In-Reply-To: <7c92d1e222419fef1422295dd3027ec4e205fca5.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <7c92d1e222419fef1422295dd3027ec4e205fca5.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <20160511232346.2968e909@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 18:14:26 +0200, Yann E. MORIN wrote:
> When preparing the legal-info, the source archives are copied in the
> legal-info/ output directory. When the archives are big, it can take
> quite a bit of time and unnecessarily uses disk space. When the
> legal-info output directory is on the same filesystem as the BR2_DL_DIR,
> we can easily reduce copy time and disk usage by just using hardlins
> instead of copying. However, the BR2_DL_DIR may be on a different
> filesystem, so we must fallback to copying in this case
> 
> Introduce a helper script that copies a source file into a destination
> directory, by first attempting to hard-link, and falling back to a
> plain copy in case the hardlink fails.
> 
> In case the destination already exists, it is forcibly removed first, to
> avoid clobering any existing target file (and especially any hardlink to
> it), since cp -f does not remove the destination file, but clobbers it.
> 
> In some situations, it will be necessary that the destination file is
> named differently than the source, so if a third argument is specified,
> it is treated as the basename of the destination file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v6 -> v7:
>   - more explicit variables  (Arnout)
>   - drop the variable with the helper path  (Arnout)
>   - use shell substitution instead of $(basename ...)  (Arnout! ;- )
>   - improve commit log to explain the 'rm -f'
>   - split now-too-long line

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
