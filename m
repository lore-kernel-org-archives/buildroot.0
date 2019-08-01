From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 18:29:01 +0200
Subject: [Buildroot] [PATCH] package/cups-filters: fix build without NLS
In-Reply-To: <20190722071146.30199-1-unixmania@gmail.com>
References: <20190722071146.30199-1-unixmania@gmail.com>
Message-ID: <20190801182901.47e8377f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jul 2019 04:11:46 -0300
unixmania at gmail.com wrote:

> +# texttotext must be linked to libiconv if !BR2_ENABLE_LOCALE. We could patch
> +# configure.ac to use AM_ICONV but it would require iconv.m4, increasing the
> +# patch size by at least 130 lines. Let's keep it simple and just patch
> +# Makefile.am to append -liconv to the link command line.

Why is this AM_ICONV solution taking at least 130 lines ? This would be
upstreamable, and looks a lot nicer. Could you propose a patch with an
AM_ICONV base solution instead ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
