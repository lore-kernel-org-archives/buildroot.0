From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 11:48:49 +0100
Subject: [Buildroot] [PATCH 00/58] python pypi library mass version bump.
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170304114849.299197c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 14:11:57 -0500, Adam Duskett wrote:

> These python libraries updated using a tool I created that scanned every
> python package with a pypi url, checked if there was a update, and if there
> was automatically generated a patch.  It also checks to see if there is any
> patches in the patch directory, and if so checks to see if those patches were
> applied upstream.

So I was already skeptical with such a massive version bump, but you
said you had tested all of the packages. Clearly, the autobuilders have
spoken: it was insufficiently tested, and such massive version bumps
are a bad idea.

First of all, you didn't test "make legal-info", so it was broken for a
number of packages. We had to fix at least:

  python-pyasn
  https://git.buildroot.net/buildroot/commit/?id=aca82a056b04f1bc1d2578e414d8a8d1eaf66207

  python-enum
  https://git.buildroot.net/buildroot/commit/?id=d4235a8372ccaa54bc8322361a41003837d005a4

Then, a number of packages are missing new dependencies, and cause
build failures:

  python-cherrypy
  http://autobuild.buildroot.net/results/b66/b66f8fbce3a5127b69a09bdc91a460a3c107e29d/build-end.log

  python-pyasn
  http://autobuild.buildroot.net/results/27e1c6cdf330bd2009bf8895d8c72a7c4f5186af/

  python-pytrie
  http://autobuild.buildroot.net/results/e4209a2209bba769c264f8c4c6dfe2995443c243/

While I agree it is perfectly acceptable to have a few issues here, so
many issues clearly indicate a lack of testing, and confirm that such
massive bumps are a bad idea.

So I've reverted the bump of python-cherrypy, python-pyasn and
python-pytrie.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
