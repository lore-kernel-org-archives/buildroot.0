From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 23:00:37 +0100
Subject: [Buildroot] [PATCH 3/4] linknx: new package
In-Reply-To: <1364160848-15168-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 22:34:07 +0100")
References: <1364160848-15168-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364160848-15168-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gkwh30a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Gregory Hermant <gregory.hermant@calao-systems.com>
 Thomas> [Thomas: various fixes/improvements]
 Thomas> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in        |    1 +
 Thomas>  package/linknx/Config.in |    8 ++++++++
 Thomas>  package/linknx/linknx.mk |   31 +++++++++++++++++++++++++++++++
 Thomas>  3 files changed, 40 insertions(+)
 Thomas>  create mode 100644 package/linknx/Config.in
 Thomas>  create mode 100644 package/linknx/linknx.mk

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> index be1aa99..97aab31 100644
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -672,6 +672,7 @@ source "package/iptables/Config.in"
 Thomas>  source "package/iw/Config.in"
 Thomas>  source "package/kismet/Config.in"
 Thomas>  source "package/lighttpd/Config.in"
 Thomas> +source "package/linknx/Config.in"
 Thomas>  source "package/links/Config.in"
 Thomas>  source "package/linphone/Config.in"
 Thomas>  source "package/lrzsz/Config.in"
 Thomas> diff --git a/package/linknx/Config.in b/package/linknx/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..70942fc
 Thomas> --- /dev/null
 Thomas> +++ b/package/linknx/Config.in
 Thomas> @@ -0,0 +1,8 @@
 Thomas> +config BR2_PACKAGE_LINKNX
 Thomas> +	bool "linknx"
 Thomas> +	select BR2_PACKAGE_LIBPTHSEM
 Thomas> +	help
 Thomas> +	  Linknx is an automation platform providing high level functionalities
 Thomas> +	  to EIB/KNX installation.
 Thomas> +
 Thomas> +	  http://linknx.sourceforge.net/

If I'm not mistaken, linknx is implemented in C++, so you need the
INSTALL_LIBSTDCPP dependency.

 Thomas> +LINKNX_CONF_OPT = --without-lua --without-log4cpp --without-pth-test \
 Thomas> +		  --with-pth=$(STAGING_DIR)/usr

The log4cpp reference seems to confirm that. We do have a log4cxx
package now though.

-- 
Bye, Peter Korsgaard
