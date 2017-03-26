From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun, 26 Mar 2017 16:57:07 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-03-25
In-Reply-To: <r0ckqdx1de.ln2@ID-313208.user.individual.net>
References: <20170326062832.244E4207F8@mail.free-electrons.com>
 <r0ckqdx1de.ln2@ID-313208.user.individual.net>
Message-ID: <CABLs7GXLg+83YOqiTw=aBNv6s0jUw-n_rp1Skq6_LQmru8JOQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Bernd

2017-03-26 5:51 GMT-03:00 Bernd Kuhls <bernd.kuhls@t-online.de>:

> I can not reproduce these build errors. Apparently they only occur on the
> autobuilder of Richard Braun. Could this be a local problem?

I've managed to reproduce this failure by making sure no zlib dev
files were present on my host (removed zlib1g-dev package on my Debian
distribution). The ghostscript configure script checks for zlib on the
host while configuring the buld of some auxiliary programs and fails
if it's not found.

I'm submitting a patch that fixes the issue by adding 'host-zlib' as a
dependency in 'package/ghostscript/ghostscript.mk'.

Regards,
Rodrigo
