From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  5 Jan 2016 08:17:21 +0100
Subject: [Buildroot] [PATCH v2 0/3] CFFI backend
Message-ID: <1451978244-15878-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series introduces CFFI backend for Python packages. CFFI
can cross-compile C library wrappers and create *.py and *.so files
for the target rootfs. In order to do so CFFI uses pycparser to 
parse C heasers/sources. The target variant of CFFI is working with
already prepared *.py and *.so files and doesn't need pycparser any
longer.

The libffi headers patch is needed, because only headers for target
variant will be copied to the proper destination and host packages,
that don't use pkg-config cannot find libffi headers at its default
location.

Yegor
