From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 6 Mar 2017 09:35:04 +0100
Subject: [Buildroot] scanpypi issue
Message-ID: <CAGm1_kvsxjS=ucWKnczVfqySJs76+=8OEfVByfpG31FhdxoGyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm facing strange scanpypi failure on all my systems Debian 8/9 and
Fedora 25. So far nothing has changed on scanpypi side since it was
working. I get following output:

user at debian9:~/Documents/versioned/buildroot$ ./support/scripts/scanpypi --help
Traceback (most recent call last):
  File "./support/scripts/scanpypi", line 47, in <module>
    import setuptools
  File "/usr/lib/python2.7/dist-packages/setuptools/__init__.py", line
10, in <module>
    from setuptools.extern.six.moves import filter, map
  File "/usr/lib/python2.7/dist-packages/setuptools/extern/__init__.py",
line 1, in <module>
    from pkg_resources.extern import VendorImporter
  File "/usr/lib/python2.7/dist-packages/pkg_resources/__init__.py",
line 40, in <module>
    from pkgutil import get_importer
ImportError: cannot import name get_importer

The strange thing is, if I invoke scanpypi in a debugger i.e. "pudb
support/scripts/scanpypi" everyting is working as expected.

Any idea? Am I the only one experiencing such problems?

Yegor
