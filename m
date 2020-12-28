From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:50:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: Fix deprecation
 warnings in cross-compilation config
In-Reply-To: <20201227021505.1970065-1-glex.spb@gmail.com>
References: <20201227021505.1970065-1-glex.spb@gmail.com>
Message-ID: <20201228225004.19168dde@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Dec 2020 02:15:05 +0000
Gleb Mazovetskiy <glex.spb@gmail.com> wrote:

> As of meson 0.56.0, `<lang>_args` and `<lang>_link_args` in the `[properties]` section are deprecated and should be placed in the `[built-in options]` section instead.
> 
> Source: https://mesonbuild.com/Machine-files.html#properties
> 
> Fixes the following deprecation warnings:
> 
> > DEPRECATION: c_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
> > DEPRECATION: c_link_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
> > DEPRECATION: cpp_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
> > DEPRECATION: cpp_link_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.  
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  package/meson/cross-compilation.conf.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
