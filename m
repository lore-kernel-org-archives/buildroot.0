From: Petr Cvek <petrcvekcz@gmail.com>
Date: Fri, 28 Jun 2019 19:07:40 +0200
Subject: [Buildroot] [BUG] host-python-2.7.16 fails to build on aarch64,
 luajit fails for soft float
Message-ID: <d596b57f-e046-ec2c-4413-e2a3f301412e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Trying to build an MIPS system on debian/sid/aarch64 machine fails to build python2 for the host. It seems the current used python has a bundled version of libffi, which doesn't yet support aarch64.

A temporary solution is to hardcopy libffi-3.3-rc0 into python source tree:

output/build/host-python-2.7.16/Modules/_ctypes/libffi

Alse luajit for the target fails to build for MIPS -msoft-float. This seems to be fixed in 2.1.0-beta3.
