From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 21:50:52 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/{pkg-generic, python,
 python3}: add mechanism to exclude .py files from removal
In-Reply-To: <20191129190707.710738-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 29 Nov 2019 20:07:05 +0100")
References: <20191129190707.710738-1-thomas.petazzoni@bootlin.com>
 <20191129190707.710738-2-thomas.petazzoni@bootlin.com>
Message-ID: <87wobapkcz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When BR2_PACKAGE_PYTHON{,3}_PYC_ONLY=y, we force remove all .py files
 > from the system, as they have all been byte-compiled into their .pyc
 > variants.

 > However, it turns out that some packages (e.g: OpenCV) do some funky
 > things with a few .py files: they pass them through Python's
 > execfile() facility, which only works with .py files and not .pyc
 > files. It is used by OpenCV for example to read two small
 > configuration files.

 > In order to support such use cases, this commit introduces a very
 > simple mechanism by which packages can exclude some path patterns from
 > the .py removal: a per-package <pkg>_KEEP_PY_FILES variable that is
 > collected into a global PYTHON_KEEP_PY_FILES variable, then used by
 > the python/python3 target-finalize hooks.

 > This variable is intentionally not documented, this is really a hack
 > that we ideally would like to see go away, and we'd rather not see its
 > usage spread too much.

 > This is necessary to be able to fix bug #12171.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
