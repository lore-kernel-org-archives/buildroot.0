From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 11:28:26 +0200
Subject: [Buildroot] [v2 1/1] dos2unix: new package
In-Reply-To: <1410421438-9694-1-git-send-email-david.bachelart@bbright.com>
References: <1410421438-9694-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20140911112826.3c8d0947@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Bachelart,

On Thu, 11 Sep 2014 09:43:57 +0200, David Bachelart wrote:

> diff --git a/package/dos2unix/Config.in.host b/package/dos2unix/Config.in.host
> new file mode 100644
> index 0000000..946271b
> --- /dev/null
> +++ b/package/dos2unix/Config.in.host
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HOST_DOS2UNIX
> +  bool "host dos2unix"
> +  help

Indentation: one tab.

> +    dos2unix converts text file line endings between CRLF and LF
> +
> +    http://freshmeat.net/projects/dos2unix

Indentation: one tab + two spaces. See the Buildroot manual, "Coding
style" section for details.

> diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
> new file mode 100644
> index 0000000..ad47e61
> --- /dev/null
> +++ b/package/dos2unix/dos2unix.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# dos2unix
> +#
> +################################################################################
> +
> +DOS2UNIX_VERSION = 6.0.6
> +DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix/

There is a 7.0 version. Any reason not to use it?

> +
> +DOS2UNIX_LICENSE = BSD-2c
> +DOS2UNIX_LICENSE_FILES = COPYING.txt

This looks good;

> +
> +define HOST_DOS2UNIX_BUILD_CMDS
> +  $(HOST_CONFIGURE_OPTS) \
> +	make -C $(@D)

Indent with tab, and maybe put on one line since it's not too long. And
use $(MAKE), not make.

	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)

> +endef
> +
> +define HOST_DOS2UNIX_INSTALL_CMDS
> +  $(HOST_CONFIGURE_OPTS) \
> +	make -C $(@D) install DESTDIR=$(HOST_DIR)

	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		install DESTDIR=$(HOST_DIR)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
