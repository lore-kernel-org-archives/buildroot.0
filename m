From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 21:36:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/valijson: bump version to 0.2
In-Reply-To: <1571741515-11901-1-git-send-email-santosh.multhalli@rockwellcollins.com>
References: <1571741515-11901-1-git-send-email-santosh.multhalli@rockwellcollins.com>
Message-ID: <20191022213631.0c75a174@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Santosh,

On Tue, 22 Oct 2019 16:21:55 +0530
Santosh Multhalli <santosh.multhalli@rockwellcollins.com> wrote:

> --------

These signs are not needed.

> 
> 1) Added hash  of LICENSE file in valijson.hash
> 2) Updated hash of valijson tar file in valijson.hash file
> 3) Added libcurlpp dependency in valijson.mk file
> 4) Update Config.in file to select curlpp in case  valijson selected
> 
> --------

These are also not needed.

> diff --git a/package/valijson/Config.in b/package/valijson/Config.in
> index 10721b3..36a19c3 100644
> --- a/package/valijson/Config.in
> +++ b/package/valijson/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_VALIJSON
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_BOOST_REGEX
> +	select BR2_PACKAGE_CURLPP

Are you sure curlpp is mandatory? As far as I can see, it's only used
for building some of the examples, and the examples are not built by
default.

Could you check this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
