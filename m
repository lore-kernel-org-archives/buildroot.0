From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 May 2013 15:54:36 +0200
Subject: [Buildroot] [PATCH 18/20] gpu-viv-bin-mx6q: new package
In-Reply-To: <20130529154831.4ed34d89@skate> (Thomas Petazzoni's message of
 "Wed, 29 May 2013 15:48:31 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-19-git-send-email-thomas.petazzoni@free-electrons.com>
 <878v2x7vn1.fsf@dell.be.48ers.dk> <20130529154831.4ed34d89@skate>
Message-ID: <87zjvd6gdf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Wed, 29 May 2013 15:39:30 +0200, Peter Korsgaard wrote:

 Thomas> +config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 Thomas> +	bool "gpu-viv-bin-mx6q"
 Thomas> +	select BR2_PACKAGE_HAS_OPENGL_EGL
 Thomas> +	select BR2_PACKAGE_HAS_OPENGL_ES
 Thomas> +	depends on BR2_arm # Only relevant for i.MX6
 Thomas> +	 # Library binaries are linked against libc.so.6
 Thomas> +	depends on BR2_TOOLCHAIN_CTNG_glibc || \
 Thomas> +		BR2_TOOLCHAIN_CTNG_eglibc || \
 Thomas> +		BR2_TOOLCHAIN_EXTERNAL_GLIBC
 >> 
 >> We should also inform the user about this, so I've added a comment
 >> option, similar to how we handle to other toolchain options.

 Thomas> Then we should fix BR2_PACKAGE_ELFUTILS_PROGS, BR2_PACKAGE_MONGREL2,
 Thomas> BR2_PACKAGE_NSS_MDNS and BR2_PACKAGE_TZDATA (even though for the
 Thomas> latter, I'm not sure, since tzdata is not useful at all with uClibc).

I think we should, yes (exept for tzdata and arguably also nss_mdns).

-- 
Bye, Peter Korsgaard
