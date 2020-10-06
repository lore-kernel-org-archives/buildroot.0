From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:09:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/brotli: fix pkg-config
In-Reply-To: <20201005171407.2608421-1-fontaine.fabrice@gmail.com>
References: <20201005171407.2608421-1-fontaine.fabrice@gmail.com>
Message-ID: <20201006210935.161acda8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  5 Oct 2020 19:14:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> brotli pkg-config files are broken since version 1.0.8 and
> https://github.com/google/brotli/commit/31754d4ffce14153b5c2addf7a11019ec23f51c1
> 
> This raise static build failures with all packages using brotli,
> fontconfig or freetype such as fbterm:
> 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os[...]
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/21ede59686d4998c9e643ea874396a11b1c0df93
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...time-linker-path-to-pkg-config-files.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/brotli/0002-Revert-Add-runtime-linker-path-to-pkg-config-files.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
