From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:59:08 +0200
Subject: [Buildroot] [PATCH v2] python-six: add host variant
In-Reply-To: <20170913132055.12371-1-julien.floret@6wind.com>
References: <20170913132055.12371-1-julien.floret@6wind.com>
Message-ID: <0b2ec939-489e-b746-e47c-d79be0a9e9bc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 15:20, Julien Floret wrote:
> While currently there is no in-tree Buildroot package which depends on
> host-python-six, it can be needed to build external packages.
> 
> Signed-off-by: Julien Floret <julien.floret@6wind.com>

 I'm very cautious adding host packages, but I guess python-six is something
extremely useful for custom python scripts that you want to run with the same
Python version as on the target.

 Therefore, applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/Config.in.host            | 1 +
>  package/python-six/Config.in.host | 9 +++++++++
>  package/python-six/python-six.mk  | 1 +
>  3 files changed, 11 insertions(+)
>  create mode 100644 package/python-six/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index c5a852b858a4..e2717ae3b541 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -36,6 +36,7 @@ menu "Host utilities"
>  	source "package/pru-software-support/Config.in.host"
>  	source "package/pwgen/Config.in.host"
>  	source "package/python-lxml/Config.in.host"
> +	source "package/python-six/Config.in.host"
>  	source "package/qemu/Config.in.host"
>  	source "package/raspberrypi-usbboot/Config.in.host"
>  	source "package/rauc/Config.in.host"
> diff --git a/package/python-six/Config.in.host b/package/python-six/Config.in.host
> new file mode 100644
> index 000000000000..1d37e768ae29
> --- /dev/null
> +++ b/package/python-six/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_PYTHON_SIX
> +	bool "host python-six"
> +	help
> +	  Six is a Python 2 and 3 compatibility library. It provides
> +	  utility functions for smoothing over the differences between
> +	  the Python versions with the goal of writing Python code that
> +	  is compatible on both Python versions.
> +
> +	  http://pythonhosted.org/six
> diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
> index 0edefe346fdb..850f9340d322 100644
> --- a/package/python-six/python-six.mk
> +++ b/package/python-six/python-six.mk
> @@ -12,3 +12,4 @@ PYTHON_SIX_LICENSE = MIT
>  PYTHON_SIX_LICENSE_FILES = LICENSE
>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
