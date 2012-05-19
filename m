From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 May 2012 20:53:18 +0200
Subject: [Buildroot] [PATCH] logsurfer: new package
In-Reply-To: <1337067382-19212-1-git-send-email-faessler@was.ch> ("Dominik
 =?utf-8?Q?F=C3=A4ssler=22's?= message of "Tue, 15 May 2012 09:36:22 +0200")
References: <1337067382-19212-1-git-send-email-faessler@was.ch>
Message-ID: <87ipfsm28x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dominik" == Dominik F?ssler <faessler@was.ch> writes:

 Dominik> ---
 Dominik>  package/Config.in              |    1 +
 Dominik>  package/logsurfer/Config.in    |    7 +++++++
 Dominik>  package/logsurfer/logsurfer.mk |   15 +++++++++++++++
 Dominik>  3 files changed, 23 insertions(+), 0 deletions(-)
 Dominik>  create mode 100644 package/logsurfer/Config.in
 Dominik>  create mode 100644 package/logsurfer/logsurfer.mk

 Dominik> diff --git a/package/Config.in b/package/Config.in
 Dominik> index 4e3c414..091f8d6 100644
 Dominik> --- a/package/Config.in
 Dominik> +++ b/package/Config.in
 Dominik> @@ -613,6 +613,7 @@ source "package/file/Config.in"
 Dominik>  source "package/inotify-tools/Config.in"
 Dominik>  source "package/lockfile-progs/Config.in"
 Dominik>  source "package/logrotate/Config.in"
 Dominik> +source "package/logsurfer/Config.in"
 Dominik>  source "package/screen/Config.in"
 Dominik>  source "package/sudo/Config.in"
 Dominik>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Dominik> diff --git a/package/logsurfer/Config.in b/package/logsurfer/Config.in
 Dominik> new file mode 100644
 Dominik> index 0000000..27d1881
 Dominik> --- /dev/null
 Dominik> +++ b/package/logsurfer/Config.in
 Dominik> @@ -0,0 +1,7 @@
 Dominik> +config BR2_PACKAGE_LOGSURFER
 Dominik> +	bool "logsurfer"
 Dominik> +	help
 Dominik> +	  Logsurfer is a program for monitoring system logs in real-time,
 Dominik> +	  and reporting on the occurrence of events.
 Dominik> +
 Dominik> +	  http://www.crypt.gen.nz/logsurfer/
 Dominik> diff --git a/package/logsurfer/logsurfer.mk b/package/logsurfer/logsurfer.mk
 Dominik> new file mode 100644
 Dominik> index 0000000..31405ff
 Dominik> --- /dev/null
 Dominik> +++ b/package/logsurfer/logsurfer.mk
 Dominik> @@ -0,0 +1,15 @@
 Dominik> +#############################################################
 Dominik> +#
 Dominik> +# logsurfer
 Dominik> +#
 Dominik> +#############################################################
 Dominik> +
 Dominik> +LOGSURFER_VERSION = 1.8
 Dominik> +LOGSURFER_SOURCE = logsurfer-$(LOGSURFER_VERSION).tar.gz
 Dominik> +LOGSURFER_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/logsurfer/logsurfer/logsurfer-${LOGSURFER_VERSION}
 Dominik> +
 Dominik> +define LOGSURFER_INSTALL_TARGET_CMDS
 Dominik> +	$(INSTALL) -D -m 0755 $(@D)/src/logsurfer $(TARGET_DIR)/bin
 Dominik> +endef

Next to the feedback Arnout gave you, this line is wrong. With install
-D you need to provide the destination file name as well, and it would
be good to install man pages if BR2_HAVE_DOCUMENTATION is enabled.

I've fixed up these things and committed to next, thanks.

-- 
Bye, Peter Korsgaard
