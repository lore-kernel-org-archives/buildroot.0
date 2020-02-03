From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:43:20 +0100
Subject: [Buildroot] [PATCH v2 5/6] package/gr-osmosdr: add python3
 support
In-Reply-To: <20200117110232.31336-5-gwenj@trabucayre.com>
References: <20200117110232.31336-1-gwenj@trabucayre.com>
 <20200117110232.31336-5-gwenj@trabucayre.com>
Message-ID: <20200203234320.67074c8b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jan 2020 12:02:31 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Gnuradio 3.8 support python2 and python3 and since gr-osmosdr support both two,
> adapts dependencies
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gr-osmosdr/Config.in     | 2 +-
>  package/gr-osmosdr/gr-osmosdr.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
> index f26380371f..ee01f5add4 100644
> --- a/package/gr-osmosdr/Config.in
> +++ b/package/gr-osmosdr/Config.in
> @@ -11,7 +11,7 @@ if BR2_PACKAGE_GR_OSMOSDR
>  
>  config BR2_PACKAGE_GR_OSMOSDR_PYTHON
>  	bool "python support"
> -	depends on BR2_PACKAGE_GNURADIO_PYTHON
> +	depends on BR2_PACKAGE_GNURADIO_PYTHON || BR2_PACKAGE_GNURADIO_PYTHON3

This option BR2_PACKAGE_GNURADIO_PYTHON3 does not exist, so I dropped
this part of the change.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
