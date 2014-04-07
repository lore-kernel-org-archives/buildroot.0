From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 7 Apr 2014 16:19:44 +0200
Subject: [Buildroot] [PATCH v1] Python script to check package version
In-Reply-To: <1396793937-6868-1-git-send-email-arnaud@intelibre.fr>
References: <1396793937-6868-1-git-send-email-arnaud@intelibre.fr>
Message-ID: <CAAXf6LULqUjhD-R=W4nKJx6Xs15ic+5+GgNW6jW49SG6Kui=fA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnaud,

On Sun, Apr 6, 2014 at 4:18 PM, Arnaud Aujon <arnaud@intelibre.fr> wrote:
> This patch introduce a new Python script to check package upstream version.
> It aims to replace the current 'pkg-stats' script used by the autobuild server.
> For every package, information available is :
>  * patch count
>  * infrastructure
>  * presence of licence files
>  * current version
>  * last upstream version
>
> Signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
> ---
>  support/scripts/check-updates.py | 826 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 826 insertions(+)
>  create mode 100755 support/scripts/check-updates.py
>
> diff --git a/support/scripts/check-updates.py b/support/scripts/check-updates.py
> new file mode 100755
> index 0000000..de16fdc
> --- /dev/null
> +++ b/support/scripts/check-updates.py
> @@ -0,0 +1,826 @@
> +#!/usr/bin/env python
> +# -*- coding: utf-8 -*-
> +"""
> +check-updates script
> +"""
> +import sys
> +import urllib2
> +import httplib2
> +from ftplib import FTP
> +import ftplib
> +import re
> +from os import listdir, walk
> +from os.path import exists, isfile, join
> +import shutil
> +from distutils.version import LooseVersion
> +import logging
> +from logging import info, debug, error
> +from subprocess import check_output
> +import pickle

Why are you using both 'import X' and 'from X import Y' ?
According to me, it's cleaner to only use 'import X' and use explicit
references X.Y when accessing Y.

[..]

> +# vim uses hg

For hg, there is no alternative to 'git ls-remote'.
You either have to obtain the info from the website, or an hg browser,
or clone the repo and check it locally.
To get the list of tags, use 'hg tags'.

Best regards,
Thomas
