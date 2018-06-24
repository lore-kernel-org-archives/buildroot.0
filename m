From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Jun 2018 16:10:43 +0200
Subject: [Buildroot] [PATCH 1/1] Python Tornado bumped to version 5.0.2
In-Reply-To: <20180613142816.19691-1-polygon@wh2.tu-dresden.de>
References: <20180613142816.19691-1-polygon@wh2.tu-dresden.de>
Message-ID: <20180624161043.18941c1a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution. I've applied, after fixing a few things.
See below for details.

First, the commit title should follow the format:

	<package>: <description>

i.e:

	python-tornado: bump to version 5.0.2

(Notice that we don't use a past tense, but present tense. Indeed the
commit has not bumped to version 5.0.2, the commit is the thing bumping
to 5.0.2)

On Wed, 13 Jun 2018 16:28:16 +0200, Jan Dohl wrote:
> Tornado got a requirement on the SSL module in version 5.0.2
> which is also checked in the setup.py script before installing.
> Since the check in buildroot runs against the host-python which
> is built without SSL support, these checks fail.
> 
> In my opinion, adding OpenSSL support to host-python does not make

We generally try to avoid first person formulations such as "In my
opinion".

> sense since the Python on the target will be a different one. Instead,
> remove the checks (which, according to the source code comments
> essentially check for Python >= 2.7.9 / Python3 >= 3.4 which is
> true for current Buildroot) and select the SSL option of
> Python/Python3 when Tornado is selected.
> 
> Signed-off-by: Jan Dohl <polygon@wh2.tu-dresden.de>

> diff --git a/package/python-tornado/0001-remove-ssl-checks-on-install.patch b/package/python-tornado/0001-remove-ssl-checks-on-install.patch
> new file mode 100644
> index 0000000000..9bf858bbaa
> --- /dev/null
> +++ b/package/python-tornado/0001-remove-ssl-checks-on-install.patch
> @@ -0,0 +1,28 @@
> +diff -Naur python-tornado-5.0.2-orig/setup.py python-tornado-5.0.2/setup.py
> +--- python-tornado-5.0.2-orig/setup.py	2018-04-08 02:31:24.000000000 +0200
> ++++ python-tornado-5.0.2/setup.py	2018-06-13 13:27:50.990071928 +0200
> +@@ -15,7 +15,6 @@

Patches should have a description and Signed-off-by, and should be
Git-formatted if the upstream project uses Git (which is the case here).

I've fixed those issues and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
