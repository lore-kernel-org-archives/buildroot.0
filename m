From: Ben Boeckel <mathstuf@gmail.com>
Date: Mon, 27 Feb 2017 15:08:27 -0500
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <1488225846.14030.1.camel@embedded.rocks>
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
 <1488215544.31837.9.camel@embedded.rocks>
 <20170227172540.GA17670@free.fr>
 <1488225846.14030.1.camel@embedded.rocks>
Message-ID: <20170227200827.GA14356@megas.kitware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 27, 2017 at 21:04:06 +0100, J?rg Krause wrote:
> I still think this is a bug! A host rpath should not be used when
> cross-compiling whether lib32 is used or not. Somehow, it feels weird
> to say that Buildroot is not a Linux platform, in the sense of CMake.

There's the chance that this was always a problem, but is now being
exposed by this. Where is the lib32 rpath coming from? CMake doesn't add
rpaths by default, so it has to be coming from somewhere. Is it added
manually somewhere? Is a library that used to be found in the sysroot
now being found on the host? If so, *that's* the bug which should be
fixed. Given how widespread it is, maybe something is set up incorrectly
in the toolchain file?

This flag is the same logic as lib64, just with a different suffix. Why
is the problem not surfacing on Red Hat platforms which use lib64?

--Ben
