From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 11:41:44 +0200
Subject: [Buildroot] [PATCH 1/1] bandwidthd: Version bump to handle
 indirect deps properly
In-Reply-To: <1413708943-13566-1-git-send-email-nroach44@gmail.com>
References: <1413708943-13566-1-git-send-email-nroach44@gmail.com>
Message-ID: <20141019094144.GL4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathaniel, All,

On 2014-10-19 16:55 +0800, Nathaniel Roach spake thusly:
> Thanks to Romain Naor, Baruch Siach and Thomas Petazzoni, I've

Romain Naour, I believe... ;-)

> solved the build issues in certain cases for bandwidthd.
> 
> The issue was that libpcap and libpng would depend on other libraries
> and upon testing for pcap/libpng the tests would fail due to not
> being able to find the other libraries.
> 
> Bandwidthd's configure script now uses pkg-config for libpng
> and pcap-config for libpcap. pcap-config's path is specified
> in configure's arguments.
> 
> Some other tweaks have been made including the layout and flow
> of configure.ac is a bit more logical, and the handling of postgres
> and sqlite has been tweaked. Finally, the test for X.Org has been
> removed.
> 
> Fixes: http://autobuild.buildroot.org/results/eb4/eb48acec37a7fd1714b267b105816bf0053d40e9/build-end.log
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>

Usually, when some people helped with the patch, it is customary (but
not mandatory) to add them in Cc: lines below the SoB line. ;-)

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/bandwidthd/bandwidthd.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
> index 7a2975f..ca991f9 100644
> --- a/package/bandwidthd/bandwidthd.mk
> +++ b/package/bandwidthd/bandwidthd.mk
> @@ -4,18 +4,18 @@
>  #
>  ################################################################################
>  
> -BANDWIDTHD_VERSION = v2.0.1-auto-r08
> +BANDWIDTHD_VERSION = v2.0.1-auto-r11
>  BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,$(BANDWIDTHD_VERSION))
>  
>  # Specified as "any version of the GPL that is current as of your
>  # download" by upstream.
>  BANDWIDTHD_LICENSE = GPL
>  
> -BANDWIDTHD_DEPENDENCIES = gd libpng libpcap
> +BANDWIDTHD_DEPENDENCIES = gd libpng libpcap host-pkgconf
>  
>  BANDWIDTHD_AUTORECONF = YES
>  
> -BANDWIDTHD_CONF_OPTS += --without-x
> +BANDWIDTHD_CONF_OPTS += --with-pcap-config=$(STAGING_DIR)/usr/bin/pcap-config
>  
>  ifeq ($(BR2_PACKAGE_BANDWIDTHD_POSTGRESQL),y)
>  BANDWIDTHD_DEPENDENCIES += postgresql
> -- 
> 2.1.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
