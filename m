From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 22:49:12 +0200
Subject: [Buildroot] [PATCH v4 2/3] python-pexpect: new package
In-Reply-To: <1459042284-6684-3-git-send-email-viktorin@rehivetech.com>
References: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
 <1459042284-6684-3-git-send-email-viktorin@rehivetech.com>
Message-ID: <20160415224912.3886b9f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Mar 2016 03:31:23 +0200, Jan Viktorin wrote:
> v4
> * source https://pypi.python.org/pypi/pexpect
> * added hash file

The changelog should not be part of the commit, but should be ...

> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---

... here.


> diff --git a/package/python-pexpect/Config.in b/package/python-pexpect/Config.in
> new file mode 100644
> index 0000000..4d04c01
> --- /dev/null
> +++ b/package/python-pexpect/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_PEXPECT
> +	bool "python-pexpect"
> +	select BR2_PACKAGE_PYTHON_PTYPROCESS
> +	help
> +	  Pexpect is a pure Python module for spawning child applications;
> +	  controlling them; and responding to expected patterns in their
> +	  output. Pexpect works like Don Libes? Expect. Pexpect allows your
> +	  script to spawn a child application and control it as if a human
> +	  were typing commands.

Same thing: lines slightly too long.

> diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
> new file mode 100644
> index 0000000..0d1e1fe
> --- /dev/null
> +++ b/package/python-pexpect/python-pexpect.hash
> @@ -0,0 +1,4 @@
> +# got from https://pypi.python.org
> +md5sum	056df81e6ca7081f1015b4b147b977b7

Not even a file name here.

> +# computed manually:
> +sha256sum 232795ebcaaf2e120396dbbaa3a129eda51757eeaae1911558f4ef8ee414fc6c  pexpect-4.0.1.tar.gz

I've fixed up the hash file.

> +PYTHON_PEXPECT_VERSION = 4.0.1
> +PYTHON_PEXPECT_SITE = https://pypi.python.org/pypi/pexpect

And the _SITE variable.

> +PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
> +PYTHON_PEXPECT_LICENSE = ISC
> +PYTHON_PEXPECT_LICENSE_FILES = LICENSE
> +PYTHON_PEXPECT_SETUP_TYPE = distutils
> +PYTHON_PEXPECT_DEPENDENCIES = python-ptyprocess

And removed this dependency: it's only a run-time dependency, so it
only needs to be in the Config.in file.

Applied with those issues fixed, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
