From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 May 2014 00:04:05 +0200
Subject: [Buildroot] jack2 issue is a python/python3 issue
Message-ID: <20140514000405.15b5a9db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I started investigating the jack2 build failure:

 http://autobuild.buildroot.org/?reason=jack2-ab409a65df95bc261ff72b52d6b3f4a65cf3266a

===
>>> jack2 ab409a65df95bc261ff72b52d6b3f4a65cf3266a Building
(cd /home/thomas/projets/buildroot/output/build/jack2-ab409a65df95bc261ff72b52d6b3f4a65cf3266a; ./waf build -j 5)
The project was not configured: run "waf configure" first!
make: *** [/home/thomas/projets/buildroot/output/build/jack2-ab409a65df95bc261ff72b52d6b3f4a65cf3266a/.stamp_built] Erreur 1
===

Building just jack2 works fine. What triggers the problem is if
host-python3 is built before jack2. So:

	make host-python3
	make jack2

Triggers the problem. It is also confirmed by the fact that all build
failures have BR2_PACKAGE_PYTHON3=y.

Samuel, it looks like waf doesn't like Python 3 somehow. However, some
quite Google search seems to indicate that waf is supposed to work ok
with Python 3. As our Python/Python3 issues expert, could you have a
look into this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
