From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:18:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-scapy3k: remove package
In-Reply-To: <20191203232832.70247-1-gabriel@potter.fr>
References: <20191203232832.70247-1-gabriel@potter.fr>
Message-ID: <20191208221836.121c8e71@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 23:28:32 +0000
gpotter2 <gabriel@potter.fr> wrote:

> Scapy3k is deprecated since Scapy supports Python 3.
> Scapy should be used instead
> 
> See https://bugs.busybox.net/show_bug.cgi?id=12376
> 
> Signed-off-by: Gabriel Potter <gabriel@potter.fr>
> ---
>  Config.in.legacy                           |  6 ++++++
>  package/Config.in                          |  1 -
>  package/python-scapy3k/Config.in           |  9 ---------
>  package/python-scapy3k/python-scapy3k.hash |  2 --
>  package/python-scapy3k/python-scapy3k.mk   | 12 ------------
>  5 files changed, 6 insertions(+), 24 deletions(-)
>  delete mode 100644 package/python-scapy3k/Config.in
>  delete mode 100644 package/python-scapy3k/python-scapy3k.hash
>  delete mode 100644 package/python-scapy3k/python-scapy3k.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 02886bff36..dfe7683a42 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2020.02"
>  
> +config BR2_PACKAGE_PYTHON_SCAPY3K
> +	bool "scapy3k was removed"
> +	select BR2_LEGACY

I've added a:

	select BR2_PACKAGE_PYTHON_SCAPY

here.

> +	help
> +	  scapy3k has been deprecated since Scapy gained Python 3 support. Use BR2_PACKAGE_PYTHON_SCAPY instead

This line was too long ("make check-package" warns about it), and I've
rephrased slightly.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
