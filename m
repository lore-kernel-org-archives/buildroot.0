From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Dec 2012 13:13:08 +0100
Subject: [Buildroot] [PATCH 01/20] package/vde2: new package
In-Reply-To: <1f7225d5ca0a09c835187bbfea4eb4ce1b6eb121.1355435224.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 13 Dec 2012 22:47:01 +0100")
References: <cover.1355435224.git.yann.morin.1998@free.fr>
 <cover.1355435224.git.yann.morin.1998@free.fr>
 <1f7225d5ca0a09c835187bbfea4eb4ce1b6eb121.1355435224.git.yann.morin.1998@free.fr>
Message-ID: <87vcc4j0h7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> VDE is an ethernet compliant virtual network that can be
 Yann> spawned over a set of physical computer over the Internet.

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Cc: Arnout Vandecappelle <arnout@mind.be>
 Yann> ---
 Yann>  package/Config.in      |    1 +
 Yann>  package/vde2/Config.in |   10 ++++++++++
 Yann>  package/vde2/vde2.mk   |   36 ++++++++++++++++++++++++++++++++++++
 Yann>  3 files changed, 47 insertions(+), 0 deletions(-)
 Yann>  create mode 100644 package/vde2/Config.in
 Yann>  create mode 100644 package/vde2/vde2.mk

 Yann> diff --git a/package/Config.in b/package/Config.in
 Yann> index cad1221..2345b4b 100644
 Yann> --- a/package/Config.in
 Yann> +++ b/package/Config.in
 Yann> @@ -672,6 +672,7 @@ source "package/ttcp/Config.in"
 Yann>  source "package/udpcast/Config.in"
 Yann>  source "package/ulogd/Config.in"
 Yann>  source "package/ushare/Config.in"
 Yann> +source "package/vde2/Config.in"
 Yann>  source "package/vpnc/Config.in"
 Yann>  source "package/vsftpd/Config.in"
 Yann>  source "package/vtun/Config.in"
 Yann> diff --git a/package/vde2/Config.in b/package/vde2/Config.in
 Yann> new file mode 100644
 Yann> index 0000000..f344d67
 Yann> --- /dev/null
 Yann> +++ b/package/vde2/Config.in
 Yann> @@ -0,0 +1,10 @@
 Yann> +config BR2_PACKAGE_VDE2
 Yann> +	bool "vde2"
 Yann> +	help
 Yann> +	  VDE is an ethernet compliant virtual network that can be
 Yann> +	  spawned over a set of physical computers over the Internet.
 Yann> +	  VDE is part of the virtualsquare project.
 Yann> +	  
 Yann> +	  http://vde.sourceforge.net/
 Yann> +	  
 Yann> +	  Note: only the libraries are installed.

Wouldn't it then make more sense to put it under Libraries ->
Networking?

A quick test build seems to show that it needs C++ support:

checking whether the C++ compiler works... no
configure: error: in `/home/peko/source/buildroot/vdetest/build/vde2-2.3.2':
configure: error: C++ compiler cannot create executables
See `config.log' for more details

I don't see any C++ source files though, so it's probably better to drop
AC_PROG_CXX from configure.ac

-- 
Bye, Peter Korsgaard
