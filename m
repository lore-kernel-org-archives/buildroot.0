From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:39:22 +0200
Subject: [Buildroot] [PATCH] package/python-tornado: only available for
 Python 3
In-Reply-To: <20191005154222.27923-1-arnout@mind.be>
References: <20191005154222.27923-1-arnout@mind.be>
Message-ID: <20191005223922.510fcf2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Oct 2019 17:42:22 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> Since the bump to 6.0.1, python-tornado has dropped support for Python 2
> and now needs Python >= 3.5 (cfr. setup.cfg).
> 
> Apparently this is not checked by setuptools, and apparently
> byte-compile is not done in the autobuilders, so there's not autobuild
> failure.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Asaf Kahlon <asafka7@gmail.com>
> Cc: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

You forgot the reverse dependencies of BR2_PACKAGE_PYTHON_TORNADO:
circus and python-tomako, both of which are available for both python2
and python3.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
