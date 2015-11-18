From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 19:39:09 +0100
Subject: [Buildroot] [PATCH 1/1] chrony: bump to version 2.2
In-Reply-To: <1447864764-2208-1-git-send-email-james.knight@rockwellcollins.com>
References: <1447864764-2208-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151118193909.7b400bb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

On Wed, 18 Nov 2015 11:39:24 -0500, James Knight wrote:
> With the new version, documentation is not generated part of the main
> build. This removes the need to alter the Makefile to remove the invoke
> on the `chrony.txt` target. Cleanup also allows a switch to using
> autotools and explicitly disabling seccomp (since its experimental) and
> tomcrypt (Buildroot does not have libtomcrypt at this time).
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/chrony/chrony.hash |  6 +++---
>  package/chrony/chrony.mk   | 29 ++++++++---------------------
>  2 files changed, 11 insertions(+), 24 deletions(-)

Chrony's configure script is not using autoconf, so we should not be
using the autotools package infrastructure for this package.

The reason is quite simple: while it may happens that the
autotools-package infrastructure works fine *today* with Chrony's
configure script, we might change the autotools-package infrastructure
in the future to do things that are perfectly valid with regular
autoconf-generated configure script, but not with Chrony's configure
script.

So I would prefer to keep using the generic-package infrastructure for
this package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
