From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:21:59 +0200
Subject: [Buildroot] [PATCH] package/gnuradio: bump to 3.8.1.0
In-Reply-To: <20200412152610.18332-1-gwenj@trabucayre.com>
References: <20200412152610.18332-1-gwenj@trabucayre.com>
Message-ID: <20200412232159.7c5e5d7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Apr 2020 17:26:10 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> - use github url
> - suppress all patches (applied in mainline)
> - add DGR_PYTHON_DIR option to force install in site-packages instead of
>   dist-packages
> 
> fix (at least):
> - http://autobuild.buildroot.net/results/ff29b01f41c7d2e139a319aac1406dc00185fcae/
> - http://autobuild.buildroot.net/results/cae9ad5b746bfd728688ab655c23087a6f70fd50/
> - http://autobuild.buildroot.net/results/333fd49196d71ea68f64ad046c38e480593f127e/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Thanks, I've applied. One minor issue, see below.

> -GNURADIO_VERSION = 3.8.0.0
> -GNURADIO_SITE = https://gnuradio.org/releases/gnuradio
> +GNURADIO_VERSION = 3.8.1.0
> +GNURADIO_SOURCE = gnuradio-$(GNURADIO_VERSION).tar.gz

This variable is not needed, as it is the default value. It triggers a
check-package warning.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
