From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:42:20 +0100
Subject: [Buildroot] [PATCH v2 3/6] package/gnuradio: bump to version
 3.8.0.0
In-Reply-To: <20200117110232.31336-3-gwenj@trabucayre.com>
References: <20200117110232.31336-1-gwenj@trabucayre.com>
 <20200117110232.31336-3-gwenj@trabucayre.com>
Message-ID: <20200203234220.106983ea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jan 2020 12:02:29 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since 2019/08/09 a new version of gnuradio is available.
> This patch bump to this version with some modifications:
> - suppress the applied patch 0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
> - backport patch to have boost unit_test_framework optional instead of mandatory:
>   https://github.com/gnuradio/gnuradio/pull/2927
> - backport patch to fix neon version detection:
>   https://github.com/gnuradio/volk/pull/319
> - add boost atomic (used by pmt), log4cpp (now mandatory) and gmp as dependencies
> - suppress the no more available BR2_PACKAGE_GNURADIO_LOG, since log4cpp is mandatory. Since this
>   option is now always true no need to add an entry in legacy.
> - suppress all workaround for neon. Now volk is able to detect correctly neon
>   version.
> - add explictly path to python interpreter
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2:
>  * add backported patch (Arnout)
>  * explain why BR2_PACKAGE_GNURADIO_LOG is not added to legacy (Arnout)
>  * suppress everything about neon (Arnout)
> ---
>  ...est_framework-required-only-when-ENA.patch | 92 +++++++++++++++++++
>  ..._impl.cc-fix-build-with-boost-1.70.0.patch | 42 ---------
>  ...MakeLists-fix-neon-version-detection.patch | 50 ++++++++++

Did you submit upstream the two patches that you have added ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
