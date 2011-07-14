From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Jul 2011 19:53:20 +0200
Subject: [Buildroot] [PATCH] New package: libyaml
In-Reply-To: <1310644607-25251-1-git-send-email-evgeni_dobrev@developer.bg>
 (Evgeni Dobrev's message of "Thu, 14 Jul 2011 13:56:47 +0200")
References: <1310644607-25251-1-git-send-email-evgeni_dobrev@developer.bg>
Message-ID: <87tyaobvfz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Evgeni" == Evgeni Dobrev <evgeni_dobrev@developer.bg> writes:

 Evgeni> YAML 1.1 parser and emitter written in C

Thanks, see below for a few comments..


 Evgeni> ---
 Evgeni>  package/Config.in          |    1 +
 Evgeni>  package/libyaml/Config.in  |    8 ++++++++
 Evgeni>  package/libyaml/libyaml.mk |   14 ++++++++++++++
 Evgeni>  3 files changed, 23 insertions(+), 0 deletions(-)
 Evgeni>  create mode 100644 package/libyaml/Config.in
 Evgeni>  create mode 100644 package/libyaml/libyaml.mk

 Evgeni> diff --git a/package/Config.in b/package/Config.in
 Evgeni> index fb5a570..dee3b70 100644
 Evgeni> --- a/package/Config.in
 Evgeni> +++ b/package/Config.in
 Evgeni> @@ -345,6 +345,7 @@ source "package/libglib2/Config.in"
 Evgeni>  source "package/libnspr/Config.in"
 Evgeni>  source "package/liboil/Config.in"
 Evgeni>  source "package/libsigc/Config.in"
 Evgeni> +source "package/libyaml/Config.in"

I think it would make more sense to put it together with the other
xml/json parsers instead of libraries/other.


 Evgeni>  source "package/startup-notification/Config.in"
 Evgeni>  endmenu
 
 Evgeni> diff --git a/package/libyaml/Config.in b/package/libyaml/Config.in
 Evgeni> new file mode 100644
 Evgeni> index 0000000..23e74a5
 Evgeni> --- /dev/null
 Evgeni> +++ b/package/libyaml/Config.in
 Evgeni> @@ -0,0 +1,8 @@
 Evgeni> +config BR2_PACKAGE_LIBYAML
 Evgeni> +	bool "libyaml"
 Evgeni> +	default n

'n' is default, so you can drop this line.

 Evgeni> +	help
 Evgeni> +	LibYAML is a YAML 1.1 parser and emitter written in C.
 Evgeni> +
 Evgeni> +	http://pyyaml.org/wiki/LibYAML
 Evgeni> +

Help lines are indented with '<tab><space><space>'. You have an extra
empty line at the end that you can also drop.

 Evgeni> diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
 Evgeni> new file mode 100644
 Evgeni> index 0000000..2e936fc
 Evgeni> --- /dev/null
 Evgeni> +++ b/package/libyaml/libyaml.mk
 Evgeni> @@ -0,0 +1,14 @@
 Evgeni> +#############################################################
 Evgeni> +#
 Evgeni> +# yaml
 Evgeni> +#
 Evgeni> +#############################################################
 Evgeni> +LIBYAML_VERSION = 0.1.4
 Evgeni> +LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
 Evgeni> +LIBYAML_SITE = http://pyyaml.org/download/libyaml/
 Evgeni> +LIBYAML_INSTALL_STAGING = YES
 Evgeni> +LIBYAML_INSTALL_TARGET = YES

You can drop this line as YES is default.

 Evgeni> +$(eval $(call AUTOTARGETS,package,libyaml))

Otherwise it looks good. Care to fix and resend?

-- 
Bye, Peter Korsgaard
