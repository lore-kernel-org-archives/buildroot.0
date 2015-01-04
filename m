From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 22:08:10 +0100
Subject: [Buildroot] [PATCH 1/1] python-django: new package
In-Reply-To: <1420244904-23270-1-git-send-email-oli.vogt.pub01@gmail.com>
References: <1420244904-23270-1-git-send-email-oli.vogt.pub01@gmail.com>
Message-ID: <20150104220810.131bd08d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear oli vogt,

On Sat,  3 Jan 2015 13:28:24 +1300, oli vogt wrote:

> diff --git a/package/python-django/Config.in b/package/python-django/Config.in
> new file mode 100644
> index 0000000..c48a381
> --- /dev/null
> +++ b/package/python-django/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_PYTHON_DJANGO
> +	bool "python-django"
> +	depends on BR2_PACKAGE_PYTHON

What about Python 3 ? Django supports both Python 2 and Python 3. I've
changed this to allow Django to be built with Python 3.

> +PYTHON_DJANGO_VERSION = 1.7.1

1.7.2 is out, so I've bumped to this version.

> +PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
> +PYTHON_DJANGO_SITE = https://www.djangoproject.com/download/$(PYTHON_DJANGO_VERSION)/tarball/

This didn't work, because the URL to download Django is just
https://www.djangoproject.com/download/$(PYTHON_DJANGO_VERSION)/tarball/,
while Buildroot expects $(PYTHON_DJANGO_SITE)/$(PYTHON_DJANGO_SOURCE).
So I've switched to pypi as the source for Django.

Patch applied with those changes, see
http://git.buildroot.net/buildroot/commit/?id=71d6705ef6a3516325891bc117b3253b49ca0f5f.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
