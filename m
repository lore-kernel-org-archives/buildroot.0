From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jul 2013 21:38:25 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20130707213825.170ad4fb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  7 Jul 2013 20:42:19 +0200, Samuel Martin wrote:
> MAKEFLAGS can carry options that make Buildroot failed, eg. '-jN'.
> To avoid this, unset the MAKEFLAGS environment variable.

Does unsetting MAKEFLAGS really allows to prevent top-level parallel
build on Buildroot? Or does it only prevents MAKEFLAGS from leaking to
the sub-make calls that we do to build packages?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
