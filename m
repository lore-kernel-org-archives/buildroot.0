From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 23:20:10 +0200
Subject: [Buildroot] [PATCH 1/1] boost: thread depends on NPTL
In-Reply-To: <20180625211317.12643-1-fontaine.fabrice@gmail.com>
References: <20180625211317.12643-1-fontaine.fabrice@gmail.com>
Message-ID: <20180625232010.019e5b8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jun 2018 23:13:17 +0200, Fabrice Fontaine wrote:
> - Since boost 1.67, CLOCK_MONOTONIC is used by default, there is no more
>   check on pthread_condaddr_setclock availability:
>   https://github.com/boostorg/thread/commit/1e84b978b2bb0aae830cc14533dea3b7ddda5cde
> - So add NPTL dependency on boost-thread but also on boost-contract,
>   boost-locale, boost-type_erasure and boost-wave which use
>   boost-thread (and select it even if boost will do it on its own)
> - Add also NPTL dependency to pulseview
> - Update comment on NPTL in azmq
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/7db2baeb70b30f7785cbb823e9eaeb8e99ef0d24
>  - http://autobuild.buildroot.net/results/6a4c5f8d45b51d32114093fa68195c2df2db5449
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

pthread_condattr_setclock() is now implemented in linuxthreads in
uClibc-ng starting version 1.0.30. I think I should instead rebuild the
pre-built toolchains rather than adding this NPTL dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
