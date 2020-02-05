From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 16:42:50 +0100
Subject: [Buildroot] [PATCH 1/3] package/python-iniparse: bump to
 version 0.5
In-Reply-To: <20200205141149.20749-2-titouan.christophe@railnova.eu>
References: <20200205141149.20749-1-titouan.christophe@railnova.eu>
 <20200205141149.20749-2-titouan.christophe@railnova.eu>
Message-ID: <20200205164250.338d5c6e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  5 Feb 2020 15:11:47 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Also, iniparse now requires six.
> This has been detected thanks to the runtime tests.

It would have been good to mention in the commit log that it now supports Python 3.

>  config BR2_PACKAGE_PYTHON_INIPARSE
>  	bool "python-iniparse"
> -	depends on BR2_PACKAGE_PYTHON
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

This is not needed when both are supported, since Python modules
Config.in files are only included when python || python3, from
package/Config.in.

Applied with the above issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
