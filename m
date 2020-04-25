From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 22:53:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-bsdiff4: new packge
In-Reply-To: <20200227204335.25823-1-asafka7@gmail.com>
References: <20200227204335.25823-1-asafka7@gmail.com>
Message-ID: <20200425225358.1dcd475b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Feb 2020 22:43:35 +0200
Asaf Kahlon <asafka7@gmail.com> wrote:

> License file isn't shipped with the package, so PKG-INFO
> is used instead.

I am concerned by the license here.

> +PYTHON_BSDIFF4_VERSION = 1.1.9
> +PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
> +PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/39/34/bd2ae6cd4b2a5d3af9173a9d7f6ecd2723ea7b0401ad807a0c7e7b50faa3
> +PYTHON_BSDIFF4_LICENSE = BSD-2-Clause
> +PYTHON_BSDIFF4_LICENSE_FILES = PKG-INFO

PKG-INFO only says "BSD", and nothing in the source code indicates what
is the license.

The only indication is in core.c, which contains:

/*
  The code below is mostly derived from cx_bsdiff (written by Anthony
  Tuininga, http://cx-bsdiff.sourceforge.net/).  The cx_bsdiff code in
  turn was derived from bsdiff, the standalone utility produced for BSD
  which can be found at http://www.daemonology.net/bsdiff.
*/

If we visit http://cx-bsdiff.sourceforge.net/ we can find
http://cx-bsdiff.sourceforge.net/LICENSE.txt, which is not the
BSD-2-Clause, but some weird license called the "BSD Protection
License", which is known by SPDX as BSD-Protection:
https://spdx.org/licenses/BSD-Protection.html

Could you try to clarify what is the license of this package ? It would
be really good for PyPi to be a bit more "strict" in the description of
the licenses.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
