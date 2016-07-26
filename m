From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 13:48:46 +0200
Subject: [Buildroot] [PATCH] ipkg: fix no MMU musl build
In-Reply-To: <8aa4f13e1f931315ebfe037e16c7e5761c6f97eb.1469531300.git.baruch@tkos.co.il>
References: <8aa4f13e1f931315ebfe037e16c7e5761c6f97eb.1469531300.git.baruch@tkos.co.il>
Message-ID: <20160726134846.1a859d30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 14:08:20 +0300, Baruch Siach wrote:
> Current code uses vfork() instead of fork() only when __UCLIBC__ is defined.
> This breaks musl MMU-less build. Add a patch making direct use of HAVE_FORK
> that configure defines when fork() is detected.

See my previous reply: there is no platform in Buildroot that uses musl
on noMMU systems. The only noMMU architecture supported by musl is
SuperH as far as I know, so there is 0 chance that the ARM and m68k
noMMU failures are caused by musl related issues.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
