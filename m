From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 22:54:42 +0100
Subject: [Buildroot] [PATCH 1/4] libpthsem: new package
In-Reply-To: <1364160848-15168-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 22:34:05 +0100")
References: <1364160848-15168-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364160848-15168-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvzkh3a5.fsf@dell.be.48ers.dk>
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
 Thomas>  package/Config.in                                  |    1 +
 Thomas>  package/libpthsem/Config.in                        |    9 +++++++
 Thomas>  ...bpthsem-2.0.8-fix-build-on-linux-3.x-host.patch |   28 ++++++++++++++++++++
 Thomas>  package/libpthsem/libpthsem.mk                     |   18 +++++++++++++
 Thomas>  4 files changed, 56 insertions(+)
 Thomas>  create mode 100644 package/libpthsem/Config.in
 Thomas>  create mode 100644 package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch
 Thomas>  create mode 100644 package/libpthsem/libpthsem.mk

 Thomas> +++ b/package/libpthsem/Config.in
 Thomas> @@ -0,0 +1,9 @@
 Thomas> +config BR2_PACKAGE_LIBPTHSEM
 Thomas> +	bool "libpthsem"
 Thomas> +	select BR2_PACKAGE_ARGP_STANDALONE
 Thomas> +	help
 Thomas> +	  GNU pth is a user mode multi threading library. pthsem is an extend
 Thomas> +	  version, with support for semaphores added.
 Thomas> +
 Thomas> +	  http://www.auto.tuwien.ac.at/~mkoegler/pth/
 Thomas> +

Trailing newline.

 Thomas> +LIBPTHSEM_AUTORECONF = YES
 Thomas> +LIBPTHSEM_INSTALL_STAGING = YES
 Thomas> +LIBPTHSEM_DEPENDENCIES = argp-standalone
 Thomas> +LIBPTHSEM_CONFIG_SCRIPTS = pthsem-config
 Thomas> +
 Thomas> +$(eval $(autotools-package))
 Thomas> +

Here as well.

Committed with those fixed, thanks.

-- 
Bye, Peter Korsgaard
