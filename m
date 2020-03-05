From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:11:37 +0100
Subject: [Buildroot] [PATCH/next v2 3/3] package/libevdev: convert to
 meson
In-Reply-To: <20200302150907.5812-3-ps.report@gmx.net>
References: <20200302150907.5812-1-ps.report@gmx.net>
 <20200302150907.5812-3-ps.report@gmx.net>
Message-ID: <20200305231137.1ab41db3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Mar 2020 16:09:07 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - drop legacy patch 0001-configure-add-disable-runtime-tests-option.patch
>   and use -Dtests=disabled instead
> 
> - drop host-pkgconf dependency as pkgconf is only used in case tests
>   are enabled to find the check package (checked via meson output -
>   no 'Found pkg-config' - and via strace)
> 
> - update host-python dependecy to host-python3 as the script
>   libevdev/make-event-names.py which is used to generate the
>   header file event-names.h is updated to python3:
>   '#!/usr/bin/env python3'
>   This made no difference with autotools build as the script
>   was called with '$(PYTHON) libevdev/make-event-names.py'.
> 
> - add patch to fix tools compile with older toolchains adding
>   the local include path (only the meson build is affected)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've changed the host-python3 dependency to use
$(BR2_PYTHON3_HOST_DEPENDENCY) instead, so that we only build
host-python3 is not Python 3.x interpreter is available. And I applied
to next.

But anyway as replied on PATCH 1/3, we have an issue where host-python3
doesn't build if there's no Python 3.x interpreter available on the
build machine.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
