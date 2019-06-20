From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 22:25:25 +0200
Subject: [Buildroot] [PATCH 6/6] package/python-wsgiref: new package
In-Reply-To: <20190531171654.17906-6-matthew.weber@rockwellcollins.com>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
 <20190531171654.17906-6-matthew.weber@rockwellcollins.com>
Message-ID: <20190620222525.0f8f96dd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 May 2019 12:16:54 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> The Web Server Gateway Interface (WSGI) package defines a
> standard interface between web server software and web
> applications.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

This module doesn't seem to be Python 3.x ready:

Traceback (most recent call last):
  File "setup.py", line 5, in <module>
    import ez_setup
  File "/home/thomas/projets/buildroot/output/build/python-wsgiref-0.1.2/ez_setup/__init__.py", line 170
    print "Setuptools version",version,"or greater has been installed."
                             ^
SyntaxError: Missing parentheses in call to 'print'. Did you mean print("Setuptools version",version,"or greater has been installed.")?
make[1]: *** [package/pkg-generic.mk:241: /home/thomas/projets/buildroot/output/build/python-wsgiref-0.1.2/.stamp_built] Error 1

> +PYTHON_WSGIREF_LICENSE = PSF or ZPL

Neither of these are valid SPDX license codes according to
https://spdx.org/licenses/.

Could you have a look at those two issues ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
