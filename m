From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 22:27:29 +0100
Subject: [Buildroot] [PATCH 3/3] axel: bump to version 2.16.1
In-Reply-To: <20171205054237.2150-3-ismael@iodev.co.uk>
References: <20171205054237.2150-1-ismael@iodev.co.uk>
 <20171205054237.2150-3-ismael@iodev.co.uk>
Message-ID: <20171206222729.280f8caa@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Dec 2017 02:42:37 -0300, Ismael Luceno wrote:
> Fixes building against static libssl.

This was missing a reference to the autobuilder failure being fixed, so
I've added one.

Also, your change to 2.16.1 mainly involves using pkg-config to detect
libssl. So you should have added host-pkgconf to the dependencies of
axel, otherwise you don't have the guarantee that pkg-config will be
available.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
