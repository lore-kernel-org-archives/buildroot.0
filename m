From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 22:38:07 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/icu: bump version to 64.2
In-Reply-To: <20190731055326.21813-1-bernd.kuhls@t-online.de>
References: <20190731055326.21813-1-bernd.kuhls@t-online.de>
Message-ID: <20190802223807.26340669@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Jul 2019 07:53:26 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated license hash after upstream commit:
> https://github.com/unicode-org/icu/commit/fc255de3f050271198074c7e8865a805d33c20c4
> 
> Added patch to fix big endian build.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This bump is breaking the build of icu on at least nios2 and xtensa:

  http://autobuild.buildroot.net/?reason=icu-64-2

It's due to the double conversion code that uses some architecture
specific definitions. However, the upstream double conversion code at
https://github.com/google/double-conversion/blob/master/double-conversion/utils.h
may have support for more architectures, and it's generally as easy as
adding an ifdef. We also have patches for a few packages in Buildroot
that also bundle double-conversion.

Could you have a look into this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
