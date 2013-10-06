From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 20:44:30 +0200
Subject: [Buildroot] [PATCH] libcap-ng: doesn't build on AVR32,
	requires TLS support
In-Reply-To: <1381077279-19561-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Oct 2013 18:34:39 +0200")
References: <1381077279-19561-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871u3yfddd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> libcap-ng doesn't build on AVR32, since it requires TLS support in the
 Thomas> compiler and C library.

 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.org/results/770/77061f301ba405a1607ce5bfa9e450182f0fdec5/build-end.log

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/libcap-ng/Config.in | 2 ++
 Thomas>  package/ofono/Config.in     | 1 +
 Thomas>  2 files changed, 3 insertions(+)

 Thomas> diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
 Thomas> index d1663cd..b799dc9 100644
 Thomas> --- a/package/libcap-ng/Config.in
 Thomas> +++ b/package/libcap-ng/Config.in
 Thomas> @@ -1,5 +1,7 @@
 Thomas>  config BR2_PACKAGE_LIBCAP_NG
 Thomas>  	bool "libcap-ng"
 Thomas> +	# tls support, needed by libcap-ng, not available on avr32
 Thomas> +	depends on !BR2_avr32

Shouldn't it then depend on BR2_GCC_ENABLE_TLS (and the avr32 toolchain
not select it)?

-- 
Bye, Peter Korsgaard
