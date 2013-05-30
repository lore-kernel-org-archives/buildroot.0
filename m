From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 23:04:06 +0200
Subject: [Buildroot] [PATCH 3/3] package/snappy: new package
In-Reply-To: <593d227bcb531b484e9a613baee53d3acaf9370b.1368567696.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 14 May 2013 23:45:59 +0200")
References: <cover.1368567696.git.yann.morin.1998@free.fr>
 <cover.1368567696.git.yann.morin.1998@free.fr>
 <593d227bcb531b484e9a613baee53d3acaf9370b.1368567696.git.yann.morin.1998@free.fr>
Message-ID: <87ehcoxjqx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Yann> ---
 Yann>  package/Config.in        |  1 +
 Yann>  package/snappy/Config.in |  9 +++++++++
 Yann>  package/snappy/snappy.mk | 13 +++++++++++++
 Yann>  3 files changed, 23 insertions(+)
 Yann>  create mode 100644 package/snappy/Config.in
 Yann>  create mode 100644 package/snappy/snappy.mk

 Yann> diff --git a/package/Config.in b/package/Config.in
 Yann> index 828b5b5..51e9f93 100644
 Yann> --- a/package/Config.in
 Yann> +++ b/package/Config.in
 Yann> @@ -383,6 +383,7 @@ endmenu
 Yann>  menu "Compression and decompression"
 Yann>  source "package/libarchive/Config.in"
 Yann>  source "package/lzo/Config.in"
 Yann> +source "package/snappy/Config.in"
 Yann>  source "package/zlib/Config.in"
 Yann>  endmenu
 
 Yann> diff --git a/package/snappy/Config.in b/package/snappy/Config.in
 Yann> new file mode 100644
 Yann> index 0000000..62136ca
 Yann> --- /dev/null
 Yann> +++ b/package/snappy/Config.in
 Yann> @@ -0,0 +1,9 @@
 Yann> +config BR2_PACKAGE_SNAPPY
 Yann> +	bool "snappy"
 Yann> +	help

It's implemented in C++, so it needs to depend on BR2_INSTALL_LIBSTDCPP.

Committed to next with that fixed, thanks.

-- 
Bye, Peter Korsgaard
