From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:45:19 +0100
Subject: [Buildroot] [PATCH] package/gnuplot: bump to version 5.2.8
In-Reply-To: <20200217090658.5469-1-mf@go-sys.de>
References: <20200217090658.5469-1-mf@go-sys.de>
Message-ID: <20200226224519.058d5cec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Mon, 17 Feb 2020 10:06:58 +0100
Michael Fischer <mf@go-sys.de> wrote:

> 0001-configure-add-without-demo-option: adapt patch to 5.2.8 version
> 0002-use-gdlib-config-properly: already applied upstream
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Thanks for your contribution! If you're using gnuplot in Buildroot,
would you be willing to be listed as a developer for this package in
our DEVELOPERS file? This would help us maintain this package on the
long run.

I've applied your patch to our next branch, with a few changes. See below.

> diff --git a/package/gnuplot/0001-configure-add-without-demo-option.patch b/package/gnuplot/0001-configure-add-without-demo-option.patch
> index a9abfd06ba..890df55af9 100644
> --- a/package/gnuplot/0001-configure-add-without-demo-option.patch
> +++ b/package/gnuplot/0001-configure-add-without-demo-option.patch
> @@ -1,17 +1,17 @@
> -Add options to enable/disable docs and demos
> +-Add options to enable/disable docs and demos
> +-
> +-Originally written by Anthony Viallard
> +-<viallard@syscom-instruments.com>.
> +-
> +-[Vincent: adapt patch to 5.0.5 version]
> +-
> +-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Why did you add some - signs in front the description and Signed-off-by
lines? I dropped these, so that the patch description looks normal.

> diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
> index 1f3a08bb00..5c9ec636e4 100644
> --- a/package/gnuplot/gnuplot.hash
> +++ b/package/gnuplot/gnuplot.hash
> @@ -1,6 +1,3 @@
> -# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.0.6/
> -md5 8ec46520a86a61163a701b00404faf1a  gnuplot-5.0.6.tar.gz
> -sha1 f7b8948166b22e5bd658d5cf7579716f4821dba0  gnuplot-5.0.6.tar.gz

We prefer to keep the upstream hashes, they are provided by
Sourceforge, so I updated this to 5.2.8 instead of dropping those
hashes.

Applied to next with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
