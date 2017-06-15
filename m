From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:13:32 +0200
Subject: [Buildroot] [PATCH v4 5/7]
 package/python-backports-shutil-get-terminal-size: New package
In-Reply-To: <20170612234216.902-6-andrew.smirnov@gmail.com>
References: <20170612234216.902-1-andrew.smirnov@gmail.com>
 <20170612234216.902-6-andrew.smirnov@gmail.com>
Message-ID: <20170615231332.5805b998@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 16:42:14 -0700, Andrey Smirnov wrote:
> Add 'python-backports-shutil-get-terminal-size'[1] package to
> buildroot. Needed by IPython when building against Python2.
> 
> [1] https://pypi.python.org/pypi/backports.shutil_get_terminal_size
> 
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  .../python-backports-shutil-get-terminal-size/Config.in    |  9 +++++++++
>  .../python-backports-shutil-get-terminal-size.hash         |  3 +++
>  .../python-backports-shutil-get-terminal-size.mk           | 14 ++++++++++++++

I think this one is probably the package with one of the longest name
in Buildroot.

> +config BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE
> +	bool "python-backports-shutil-get-terminal-size"
> +	depends on BR2_PACKAGE_PYTHON
> +	help
> +

Unnecessary empty new line was left here.

> +	  A backport of the get_terminal_size function from Python
> +	  3.3's shutil.
> +
> +	  https://pypi.python.org/pypi/backports.shutil_get_terminal_size

Fixed when applying, of course.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
