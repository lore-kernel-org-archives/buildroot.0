From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:18:58 +0100
Subject: [Buildroot] [PATCH v2 01/14] fftw: breaks fftw-single into a
 dedicated package
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181216211858.1983cbc5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 08:45:26 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> fftw's library name depends on the precision option. Consequently,
> it's possible to install multiple flavor on the same target.
> 
> This patch breaks fftw single precision into a new package and:
> - deprecates BR2_PACKAGE_FFTW_PRECISION_SINGLE, BR2_PACKAGE_FFTW_SINGLE must be
>   used instead;
> - suppress BR2_PACKAGE_FFTW_USE_SSE and BR2_PACKAGE_FFTW_USE_NEON since options
>   are only available on single precision. Corresponding options are directly
>   handled in fftw-single package;
> - do fftw depends on fftw-single when this package is enabled.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2:
>  * BR2_PACKAGE_FFTW_PRECISION_SINGLE -> BR2_PACKAGE_FFTW_SINGLE (Arnout)
>  * old symbol deprecation (Arnout)
>  * split big monolithic patch into a serie (Arnout)
>  * add dependency between fftw and fftw-single (Yann)
> ---
>  Config.in.legacy                          |  9 +++++++
>  package/fftw/Config.in                    | 17 ++----------
>  package/fftw/fftw-single/Config.in        |  5 ++++
>  package/fftw/fftw-single/fftw-single.hash |  1 +
>  package/fftw/fftw-single/fftw-single.mk   | 33 +++++++++++++++++++++++
>  package/fftw/fftw.mk                      | 12 ++++-----
>  6 files changed, 56 insertions(+), 21 deletions(-)
>  create mode 100644 package/fftw/fftw-single/Config.in
>  create mode 120000 package/fftw/fftw-single/fftw-single.hash
>  create mode 100644 package/fftw/fftw-single/fftw-single.mk

For information: Yann and me have started reviewing/testing/tweaking
this patch series today. We found a number of things to improve, and
I'll continue working on this.

So I'd be nice if Arnout/Peter you could wait before applying this, and
consider it is in my queue of patches to apply. I'll mark the patches
as delegated to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
