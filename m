From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:20:02 +0200
Subject: [Buildroot] [PATCH v6 1/1] PyMySQL: new package
In-Reply-To: <1460497151-29117-1-git-send-email-stevecalfee@gmail.com>
References: <1460497151-29117-1-git-send-email-stevecalfee@gmail.com>
Message-ID: <20160413222002.3dfe7068@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Apr 2016 14:39:11 -0700, Steve Calfee wrote:
> add python to MySQL connection software, written in pure python
> 
> Signed-off-by: Steve Calfee <stevecalfee@gmail.com>

The title of the commit should have used the package name:

	python-pymysql: new package

> diff --git a/package/python-pymysql/Config.in b/package/python-pymysql/Config.in
> new file mode 100644
> index 0000000..d0db376
> --- /dev/null
> +++ b/package/python-pymysql/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PYMYSQL
> +	bool "python-pymysql"
> +	help
> +	  PyMySQL is a pure-Python MySQL client library. 

There was a trailing whitespace on this line.

Also, your patch did not apply due to a conflict in package/Config.in,
caused by packages that were added quite some time ago in Buildroot.
This seems to indicate that you are not working on top of the latest
master. Please submit patches that are based and tested on top of the
latest master.

I've applied after fixing the minor issues mentioned above. Thanks a
lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
