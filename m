From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 30 Oct 2014 09:20:22 +0200
Subject: [Buildroot] [PATCH] tcpdump: use libpcap shared library
In-Reply-To: <67c0a327947d1f710687a04d56a3a047984f3988.1414585221.git.baruch@tkos.co.il>
References: <67c0a327947d1f710687a04d56a3a047984f3988.1414585221.git.baruch@tkos.co.il>
Message-ID: <20141030072022.GF1759@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

On Wed, Oct 29, 2014 at 02:20:21PM +0200, Baruch Siach wrote:
> Currently the tcpdump configure script finds libpcap.a in
> output/build/libpcap-[version]. This check is hard coded in aclocal.m4. Add a
> patch to optionally ignore local libpcap so that the system shared library
> version is found instead. This reduces the tcpdump binary size in a few 100KB.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...libpcap-when-configured-with-with-system-.patch | 78 ++++++++++++++++++++++
>  package/tcpdump/tcpdump.mk                         |  7 +-
>  2 files changed, 83 insertions(+), 2 deletions(-)
>  create mode 100644 package/tcpdump/0001-Use-system-libpcap-when-configured-with-with-system-.patch
> 
> diff --git a/package/tcpdump/0001-Use-system-libpcap-when-configured-with-with-system-.patch b/package/tcpdump/0001-Use-system-libpcap-when-configured-with-with-system-.patch
> new file mode 100644
> index 000000000000..7f8b7151c9d0
> --- /dev/null
> +++ b/package/tcpdump/0001-Use-system-libpcap-when-configured-with-with-system-.patch
> @@ -0,0 +1,78 @@
> +From 4289e62c7966e5abeb95307717cef30a51fcdccf Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Wed, 29 Oct 2014 13:21:05 +0200
> +Subject: [PATCH] Use system libpcap when configured with --with-system-pcap
> +
> +Don't force the local libpcap build when the system provides one. When
> +--with-system-pcap is given to configure, don't try to locate a local libpcap
> +build. This help build systems like Buildroot that store build trees in the
> +same directory, but still prefer dynamically linking against system wide
> +libpcap.so to save space.
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +---
> +Status: sent upstream (https://github.com/the-tcpdump-group/tcpdump/pull/408)

The patch is now upstream: 
https://github.com/the-tcpdump-group/tcpdump/commit/4289e62c7966e5abeb95307717cef30a51fcdccf.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
