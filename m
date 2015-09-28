From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 28 Sep 2015 11:43:28 +0100
Subject: [Buildroot] [RFC PATCH 1/2] eventlog: New package
In-Reply-To: <1443266743-20775-2-git-send-email-judge.packham@gmail.com>
References: <1443266743-20775-1-git-send-email-judge.packham@gmail.com>
 <1443266743-20775-2-git-send-email-judge.packham@gmail.com>
Message-ID: <560919D0.6020001@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On 09/26/2015 12:25 PM, Chris Packham wrote:
> eventlog is a library for creating structured events from applications,
> and is the workhorse behind syslog-ng's own messages.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/Config.in            |  1 +
>  package/eventlog/Config.in   |  5 +++++
>  package/eventlog/eventlog.mk | 14 ++++++++++++++
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/eventlog/Config.in
>  create mode 100644 package/eventlog/eventlog.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9dff5e8..2c033ba 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -943,6 +943,7 @@ endmenu
>  
>  menu "Logging"
>  	source "package/glog/Config.in"
> +	source "package/eventlog/Config.in"

this should be alphabetically ordered.

>  	source "package/liblog4c-localtime/Config.in"
>  	source "package/liblogging/Config.in"
>  	source "package/log4cplus/Config.in"
> diff --git a/package/eventlog/Config.in b/package/eventlog/Config.in
> new file mode 100644
> index 0000000..3ba909a
> --- /dev/null
> +++ b/package/eventlog/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_EVENTLOG
> +	bool "eventlog"
> +	help
> +	  eventlog is a library for creating structured events from
> +	  applications, and is the workhorse behind syslog-ng's own messages.
> diff --git a/package/eventlog/eventlog.mk b/package/eventlog/eventlog.mk
> new file mode 100644
> index 0000000..14bbbfe
> --- /dev/null
> +++ b/package/eventlog/eventlog.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# eventlog
> +#
> +################################################################################
> +
> +EVENTLOG_VERSION = 0.2.12
> +EVENTLOG_SOURCE = eventlog_$(EVENTLOG_VERSION).tar.gz
> +EVENTLOG_SITE = https://my.balabit.com/downloads/eventlog/0.2/

The trailing slash is not needed.

> +EVENTLOG_LICENSE = BSD
> +EVENTLOG_LICENSE_FILES = COPYING
> +EVENTLOG_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> 

And you are missing an eventlog.hash file like this one:

# From https://my.balabit.com/downloads/eventlog/0.2/
sha1 3e35a634e7de029ab9d36995a085bfcb00ed6a4d  eventlog_0.2.12.tar.gz

Regards,

Vincent.
