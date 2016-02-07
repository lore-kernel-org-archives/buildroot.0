From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 14:24:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/iprutils: bump version to 2.4.10
In-Reply-To: <1454167529-26085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454167529-26085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207142405.23351d1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 16:25:28 +0100, Bernd Kuhls wrote:
> Upstream now provides a new autoconf-based build system, therefore
> our patches for Makefile are not needed anymore. The build system
> checks for function matherr in libm, this test fails so check for
> main().

Checking for main() is silly. Instead, I've changed the patch to check
for pow(), which is actually used by the iprconfig.c code. I've also
reformatted the patch with Git. Once again: whenever the upstream
project uses Git, *please* use Git to format the patches for that
package.

I also had to rework the gettext patch because the configure.ac script
was now checking for <libintl.h>, which doesn't exist in uClibc
toolchains if you haven't built gettext.

I've also submitted the two patches upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
