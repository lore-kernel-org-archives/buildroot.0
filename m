From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jul 2017 13:56:02 +0200
Subject: [Buildroot] [PATCH 1/2] Add BR2_CMAKE_USE_NINJA_BACKEND option
In-Reply-To: <20170106223748.2203-1-cedric.marie@openmailbox.org>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
Message-ID: <20170711135602.7cedcdf1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Reviving a fairly old thread.

On Fri,  6 Jan 2017 23:37:47 +0100, C?dric Marie wrote:

> Tested on following packages: cannelloni, graphite2, libcuefile,
> libubox, rabbitmq-c, ubus.

I ended up needing this patch to experiment for a project, so I took it
and tested. It generally works fine, but I found one Buildroot CMake
package that doesn't behave properly when the Ninja backend is used:
the "bullet" package.

With the "make" backend, it builds and installs fine, and everything
you expect is install to staging and target.

With the "ninja" backend, it builds and installs fine, but in fact the
only thing it installs to staging and target are two .cmake files. None
of the shared libraries or headers are installed.

The build log with the "make" backend clearly shows that lots of stuff
are being installed: http://code.bulix.org/sx2yb8-160329.

The build log with the "ninja" backend shows just two .cmake files
being installed to staging and target:
http://code.bulix.org/u145dq-160328.

Do you know why a CMake package could be working with the make backend,
but not with the ninja backend ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
