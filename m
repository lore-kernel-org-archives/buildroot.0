From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 10:58:30 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <52806C1C.7010206@zankel.net>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate> <52806C1C.7010206@zankel.net>
Message-ID: <20131111105830.67b0a602@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Zankel,

On Sun, 10 Nov 2013 21:33:16 -0800, Chris Zankel wrote:

> (I'm a bit surprised to get all those errors as binutils currently 
> doesn't build. Are you using an older toolchain, or are these packages 
> not dependent on the final binutils build?)

The binutils issues you're seeing are while building native binutils
for the target, not when building cross-binutils for the cross
compilation toolchain. Building the cross-binutils works ok, because
they are built against the build machine C library, which is glibc and
therefore has obstack stuff.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
