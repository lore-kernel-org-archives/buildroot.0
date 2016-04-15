From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 22:47:58 +0200
Subject: [Buildroot] [PATCH v4 1/3] python-ptyprocess: new package
In-Reply-To: <1459042284-6684-2-git-send-email-viktorin@rehivetech.com>
References: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
 <1459042284-6684-2-git-send-email-viktorin@rehivetech.com>
Message-ID: <20160415224758.0ffaa918@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Mar 2016 03:31:22 +0200, Jan Viktorin wrote:
> v4
> * bump to 0.5.1
> * source https://pypi.python.org/pypi/ptyprocess
> * added hash file

The changelog should not be in the commit log, but...

> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---

 ... here.


> diff --git a/package/python-ptyprocess/Config.in b/package/python-ptyprocess/Config.in
> new file mode 100644
> index 0000000..4378943
> --- /dev/null
> +++ b/package/python-ptyprocess/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PTYPROCESS
> +	bool "python-ptyprocess"
> +	help
> +	  Launch a subprocess in a pseudo terminal (pty), and interact with

Line slightly too long, I've rewrapped.

> +	  both the process and its pty.
> +
> +	  https://github.com/pexpect/ptyprocess
> diff --git a/package/python-ptyprocess/python-ptyprocess.hash b/package/python-ptyprocess/python-ptyprocess.hash
> new file mode 100644
> index 0000000..3973414
> --- /dev/null
> +++ b/package/python-ptyprocess/python-ptyprocess.hash
> @@ -0,0 +1,4 @@
> +# got from https://pypi.python.org
> +md5sum	94e537122914cc9ec9c1eadcd36e73a1 ptyprocess-0.5.1.tar.gz
> +# computed manually
> +sha256sum 0530ce63a9295bfae7bd06edc02b6aa935619f486f0f1dc0972f516265ee81a6  ptyprocess-0.5.1.tar.gz

As you noticed yourself, this hash file was wrong.


> +PYTHON_PTYPROCESS_VERSION = 0.5.1
> +PYTHON_PTYPROCESS_SITE = https://pypi.python.org/pypi/ptyprocess

Same for the URL.

I've fixed up those issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
