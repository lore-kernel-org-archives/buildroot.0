From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Jun 2021 23:05:48 +0200
Subject: [Buildroot] [PATCH] scipts/autobuild-run: properly import
 urllib2.URLError
In-Reply-To: <20210605210016.1157351-1-yann.morin.1998@free.fr>
References: <20210605210016.1157351-1-yann.morin.1998@free.fr>
Message-ID: <20210605230548.5daa732c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Jun 2021 23:00:16 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 37766e9 (scripts/autobuild-run: add a retry loop to not fail on
> urllib URLError) introduced an import of URLError, but that raises
> exceptions in both python2 and python3:
> 
>     $ python2 -c 'import urllib2.URLError as URLError'
>     Traceback (most recent call last):
>       File "<string>", line 1, in <module>
>     ImportError: No module named URLError
> 
>     $ python3 -c 'import urllib.error.URLError as URLError'
>     Traceback (most recent call last):
>       File "<string>", line 1, in <module>
>     ModuleNotFoundError: No module named 'urllib.error.URLError'; 'urllib.error' is not a package
> 
> The working solution is to import from:
> 
>     $ python2 -c 'from urllib2 import URLError; raise URLError(None)'
>     Traceback (most recent call last):
>       File "<string>", line 1, in <module>
>     urllib2.URLError: <urlopen error None>
> 
>     $ python3 -c 'from urllib.error import URLError; raise URLError(None)'
>     Traceback (most recent call last):
>       File "<string>", line 1, in <module>
>     urllib.error.URLError: <urlopen error None>
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
