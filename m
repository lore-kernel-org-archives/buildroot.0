From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 28 Jan 2020 00:35:49 +0200
Subject: [Buildroot] host-python-2.7 failure to build _hashlib
Message-ID: <CA+h21hors57FFbQzm0x2Rd_pABb95-GaxPOPiRQ5ZzB9NgT-Mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot community,

I have a noob question:

I am trying to complete a build and get this error for host-python:

Python build finished, but the necessary bits to build these modules
were not found:
_bsddb             _tkinter           bsddb185
dbm                dl                 gdbm
imageop            sunaudiodev
To find the necessary bits, look in setup.py in detect_modules() for
the module's name.


Failed to build these modules:
_hashlib

Ok, but I have to ask: why is host-python even built at all? For one
thing, BR2_PACKAGE_HOST_PYTHON is not set.
But with "make graph-depends", I am able to see that host-python is
dragged in by:
- python itself, which I selected
- host-python-setuptools (dragged in by python-lxml, which I selected)
- host-nodejs (dragged in by nodejs, which I selected)

Granted, I don't know much, but I'm baffled that:
- None of the above 3 packages select BR2_PACKAGE_HOST_PYTHON in their Config.in
- The Makefile doesn't complain that they don't (usually it does, when
packages add _DEPENDENCIES that are absent from Config.in)

When I enable BR2_PACKAGE_HOST_PYTHON and BR2_PACKAGE_HOST_PYTHON_SSL
in .config, I am able to carry on with the build.

Can somebody please explain what is going on?
I am not a proficient Python user either, by the way.

Regards,
-Vladimir
